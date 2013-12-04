#!/usr/bin/env bash
mkdir bundle
git clone https://github.com/gmarik/vundle.git ./bundle/vundle
vim -c BundleInstall
