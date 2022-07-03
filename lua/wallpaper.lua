local M = {}

function M.next_wallpaper()
  os.execute('/usr/bin/variety -n > /dev/null 2>&1')
end

function M.previous_wallpaper()
  os.execute('/usr/bin/variety -p > /dev/null 2>&1')
end

return M
