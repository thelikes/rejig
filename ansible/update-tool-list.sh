#!/bin/bash

echo
echo "### Core packages"
echo

grep '      name: ' roles/corepkgs/tasks/main.yml | cut -d\: -f2- | sed 's/^/-/g'

echo
echo "### Go tools"
echo

grep '      url: ' roles/go-get/vars/main.yml | grep -v '#' | cut -d\: -f2- | sed 's/^/-/g'

echo
echo "### Github repos"
echo

grep '      url:' roles/pop-opt/vars/main.yml | cut -d\: -f2- | grep -v '{' | sed 's/^/-/g' | sed 's/https:\/\///g'


