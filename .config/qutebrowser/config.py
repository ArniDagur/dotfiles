# vim: filetype=python

# Enable JavaScript
config.set('content.javascript.enabled', True, 'file://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')

# -- Search engines --
c.url.searchengines = {
    'DEFAULT': 'https://www.google.com/search?q={}',
    'ddg': 'https://duckduckgo.com/?q={}'
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

# config.set('content.user_stylesheets', 'stylesheets/overcast.fm.css', '*://*.overcast.fm/*')

# -- Editor --
c.editor.command = ['vim', '-f', '{file}', '-c', 'normal {line}G{column0}l']
c.editor.encoding = 'utf-8'

# -- Keybindings --
config.bind('<Space>', 'set-cmd-text -s :open')
config.bind('<Shift-Space>', 'set-cmd-text -s :open -t')

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
