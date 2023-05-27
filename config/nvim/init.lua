require('arjun.base')
require('arjun.highlights')
require('arjun.maps')
require('arjun.plugins')

local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"
local is_wsl = has "wsl"

if is_mac == 1 then
  require('arjun.macos')
end
if is_win == 1 then
  require('arjun.windows')
end
if is_wsl == 1 then
  require('arjun.wsl')
end
