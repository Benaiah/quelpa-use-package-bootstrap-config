#!/bin/bash

# This script wraps the "init.el" file in this directory with a readme
# that will be viewable on GitHub.

# Find this script's directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

touch "$DIR/readme.md"

cat << EOF > "$DIR/readme.md"
# Bootstrapping Emacs Config with Quelpa and use-package

This config uses Quelpa and \`quelpa-use-package\` to bootstrap itself
and provide a convenient framework for building your config.

EOF

< init.el tr '\n' '\f' |
    sed -E 's/(.*)/```emacs-lisp\n\1```\n/' |
    tr '\f' '\n' >> "$DIR/readme.md"
