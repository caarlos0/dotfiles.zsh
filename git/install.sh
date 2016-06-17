#!/bin/sh

# aliases
git config --global --remove-section alias 2>/dev/null || true
git config --global alias.co                              "checkout"
git config --global alias.promote                         "!$ZSH/bin/git-promote"
git config --global alias.wtf                             "!$ZSH/bin/git-wtf"
git config --global alias.unpushed-st                     "!$ZSH/bin/git-unpushed-stat"
git config --global alias.nuke                            "!$ZSH/bin/git-nuke"
git config --global alias.count                           "shortlog -sn"
git config --global alias.lc                              "!$ZSH/bin/git-add-rm-line-count"
git config --global alias.g                               "grep --break --heading --line-number"
git config --global alias.gi                              "grep --break --heading --line-number -i"
git config --global alias.changed                         "show --pretty=\"format:\" --name-only"
git config --global alias.cp-branch-name                  "!git rev-parse --abbrev-ref HEAD | pbcopy"
git config --global alias.delete-local-merged             "!zsh -ic git-delete-local-merged"
git config --global alias.add-upstream                    "!zsh -ic \"add-upstream \$*\""
git config --global alias.sync                            "!zsh -ic git-sync"
git config --global alias.fm                              "!zsh -ic \"git-fetch-merge \$*\""
git config --global alias.pr                              "!zsh -ic \"open-pr \$*\""
git config --global alias.add-remote                      "!zsh -ic \"add-upstream \$*\""

# colors
git config --global --remove-section color 2>/dev/null || true
git config --global color.diff                            "auto"
git config --global color.status                          "auto"
git config --global color.branch                          "auto"
git config --global color.ui                              "true"

# core
git config --global --remove-section core 2>/dev/null || true
git config --global core.excludesfile                     "$HOME/.gitignore"
git config --global core.editor                           "vim"
git config --global core.compression                      "-1"
git config --global core.autocrlf                         "input"
git config --global core.whitespace                       "trailing-space,space-before-tab"
git config --global core.precomposeunicode                "true"

# apply
git config --global --remove-section apply 2>/dev/null || true
git config --global apply.whitespace                      "nowarn"

# help
git config --global --remove-section help 2>/dev/null || true
git config --global help.autocorrect                      "1"

# mergetool
git config --global --remove-section merge 2>/dev/null                || true
git config --global --remove-section mergetool.diffmerge 2>/dev/null  || true

git config --global merge.tool                            "diffmerge"
git config --global mergetool.diffmerge.cmd               "diffmerge --merge --result=\$MERGED \$LOCAL \$BASE \$REMOTE"
git config --global mergetool.diffmerge.trustExitCode     "true"
git config --global mergetool.diffmerge.keepBackup        "false"

# difftool
git config --global --remove-section diff 2>/dev/null       || true
git config --global --remove-section difftool 2>/dev/null   || true

git config --global diff.tool                             "diffmerge"
git config --global difftool.prompt                       "false"
git config --global difftool.diffmerge.cmd                "diffmerge \$LOCAL \$REMOTE"

# grep
git config --global --remove-section grep 2>/dev/null || true
git config --global grep.extendRegexp                     "true"
git config --global grep.lineNumber                       "true"

# push
git config --global --remove-section push 2>/dev/null || true
git config --global push.default                          "simple"

# submodule
git config --global --remove-section submodule 2>/dev/null || true
git config --global submodule.fetchJobs                   "4"

# commit
git config --global --remove-section commit 2>/dev/null || true
git config --global commit.template                       "$ZSH/git/template.txt"

# user helper
if [ "$(uname -s)" = "Darwin" ]; then
  git config --global user.helper osxkeychain
else
  git config --global user.helper cache
fi

# custom config
# shellcheck disable=SC1090
test -e ~/.gitconfig_custom && . ~/.gitconfig_custom
