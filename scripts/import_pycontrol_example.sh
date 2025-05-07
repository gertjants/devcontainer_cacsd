#!/bin/bash
gitdir=/tmp/pycontrol
if [[ -d $gitdir ]]; then
    rm -rf $gitdir
fi;

git clone --depth=1 git@github.com:python-control/python-control.git $gitdir
cp -r $gitdir/examples /workspace/src/