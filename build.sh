#!/bin/bash

SemVer="[[:digit:]]\+\.[[:digit:]]\+\.[[:digit:]]\+"
if ! currPMLver="$(expr "$(pmlc --version 2> /dev/null)" : \
				".*version\:\? \($SemVer\)")" ; then
	echo "ERROR: You need to install the PML Converter:"
	echo "       https://www.pml-lang.dev/downloads/install.html"
	exit 1
fi

reqPMLver="$(< VERSION)"
if ! [[ $currPMLver == $reqPMLver ]] ;then
	echo -e "WARNING: This project requires PML $reqPMLver" \
			"(you have $currPMLver).\n        " \
			"Make sure you're local repository is up to date,\n        " \
			"and that you're using the latest PML version."
fi

pmlc convert --input_file input/text/index.pml

echo -e "\n/// Done ///"
exit
