# flashy.vim

A vim plugin that parses a VimL file into flashcards and displays them.

# Installing

This plugin requires the use of Junegunn's [Goyo][1]. I personally use his
plugin manager, [vim-plug][2], as well. Here is the subsequent code for
installing this using vim-plug.

[1]: https://github.com/junegunn/goyo.vim
[2]: https://github.com/junegunn/vim-plug

```vim
Plug 'junegunn/goyo.vim'
Plug 'parmort/vim-flashy'
```

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
time `:Flash` or `:FlashList` is run.

# Configuration

For a sample configuration, see `SAMPLE_CONFIG.vim`.

## Keybindings
There are 3 plug keybindings you can bind to:

- `<Plug>FlashyFlip`: Flip the current card over
  - Default: `j` and `k`
- `<Plug>FlashyNext`: Go to the next card
  - Default: `l`
- `<Plug>FlashyPrev`: Go to the previous card
  - Default: `h`

The standard `q` mapping is simply mapped to the command `:Exit`, which is
available only in the viewing buffer.

## Variables
Each configuration variable has two variants, unless otherwise specified: a
global variant (`g:<variable>`) for (you guessed it) global configuration, and a
buffer-specific variant (`b:<variable>`) for each flashcard file. I would
**strongly** recommended you use the global variant in you global
configurations, as otherwise it would conflict with any potential buffer-
specific configuration.

- `flashy_unmap`: Unmap the standard mappings. Each level includes the
unmappings of the level below it
  - `0`: Unmap nothing [default]
  - `1`: Unmap `j`/`k` (flip)
  - `2`: Unmap `h`/`l` (next/prev)
  - `3`: Unmap `q` (quit)
- `flashy_debug` (global only): Enable debug mode. Allows the regular plugin file
to be re-sourced.
  - Does not exist: Debug mode disabled [default]
  - Exists: Debug mode enabled

# Some more notes...

If you hook into Goyo's autocommands, the changes you make in there will be set
in Flashy. If you want to gate some of the settings, use the following if
statement:

```vim
if exists('g:flashy_loaded') && g:inFlashy == 1
  " Flashy isn't loaded
endif
```

# Legal Stuff

This piece of software is licensed under the MIT license (see `LICENSE`).

This plugin copyright (c) 2018&ndash;2020 N. Prochnau. Some rights reserved.
