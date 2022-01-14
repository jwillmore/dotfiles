config.load_autoconfig(False)
config.source('gruvbox.py')

config.bind('M', 'hint links spawn mpv {hint-url}')
config.bind(';D', 'hint images download')

c.url.start_pages = ["~/.config/qutebrowser/page.html"]
c.url.default_page = "~/.config/qutebrowser/page.html"

#config.set("colors.webpage.darkmode.enabled", True)
config.set("colors.webpage.preferred_color_scheme", "dark")
config.set("fonts.default_family", "Source Code Pro")
config.set("content.blocking.method", "both")
