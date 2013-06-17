functions --erase old_prompt
functions --copy fish_prompt old_prompt

function fish_prompt
    if set --query "VIRTUAL_ENV"
      printf "(%s) %s" (basename $VIRTUAL_ENV) 
      old_prompt
    else
      old_prompt
    end
end