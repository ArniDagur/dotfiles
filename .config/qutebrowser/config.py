# vim: filetype=python:et:ts=4:sts=4:sw=4
import os

config.set("content.javascript.enabled", True, "file://*")
config.set("content.javascript.enabled", True, "chrome://*/*")
config.set("content.javascript.enabled", True, "qute://*/*")

# -- Search engines --
c.url.searchengines = {
    "DEFAULT": "https://www.google.com/search?q={}",
    "g": "https://www.google.com/search?q={}",
    "d": "https://duckduckgo.com/?q={}",
    "aur": "https://aur.archlinux.org/packages/?K={}&SO=d&SB=p&PP=250",
    "aw": "https://wiki.archlinux.org/index.php?search={}",
}
# Open base URL of searchengine if shortcut is invoked without parameters
c.url.open_base_url = True

# -- Content --
c.content.cache.size = 2147483648  # 2 GiB

# Ad blocking
#  c.content.host_blocking.enabled = False
#  c.content.host_blocking.lists = [
    #  "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts",
    #  "https://mirror1.malwaredomains.com/files/justdomains",
    #  "http://sysctl.org/cameleon/hosts",
    #  "https://zeustracker.abuse.ch/blocklist.php?download=domainblocklist",
    #  "https://s3.amazonaws.com/lists.disconnect.me/simple_tracking.txt",
    #  "https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt",
    #  "https://s3.amazonaws.com/lists.disconnect.me/simple_malvertising.txt",
    #  #  "https://hosts-file.net/ad_servers.txt",
    #  #  "https://hosts-file.net/exp.txt",
    #  #  "https://hosts-file.net/emd.txt",
    #  #  "https://hosts-file.net/psh.txt",
    #  "https://mirror.cedia.org.ec/malwaredomains/immortal_domains.txt",
    #  "https://www.malwaredomainlist.com/hostslist/hosts.txt",
    #  "https://bitbucket.org/ethanr/dns-blacklists/raw/8575c9f96e5b4a1308f2f12394abd86d0927a4a0/bad_lists/Mandiant_APT1_Report_Appendix_D.txt",
    #  "https://v.firebog.net/hosts/Prigent-Malware.txt",
    #  "https://v.firebog.net/hosts/Prigent-Phishing.txt",
    #  "https://phishing.army/download/phishing_army_blocklist_extended.txt",
    #  "https://gitlab.com/quidsup/notrack-blocklists/raw/master/notrack-malware.txt",
    #  "https://ransomwaretracker.abuse.ch/downloads/RW_DOMBL.txt",
    #  "https://ransomwaretracker.abuse.ch/downloads/CW_C2_DOMBL.txt",
    #  "https://ransomwaretracker.abuse.ch/downloads/LY_C2_DOMBL.txt",
    #  "https://ransomwaretracker.abuse.ch/downloads/TC_C2_DOMBL.txt",
    #  "https://ransomwaretracker.abuse.ch/downloads/TL_C2_DOMBL.txt",
    #  "https://v.firebog.net/hosts/Shalla-mal.txt",
    #  "https://raw.githubusercontent.com/StevenBlack/hosts/master/data/add.Risk/hosts",
    #  "https://www.squidblacklist.org/downloads/dg-malicious.acl",
    #  "https://raw.githubusercontent.com/HorusTeknoloji/TR-PhishingList/master/url-lists.txt",
    #  "https://v.firebog.net/hosts/Airelle-hrsk.txt",
    #  "https://v.firebog.net/hosts/Easyprivacy.txt",
    #  "https://v.firebog.net/hosts/Prigent-Ads.txt",
    #  "https://gitlab.com/quidsup/notrack-blocklists/raw/master/notrack-blocklist.txt",
    #  "https://raw.githubusercontent.com/StevenBlack/hosts/master/data/add.2o7Net/hosts",
    #  "https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt",
#  ]
#  c.content.host_blocking.whitelist = ["piwik.org", "kiwifarms.net"]

c.content.blocking.hosts.enabled = False
c.content.blocking.adblock.lists = [
    "https://easylist.to/easylist/easylist.txt",
    "https://easylist.to/easylist/easyprivacy.txt",
    "https://easylist-downloads.adblockplus.org/easylist-cookie.txt",
    "https://easylist.to/easylist/fanboy-social.txt",
    "https://easylist.to/easylist/fanboy-annoyance.txt",
    "https://adblock.gardar.net/is.abp.txt",
    "https://www.fanboy.co.nz/enhancedstats.txt",
    "file:///home/arni/filters"
]
c.content.blocking.adblock.enabled = True

# -- Startpages --
_DEFAULT_PAGE = "https://www.google.com/"
c.url.default_page = _DEFAULT_PAGE
c.url.start_pages = _DEFAULT_PAGE

# -- Hints --
c.hints.mode = "letter"
c.hints.chars = "dstnriaeo"  # Home row
c.hints.min_chars = 1

# -- Editor --
if os.path.isfile("/usr/bin/alacritty"):
    _TERMINAL = "/usr/bin/alacritty"
else:
    _TERMINAL = os.environ["TERMINAL"]
c.editor.command = [
    _TERMINAL,
    "-e",
    "nvim",
    "-f",
    "{file}",
    "-c",
    "set ft=qutebrowser cc=|normal {line}G{column0}l",
]
c.editor.encoding = "utf-8"

# -- Spellcheck --
c.spellcheck.languages = ["en-GB"]

# -- Keybindings --

config.bind("gS", r"open -t https://web.archive.org/save/{url}")

# ------------------------------------------------------------------------------

config.bind("<Space>", "set-cmd-text -s :open")
config.bind("<Shift-Space>", "set-cmd-text -s :open -t")
config.bind("<Control-Shift-Space>", "set-cmd-text -s :open -w")

# Normal
config.bind("u", "scroll up")
config.bind("U", "tab-next")
config.bind("a", "scroll left")
config.bind("A", "back")
config.bind("e", "scroll down")
config.bind("E", "tab-prev")
config.bind("o", "scroll right")
config.bind("O", "forward")
config.bind("<Up>", "scroll up")
config.bind("<Shift+Up>", "tab-next")
config.bind("<Left>", "scroll left")
config.bind("<Shift+Left>", "back")
config.bind("<Down>", "scroll down")
config.bind("<Shift+Down>", "tab-prev")
config.bind("<Right>", "scroll right")
config.bind("<Shift+Right>", "forward")

config.bind("xd", "download-cancel")  # Cancel download; ad --> xd
config.bind("z", "undo")  # Undo; u --> z

# Caret
config.bind("U", "scroll up", mode="caret")
config.bind("A", "scroll left", mode="caret")
config.bind("E", "scroll down", mode="caret")
config.bind("O", "scroll right", mode="caret")
config.bind("a", "move-to-prev-char", mode="caret")
config.bind("o", "move-to-next-char", mode="caret")
config.bind("e", "move-to-next-line", mode="caret")
config.bind("u", "move-to-prev-line", mode="caret")
config.bind("f", "move-to-prev-word", mode="caret")
config.bind("b", "move-to-next-word", mode="caret")
config.bind("F", "move-to-start-of-line", mode="caret")
config.bind("B", "move-to-end-of-line", mode="caret")
