declare-option -docstring 'Line number highlighter parameters' str-list number_toggle_params

define-command -params 0.. -hidden number-toggle-update %{
    remove-highlighter window/number-toggle
    # Install new highlighter
    add-highlighter window/number-toggle number-lines %arg{@} %opt{number_toggle_params}
}
                   # Display relative line numbers when starting Kakoune in normal mode
hook global WinCreate .* %{
    number-toggle-update '-relative' '-hlcursor'
}
# Display absolute line numbers when entering insert mode
hook global ModeChange push:.*:insert %{
    number-toggle-update '-hlcursor'
}
#
# Display relative line numbers when leaving insert mode
hook global ModeChange pop:insert:.* %{
    number-toggle-update '-relative' '-hlcursor'
}
