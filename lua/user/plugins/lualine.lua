-- LSP clients attached to buffer
local clients_lsp = function ()
  local bufnr = vim.api.nvim_get_current_buf()

  local clients = vim.lsp.buf_get_clients(bufnr)
  if next(clients) == nil then
    return ''
  end

  local c = {}
  for _, client in pairs(clients) do
    table.insert(c, client.name)
  end
  return '\u{f085} ' .. table.concat(c, '|')
end

local lsp_progress = function ()
  local messages = vim.lsp.util.get_progress_messages()
  if #messages == 0 then
    return
  end
  local status = {}
  for _, msg in pairs(messages) do
    table.insert(status, (msg.percentage or 0) .. "%% " .. (msg.title or ""))
  end
  local spinners = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
  local ms = vim.loop.hrtime() / 1000000
  local frame = math.floor(ms / 120) % #spinners
  return table.concat(status, " | ") .. " " .. spinners[frame + 1]
end


local config = {
  options = {
    icons_enabled = true,
    theme = 'rose-pine',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
      'NvimTree',
      'alpha',
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename', clients_lsp},
    -- lualine_c = {'filename', lsp_progress},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

require('lualine').setup(config)
