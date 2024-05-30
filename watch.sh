#!/usr/bin/env bash

find . -name '*.nix' | entr -r sh -c 'alacritty -t develop -e nix run .'
