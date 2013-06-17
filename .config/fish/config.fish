set fish_greeting ""
set WORKON_HOME ~/.virtualenvs/
. /home/pat/.config/fish/virtualfish.fish

function fish_user_key_bindings
       bind \e. 'history-token-search-backward'
end

for path in $fish_function_path
    for file in (ls $path/toload*)
        . $file
    end
end