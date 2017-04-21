function gl
	git log --pretty='format:%C(Yellow)%h%Creset %C(Blue)%ar%Creset %an - %s' --graph $argv
end
