#!/bin/bash
# vscode-docker-user-init.sh
# Invoked when vscode builds the dev container, our job is to improve the 'vscode' user environment

cat >> /home/vscode/.bashrc <<-EOF
alias lr='ls -lirta'
alias gs='git status'
set -o vi
[[ -f ~/.vshinit ]] || {
    echo "Your dotfiles were zapped by /workspace/localhist/bin/vscode-docker-user-init.sh during container build"
    touch ~/.vshinit
}
EOF

