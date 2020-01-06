#!/bin/zsh

# all functions
function add {
	echo "First, git add..."
	git add *
}

function commit {
	echo -n "Second, enter git commit message: "
	read commit
	git commit -m "$commit"
}

function push {
	echo "third, git push..."
	git push
}

function del-files {
	git diff --name-only --diff-filter=D -z | xargs -0 git rm --cached
}

function temp-commit {
	echo -n "enter a git commit code to swtich for temp : "
	read code
	git checkout $code
}

function status {
	git status
}

function main-app {
	if [[ $whattodo -eq 1 ]]
	then
	status

	elif [[ $whattodo -eq 2 ]]
	then

	add
	#sleep 1
	commit
	#sleep 2
	push

	elif [[ $whattodo -eq 3 ]]
	then
	add

	elif [[ $whattodo -eq 4 ]]
	then
	commit

	elif [[ $whattodo -eq 5 ]]
	then
	push

	elif [[ $whattodo -eq 6 ]]
	then

	del-files


	elif [[ $whattodo -eq 8 ]]
	then

	temp-commit

	else
	echo "exit signal recieved...$whattodo"
	exit 1
	fi
	first-move
}

function first-move {
	echo -n "status 1 a+c+p 2, add 3, commit 4, push 5 ,deleting files 6, git checkout to temp 8 (ELSE exit)..: "
	read whattodo
	main-app whattodo
}

first-move
