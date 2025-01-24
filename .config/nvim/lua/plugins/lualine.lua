return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = function()
    local Job = require('plenary.job')
    local async = require('plenary.async')

    local get_wakatime_time = function()
      local tx, rx = async.control.channel.oneshot()
      local ok, job = pcall(Job.new, Job, {
        command = os.getenv('HOME') .. '/.wakatime/wakatime-cli',
        args = { '--today' },
        on_exit = function(j, _)
          tx(j:result()[1] or '')
        end,
      })
      if not ok then
        vim.notify('Bad WakaTime call: ' .. job, 'warn')
        return ''
      end

      job:start()
      return rx()
    end

    ---@diagnostic disable
    local state = {
      comp_wakatime_time = 'loading...',
      iterate = -1,
    }

    -- Yield statusline value
    local wakatime = function()
      if state.iterate == 600 or state.iterate == -1 then
        async.run(get_wakatime_time, function(time)
          state.comp_wakatime_time = time
        end)
        state.iterate = 0
      end

      state.iterate = state.iterate + 1

      return '󱑆 ' .. state.comp_wakatime_time
    end

    return {
      options = {
        -- icons_enabled = false,
        theme = 'ayu_mirage',
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_x = { wakatime },
        lualine_y = { 'encoding', 'fileformat', 'filetype' },
      },
    }
  end,
}
