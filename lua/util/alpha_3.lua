local M = {}

M.str = [[⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀    ⣷⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀            
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠙⠻⣿⣿⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀            
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⣿⣿⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀            
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⣿⣷⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣆⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀            
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⢿⣿⣦⣄⠀⢦⡀⠀⠀⠀⢸⣿⣆⠀⠀⢀⣴⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀            
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣷⣜⣿⣦⣶⣾⣿⠿⠿⠿⣿⣿⣿⣇⡀⠀⠀⠀⣀⠀⠀              
   ████  ███  ███████████⣿⣿⣟⠋⠁⠀⠀⠀⠀⠀⠈⠙⢿⣿⣶⣶⡟⠁⠀████   ███  
    ████  ███    ███        ⠀⠙⢿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⡀⠀⠀ ████  ███   
    ████ ███    ███        ⠀⠀⠀⠙⢿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣧⣀⣀⣀ ████ ███   
    █ █████    ███▄▄▄▄▄▄  ⠀⠀⠀⠀⠀⠻⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⣿⡿⠛⠉⠀  ██████   
    ██ ████    ███▀▀▀▀▀▀  ⠀⠀⠀⠀⠀⠀⠈⣿⣿⡀⠀⠀⠀⠀⠀⢰⣿⡷⠀⠀⠀   █████   
    ███  ███    ███        ⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣆⠀⠀⠀⠀⣼⣿⣷⣄⠀⠀    ████   
    ███   ███    ███        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣆⠀⣠⣾⡿⠉⠉⠉⠁⠀     ████   
⠀⠀⠀███   ████  ███████████⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⡀⠀⠀⠀⠀⠀      ████   
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣯⠛⢇⠀⠀⠀⠀⠀⠀⠀            
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣧⠀⠀⠀⠀⠀⠀⠀⠀            
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣇⠀⠀⠀⠀⠀⠀⠀            
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⡄⠀⠀⠀⠀⠀⠀            
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⡀⠀⠀⠀⠀⠀            
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢇⠀⠀⠀⠀⠀            
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡄⠀⠀⠀⠀            
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠡⠀⠀⠀⠀            
]]
M.header = vim.split(M.str, "\n")

vim.api.nvim_set_hl(0, "F4E656", {fg = "#F4E656"})
vim.api.nvim_set_hl(0, "FFFFFF", {fg = "#FFFFFF"})

M.hl_group = {
  {{"F4E656", 0, -1}},
  {{"F4E656", 0, -1}},
  {{"F4E656", 0, -1}},
  {{"F4E656", 0, -1}},
  {{"F4E656", 0, -1}},
  {{"F4E656", 0, -1}},
  {{"F4E656", 0, -1}},
  {{"F4E656", 0, -1}, {"FFFFFF", 1, 80}, {"FFFFFF", 136, -1}},
  {{"F4E656", 0, -1}, {"FFFFFF", 1, 48}, {"FFFFFF", 116, -1}},
  {{"F4E656", 0, -1}, {"FFFFFF", 1, 48}, {"FFFFFF", 120, -1}},
  {{"F4E656", 0, -1}, {"FFFFFF", 1, 70}, {"FFFFFF", 132, -1}},
  {{"F4E656", 0, -1}, {"FFFFFF", 1, 70}, {"FFFFFF", 132, -1}},
  {{"F4E656", 0, -1}, {"FFFFFF", 1, 48}, {"FFFFFF", 120, -1}},
  {{"F4E656", 0, -1}, {"FFFFFF", 1, 48}, {"FFFFFF", 120, -1}},
  {{"F4E656", 0, -1}, {"FFFFFF", 1, 84}, {"FFFFFF", 148, -1}},
  {{"F4E656", 0, -1}},
  {{"F4E656", 0, -1}},
  {{"F4E656", 0, -1}},
  {{"F4E656", 0, -1}},
  {{"F4E656", 0, -1}},
  {{"F4E656", 0, -1}},
  {{"F4E656", 0, -1}},
  {{"F4E656", 0, -1}},
}

M.init = function ()

  local lines = {}
  for i = 1, #M.header do
    io.write(i)
    local line = {
      type = "text",
      val = M.header[i],
      opts = {
        position = "center",
        hl = M.hl_group[i],
      }
    }
    table.insert(lines, line)
  end

  return {
    type = "group",
    val = lines,
  }
end

return M
