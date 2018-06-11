#!/bin/sh
# i3lock: version 2.10 (2017-11-25) © 2010 Michael Stapelberg
# i3lock: version aur-d0a6cfd (2018-05-20, branch "tags/aur-d0a6cfd") © 2010 Michael Stapelberg

#!/bin/sh

B='#00000000'  # blank
C='#ffffff22'  # clear ish
D='#00ff00cc'  # default
T='#00ff00ee'  # text
W='#880000bb'  # wrong
V='#bb00bbbb'  # verifying

/usr/bin/i3lock \
--insidevercolor=$C   \
--ringvercolor=$V     \
\
--insidewrongcolor=$C \
--ringwrongcolor=$W   \
\
--insidecolor=$B      \
--ringcolor=$D        \
--linecolor=$B        \
--separatorcolor=$D   \
\
--verifcolor=$T       \
--wrongcolor=$T       \
--timecolor=$T        \
--datecolor=$T        \
--layoutcolor=$T      \
--keyhlcolor=$W       \
--bshlcolor=$W        \
\
--screen 1            \
--blur 5              \
--clock               \
--indicator           \
--timestr="%H:%M:%S"  \
--datestr="%A, %m %Y" \
--keylayout 1

# Check return code
if [ ! $? -eq "0" ]; then
	# Return code is not zero: this likely means that
	# we don't have i3lock-color. Let's try without
	# the i3lock-color specific options.
	/usr/bin/i3lock
fi
