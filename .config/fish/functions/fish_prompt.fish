function fish_prompt
	
	if not set -q -g __fish_robbyrussell_functions_defined
		set -g __fish_robbyrussell_functions_defined
		function _git_branch_name
			echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
		end

		function _is_git_dirty
			echo (git status -s --ignore-submodules=dirty ^/dev/null)
		end

		function _get_git_changes
			set -l green (set_color green)
			set -l red (set_color red)
			echo (git diff --numstat | awk -F"\t" '{sum1+=$1; sum2+=$2} END {print sum1 "\t" sum2}' | sed "s/^\([0-9]*\)\t\([0-9]*\)/$green+\1$red-\2/g")
		end
	end

	if set --query "VIRTUAL_ENV"
		printf "(%s) %s" (basename $VIRTUAL_ENV)
	end

	set -l cyan (set_color cyan)
	set -l yellow (set_color yellow)
	set -l red (set_color red)
	set -l blue (set_color blue)
	set -l normal (set_color normal)

	set -l cwd $cyan(basename (prompt_pwd))

	if [ (_git_branch_name) ]
		set -l git_branch $blue(_git_branch_name)
		set git_info $git_branch

		if [ (_is_git_dirty) ]
			set -l changes (_get_git_changes)
			set git_info "$git_info$normal($changes$normal)"
		end
	end

	echo -n -s $cwd " " $git_info $normal ' '
end
