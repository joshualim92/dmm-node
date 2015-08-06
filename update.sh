#!/bin/bash
for service in */; do
if [[ $service != *"node_modules"* ]]; then
	cd $service
	echo -e "\e[1;42m updating $service... \e[0m"
	echo -en "\e[36m"
	git stash save
	git checkout master
	git pull
	echo -en "\e[90m"
	test -f package.json && npm install
	echo -en "\e[0m"
	cd ../
fi
done
