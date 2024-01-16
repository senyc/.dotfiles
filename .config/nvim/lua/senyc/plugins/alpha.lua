local get_project_name = require 'senyc.utils'.get_project_name
return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  config = function()
    local theme = {}

    local default_terminal = {
      type = 'terminal',
      command = nil,
      width = 69,
      height = 8,
      opts = {
        redraw = true,
        window_config = {},
      },
    }

    local default_header = {
      type = 'text',
      val = {
        [[=================     ===============     ===============   ========  ========]],
        [[\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //]],
        [[||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||]],
        [[|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||]],
        [[||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||]],
        [[|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||]],
        [[||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||]],
        [[|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||]],
        [[||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||]],
        [[||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||]],
        [[||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||]],
        [[||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||]],
        [[||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||]],
        [[||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||]],
        [[||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||]],
        [[||.=='    _-'                                                     `' |  /==.||]],
        [[=='    _-'                        N E O V I M                         \/   `==]],
        [[\   _-'                                                                `-_   /]],
        [[ `''                                                                      ``' ]],
      },
      opts = {
        position = 'center',
        hl = 'Type',
        -- wrap = "overflow";
      },
    }

    local function get_home_dir()
      return os.getenv("HOME") or os.getenv("USERPROFILE") or ""
    end

    local err, git_dir = get_project_name()
    if err then
      git_dir = vim.fn.getcwd()
      local home_dir = get_home_dir()
      if home_dir ~= "" then
        git_dir = git_dir:gsub(home_dir, "~")
      end
    end
    local footer = {
      type = 'text',
      val = '-- ' .. git_dir:gsub('%.', '') .. ' --',
      opts = {
        position = 'center',
        hl = 'Number',
      },
    }

    local leader = '<leader>'

    --- @param sc string
    --- @param txt string
    --- @param keybind string? optional
    --- @param keybind_opts table? optional
    local function button(sc, txt, keybind, keybind_opts)
      local sc_ = sc:gsub('%s', ''):gsub(leader, '<leader>')

      local opts = {
        position = 'center',
        shortcut = sc,
        cursor = 3,
        width = 50,
        align_shortcut = 'right',
        hl_shortcut = 'Keyword',
      }
      if keybind then
        keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
        opts.keymap = { 'n', sc_, keybind, keybind_opts }
      end

      local function on_press()
        local key = vim.api.nvim_replace_termcodes(keybind or sc_ .. '<Ignore>', true, false, true)
        vim.api.nvim_feedkeys(key, 't', false)
      end

      return {
        type = 'button',
        val = txt,
        on_press = on_press,
        opts = opts,
      }
    end

    local buttons = {
      type = 'group',
      val = {
        button('<leader>ff', '󰈞  Find file'),
        button('<leader>fg', '󰈬  Find word'),
        button('<leader>fe', '󱏒  File explorer'),
        button('<leader>fc', '  Find commit'),
        button('<leader>fo', '  Old files'),
      },
      opts = {
        spacing = 1,
      },
    }

    local section = {
      terminal = default_terminal,
      header = default_header,
      buttons = buttons,
      footer = footer,
    }

    theme.layout = {
      { type = 'padding', val = 1 },
      section.header,
      { type = 'padding', val = 1 },
      section.buttons,
      { type = 'padding', val = 2 },
      section.footer,
    }
    theme.opts = {
      margin = 5,
    }

    require 'alpha'.setup(theme)
  end
}
