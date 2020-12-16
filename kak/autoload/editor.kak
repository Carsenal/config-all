# editor.kak
# Define editor behavior
#

set-option global tabstop 4
set-option global indentwidth 4
set-option global aligntab true
set-option global autoreload yes

# Insert mode color change
# hook global ModeChange ".*:normal" %{
#     set-face buffer PrimaryCursor
# }
# hook global ModeChange ".*:insert" %{
#     set-face buffer PrimaryCursorEol
# }

alias global W write
alias global Q quit
alias global WQ write-quit
alias global wQ write-quit
alias global Wq write-quit
alias global W! write!
alias global Q! quit!
alias global WQ! write-quit!
alias global wQ! write-quit!
alias global Wq! write-quit!

# ctags
hook global KakBegin .* %{
    evaluate-commands %sh{
        path="$PWD"
        while [ "$path" != "$HOME" ] && [ "$path" != "/" ]; do
            if [ -e "./tags" ]; then
                printf "%s\n" "set-option -add current ctagsfiles %{$path/tags}"
                break
            else
                cd ..
                path="$PWD"
            fi
        done
    }
    ctags-enable-autoinfo
    ctags-enable-autocomplete
}
