# flashy.vim

A vim plugin that parses a VimL file into flashcards and displays them.

# Installing

## 1. Dependencies

- [Goyo][d1]

[d1]: https://github.com/junegunn/goyo.vim

## 2. This plugin

Whichever method you use, here's the URL:

```
https://github.com/parmort/vim-flashy.git
```

I personally use Junegunn's vim-plug if any of you are wondering. All you have
to do is add `Plug 'parmort/vim-flashy'` to your `vimrc`.

# What is it?!?!

Okay, okay, calm down. Here we go.

## The commands

`:Flash` Opens the viewer.
  Once you're there, hitting `j` or `k` will flip the card over, `h` goes to
  the previous card, and `l` goes to the next one. `q` quits the viewer

`:Exit` Quits the viewer.

`:FlashList` Gets the list of cards and puts them into the quickfix.

## The file

Your flashcards will live in a VimL file (`*.vim`). Here is the format:

```vim
let g:flashy = [
  [ 'Side 1', 'Side 2' ],
  [ 'Side 1', 'Side 2' ],
]
```

The flashcards are stored in a list called `g:flashy`. Each sublist is an
individual card. This list is unlet and let (see `:h let` and `:h unlet`) each
time `:Flash` is run.

# Legal Stuff

This piece of software is licensed under the MIT license (see `LICENSE`).

This plugin copyright (c) 2018&ndash;2020 N. Prochnau. Some rights reserved.
