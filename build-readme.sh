#!/bin/bash

# This script wraps the "init.el" file in this directory with a readme
# that will be viewable on GitHub.

# Find this script's directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

touch "$DIR/readme.md"

cat << EOF > "$DIR/readme.md"
# Minimal Bootstrapping Emacs Config

This config uses Quelpa and \`quelpa-use-package\` to bootstrap itself
and provide a convenient framework for building your config.

EOF

< init.el tr '\n' '\f' |
    sed 's/.*/```emacs-lisp\f\0\f```\f/' |
    tr '\f' '\n' >> "$DIR/readme.md"
