local _M = {
   terminal    = os.getenv('TERMINAL') or 'alacritty',
   editor      = os.getenv('EDITOR')   or 'vim',
   browser     = 'firefox',
   nitrogen    = 'nitrogen',
   files       = 'pcmanfm'
}

_M.editor_cmd = _M.terminal .. ' -e ' .. _M.editor
_M.manual_cmd = _M.terminal .. ' -e man awesome'

return _M
