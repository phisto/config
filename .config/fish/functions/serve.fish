function serve
	twistd -no web --path=. --port $argv[1]
end
