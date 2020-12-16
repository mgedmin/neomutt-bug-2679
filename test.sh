#!/bin/sh
cd "$(dirname "$0")" || exit 255
printf "From sender@localhost  Fri Nov 20 11:12:39 2020\nSubject: test message 1\n\nbody\n\n" > inbox
printf "From sender@localhost  Fri Nov 20 11:12:39 2020\nSubject: test message 2\n\nbody\n\n" >> inbox
neomutt=${1:-neomutt}
$neomutt -v | head -n 1
$neomutt -F /dev/null -f inbox -e 'push <limit>~N<enter><tag-pattern>.<enter><display-message><exit>'
