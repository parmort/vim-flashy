# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Added
- `g:flashy_debug` variable to make resourcing the script easier for development
- `g:flashy_unmap` variable to unmap standard keybindings globally
- `b:flashy_unmap` variable to unmap, but per file (very helpful for development)

## [1.0.0] - 2020-07-15
### Added
- `:Flash` command to open the viewer
- `:Exit` command to close the viewer (accessible only in the viewer)
- `:FlashList` command to list the flashcards in the quickfix
- `j` and `k` mappings to flip the card
- `h` and `l` mappings to go to the previous and next card respectively
- A `q` mapping to exit the viewer

[Unreleased]: https://github.com/parmort/vim-flashy/compare/devel
[1.0.0]: https://github.com/parmort/vim-flashy/releases/tag/v1.0.0
