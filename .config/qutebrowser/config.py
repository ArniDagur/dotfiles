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
