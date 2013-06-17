function grepon
	grep --include "*.$argv[1]" $argv[2..-1]
end
