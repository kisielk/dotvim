#!/usr/bin/env bash
mkdir bundle
git clone https://github.com/gmarik/vundle.git ./bundle/vundle
vim -u bundles.vim +BundleInstall +qall

# Install go packages
go get -u code.google.com/p/rog-go/exp/cmd/godef
go get -u github.com/bradfitz/goimports
