# vim: filetype=python:et:ts=4:sts=4:sw=4
import os

config.set('content.javascript.enabled', True, 'file://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')

# -- Search engines --
c.url.searchengines = {
    'DEFAULT': 'https://www.google.com/search?q={}',
    'g': 'https://www.google.com/search?q={}',
    'd': 'https://duckduckgo.com/?q={}',
    'aur': 'https://aur.archlinux.org/packages/?K={}&SO=d&SB=p&PP=250',
    'aw': 'https://wiki.archlinux.org/index.php?search={}'
}
# Open base URL of searchengine if shortcut is invoked without parameters
c.url.open_base_url = True

# -- Startpages --
_DEFAULT_PAGE = 'https://www.google.com/'
c.url.default_page = _DEFAULT_PAGE
c.url.start_pages = _DEFAULT_PAGE

# -- Hints --
c.hints.mode = 'letter'
c.hints.chars = 'dstnriaeo' # Home row
c.hints.min_chars = 1

# -- Content --
c.content.pdfjs = True # Allow pdf.js to view PDF files in the browser

# -- Editor --
if os.path.isfile('/usr/bin/alacritty'):
    _TERMINAL = '/usr/bin/alacritty'
else:
    _TERMINAL = os.environ['TERMINAL']
c.editor.command = [_TERMINAL, '-e',
                    'nvim', '-f', '{file}',
                    '-c', 'set ft=qutebrowser cc=|normal {line}G{column0}l']
c.editor.encoding = 'utf-8'

# -- QT settings --
#  c.qt.low_end_device_mode = 'never'

# -- Spellcheck --
c.spellcheck.languages = ['en-GB']

# -- Keybindings --
config.bind('<Space>', 'set-cmd-text -s :open')
config.bind('<Shift-Space>', 'set-cmd-text -s :open -t')
config.bind('<Control-Shift-Space>', 'set-cmd-text -s :open -w')

# Normal
config.bind('u', 'scroll up')
config.bind('U', 'tab-next')
config.bind('a', 'scroll left')
config.bind('A', 'back')
config.bind('e', 'scroll down')
config.bind('E', 'tab-prev')
config.bind('o', 'scroll right')
config.bind('O', 'forward')

config.bind('xd', 'download-cancel') # Cancel download; ad --> xd
config.bind('z', 'undo') # Undo; u --> z

# Caret
config.bind('U', 'scroll up', mode='caret')
config.bind('A', 'scroll left', mode='caret')
config.bind('E', 'scroll down', mode='caret')
config.bind('O', 'scroll right', mode='caret')
config.bind('a', 'move-to-prev-char', mode='caret')
config.bind('o', 'move-to-next-char', mode='caret')
config.bind('e', 'move-to-next-line', mode='caret')
config.bind('u', 'move-to-prev-line', mode='caret')
config.bind('f', 'move-to-prev-word', mode='caret')
config.bind('b', 'move-to-next-word', mode='caret')
config.bind('F', 'move-to-start-of-line', mode='caret')
config.bind('B', 'move-to-end-of-line', mode='caret')
