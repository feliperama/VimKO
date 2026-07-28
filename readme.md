# Personal vim configuration 

## Running this (legacy) config side by side with a modern one

This is the pre-Lua config (vim-plug + coc.nvim). It is meant to be run through
`NVIM_APPNAME` so it can coexist with a newer config in `~/.config/nvim`:

```sh
NVIM_APPNAME=nvim-old nvim
```

Nothing in here hardcodes `~/.config/nvim` any more — sources are resolved
relative to `init.vim`, and plugin/data paths come from `stdpath()`, which
follows `NVIM_APPNAME`. With the command above, everything this config reads or
writes lives under:

| What | Where |
| --- | --- |
| Config | `~/.config/nvim-old` |
| Plugins (vim-plug) | `~/.local/share/nvim-old/plugged` |
| vim-plug itself | `~/.local/share/nvim-old/site/autoload/plug.vim` (auto-installed if missing) |
| JS debug adapter | `~/.local/share/nvim-old/vscode-js-debug` |
| Shada/swap/undo, cache | `~/.local/state/nvim-old`, `~/.cache/nvim-old` |

So `:PlugInstall` / `:PlugUpdate` here cannot affect the plugins of the config
in `~/.config/nvim`.

Two things are still deliberately shared with the rest of the system, since
they are not Neovim-private:

- `~/.fzf` — its `bin/fzf` is the `fzf` on `$PATH`. This config only adds it to
  `runtimepath` (read-only); it will **not** `git pull` it or re-run
  `./install --all`, which would rewrite that binary and your shell rc.
- `~/.config/coc` (coc.nvim extensions) and `~/.venvs/nvim` (python3 host).

## Changelog 
  Changed to tab to jump (dont need supertabs)
##

## Troubleshoot and workaround
- If Loose sintax (for exemple for a php file)
{% codeblock %}
:set syntax=php
{% endcodeblock %}



Advanced VIM Configuration for FullStack Developers, for now it's supporting.
- Backend: Node, Typescript, Php, Ruby on Rails, Python and Elixir.
- Front-end: React
- Ops: Docker, Nginx, Ansible.

Only tested with Neovim.

# Mappings

## Leaders
| key       | Description |
| -         | -           |
| `<space>` | Leader      |
| `;`       | FuzzyFinder |
| `,`       | Files       |
| `s`       | Windows     |
| `t`       | Tabs        |
| `z`       | Foldings    |
| `m`       | Bookmarks    |

## Miscellaneous
| key              | Mode          | Action                                              |
| -                | -             | -                                                   |
| `Reload`         | Command       | Reload vimrc                                        |
| `<Leader>a`      | Normal        | Align paragraph                                     |
| `<Leader>,`      | Normal        | Remove all spaces EOL                               |
| `<Leader>ow`     | Normal        | Overwrite word under cursor                         |
| `<Leader>saw`    | Normal/visual | Replace all occurences under cursor                 |
| `<Leader>w`      | Normal        | Save current file                                   |
| `<Leader>d`      | Normal/Visual | Duplicate line/selected                             |
| `<Leader>rp`     | Normal        | Remove all lines with the given patter              |
| `!`              | Normal        | Start an external Command with a single bang        |
| `jk`             | Insert        | Go to normal mode                                   |
| `<Leader>h`      | All           | Toogle permanent Highlight for word under cursor    |
| `<Leader>y`      | Visual        | Toogle permanent Highlight for selected region      |
| `<Leader>x`      | Visual        | Toggle markdown checkbox ([] -> [x] -> [n/a] -> []) |
| `<Leader>v`      | Visual        | Expand selected region                              |
| `<Leader>,`      | Visual        | Remove emtpy speces                                 |
| `s`              | visual        | Replace within selected area                        |
| `gp`             | Normal        | Select last paste                                   |
| `Y`              | Normal        | Copy until the end of line                          |
| `q`              | Normal        | Quit                                                |
| `<ctrl>o`        | visual        | Jump to last edited location                        |
| `<ctrl>i`        | visual        | Jump to next edited location                        |
| `<Ctrl>r`        | insert        | Open resgister content                              |
| `gc<motion>`     | Normal/visual | Toggle comments                                     |
| `/`              | Normal        | Easy motion between panels                          |
| `W!!`            | Command       | Save with sudo                                      |
| `<Leader>;`      | Normal        | Toggle tag bar                                      |
| `<Leader>x(j/k)` | Normal        | Cut line by number to the current cursor position   |
| `<Leader>c(j/k)` | Normal        | Copy line by number to the current cursor position  |

## Macro
| key | Mode   | Action  |
| -   | -      | -       |
| `Q` | Normal | Record  |
| `M` | Normal | Execute |

## Windows `s`
| key                | Mode   | Action                  |
| -                  | -      | -                       |
| `<Window>v`        | Normal | Split tab horizontaly   |
| `<Window>g`        | Normal | Split tab verticaly     |
| `<Window>c`        | Normal | Close                   |
| `<Window>co`       | Normal | Close other             |
| `<Window>b`        | Normal | Back to previous buffer |
| `<Window>r`        | Normal | Rotate                  |
| `<Window>z`        | Normal | Zoom toggle             |
| `Arrows`           | Normal | Resize                  |

## Tabs `t`
| key       | Mode   | Action       |
| -         | -      | -            |
| `<Tabs>t` | Normal | Open new tab |
| `<Tabs>l` | Normal | Next tab     |
| `<Tabs>h` | Normal | Prev tab     |
| `<Tabs>m` | Normal | Move current buffer to new tab     |

## Files `,`
| key         | Mode   | Action                                |
| -           | -      | -                                     |
| `<Files>du` | Normal | Duplicate current file                |
| `<Files>de` | Normal | Delete current file                   |
| `<Files>m`  | Normal | Move/Rename current file              |
| `<Files>y`  | Normal | Copy file-path to clipboard(relative) |
| `<Files>Y`  | Normal | Copy file-path to clipboard(absolute) |

## Sidebar
| key        | Mode     | Action                               |
| -          | -        | -                                    |
| `<Files>e` | Normal   | Toggle file explorer                 |
| `<Files>a` | Normal   | Toggle file explorer on current file |
| `w`        | NerdTree | Toggle window size                   |
| `N`        | NerdTree | Create new file or directy           |

## FuzzyFinder `;`
| key              | Mode   | Action                |
| -                | -      | -                     |
| `<FuzzyFinder>f` | Normal | Files                 |
| `<FuzzyFinder>w` | Normal | Opened Windows        |
| `<FuzzyFinder>g` | Normal | Search text all       |
| `<FuzzyFinder>t` | Normal | Tags                  |
| `<FuzzyFinder>T` | Normal | Tags(Current Buffer)  |
| `<FuzzyFinder>c` | Normal | Commits(current file) |
| `<FuzzyFinder>b` | Normal | Buffers               |
| `<FuzzyFinder>/` | Normal | Lines(current buffer) |
| `<FuzzyFinder>m` | Normal | Marks                 |

## Find and Replace(Far)
| key                        | Mode    | Action                            |
| -                          | -       | -                                 |
| `:Far <from> <to> <files>` | Command | Open "find & replace" console     |
| `t`                        | Far     | Toggle the match above the cursor |
| `:Fardo`                   | Far     | Do the replacement                |
| `:F <pattern>`             | Command | find all                          |

## Dash
| key         | Mode   | Action                                       |
| -           | -      | -                                            |
| `<leader>k` | Normal | Open current word in Dash.app(documentation) |

## Ctags
| key          | Mode    | Action           |
| -            | -       | -                |
| `<ctrl>]`    | Normal  | Go to definition |
| `UpdateTags` | Command | UpdateTags       |

## COC
| key               | Mode                                   | Action           |
| -                 | -                                      | -                |
| `gd`              | Normal                                 | Go to definition |
| `<FuzzyFinder>sy` | Search for symbols inside current file |                  |

## Multiple Cursor
| key       | Mode   | Action                |
| -         | -      | -                     |
| `<ctrl>n` | Normal | select next occurence |
| `<ctrl>p` | Normal | Undo Selection        |
| `<ctrl>x` | Normal | Skip current          |

## Bookmarks `m`
| key            | Mode   | Action                           |
| -              | -      | -                                |
| `<Bookmarks>m` | Normal | Toggle bookmarks in current line |
| `<Bookmarks>n` | Normal | Jump to next bookmark            |
| `<Bookmarks>p` | Normal | Jump to prev bookmark            |
| `<Bookmarks>a` | Normal | show list of all bookmarks       |
| `<Bookmarks>x` | Normal | remove all bookmarks             |

## Foldings `z`
| key             | Mode   | Action                                            |
| -               | -      | -                                                 |
| `<Foldings>a`   | Normal | toggle fold current level                         |
| `<Foldings>r`   | Normal | Recues folding by opening one more level of folds |
| `<Foldings>R`   | Normal | Open all folds                                    |
| `<Foldings>Mza` | Normal | Close the others                                  |
| `<leader>1..n`     | Normal | fold on level 1,2,...n
| `<leader>0`     | Normal | unfold

## Git
| key | Mode | Action |
|-|-|-|

## Snippets
| key         | Mode   | Action               |
| -           | -      | -                    |
| `<Leader>s` | Normal | create a new snippet |

## Tabularize
| key          | Mode          | Action               |
| -            | -             | -                    |
| `<Leader>tt` | Normal/visual | tabularize by custom |
| `<Leader>t=` | Normal/visual | tabularize by =      |
| `<Leader>t:` | Normal/visual | tabularize by :      |

## Text Objects
| key   | Mode   | Action            |
| -     | -      | -                 |
| `e`   | Normal | entire file       |
| `_`   | Normal | underscore        |
| `r`   | Normal | ruby block        |
| `=/-` | Normal | erb               |
| `i`   | Normal | indentation level |
| `f`   | Normal | function          |

# Languages/Frameworks

## Ruby
| Key              | Mode   | Action                                                |
| -                | -      | -                                                     |
| `,#`             | Normal | ruby string interpolation #{}                         |
| `]m`             | Normal | To edit start of next method definition               |
| `]M`             | Normal | To go to end of next method definition                |
| `[m`             | Normal | To start of previous method definition                |
| `[M`             | Normal | To end of previous method definition                  |
| `<Leader>rap`   | Normal | Add params to method                                  |
| `<Leader>rit`   | Normal | Remove declaration of the variable and use the result |
| `<Leader>rcpc`  | Normal | From if one line to multiline                         |
| `<Leader>rec`   | Normal | Extract Constant                                      |
| `<Leader>rel`   | Normal | Extract let                                           |
| `<Leader>relv`  | Normal | To local variable                                     |
| `<Leader>rrlv`  | Normal | Rename local variable                                 |
| `<Leader>rriv`  | Normal | Rename instance variable

### Ruby On Rails
| key   | Mode    | Action                  |
| -     | -       | -                       |
| `gf`  | Normal  | goto                    |
| `:A`  | Command | Alternate file          |
| `:AS` | Command | Alternate file in split |
| `:R`  | Command | Related file            |
| `:RS` | Command | Related file in split   |
| `<FuzzyFinder>mo` | Normal | Search for models                 |
| `<FuzzyFinder>c` | Normal | Search for controller |

## Elixir
| key            | Mode    | Action                                                              |
|-|-|-|

## Go
| key            | Mode    | Action                                                              |
|-|-|-|

## Clojure
| key            | Mode    | Action                                                              |
|-|-|-|

## Python
| key            | Mode    | Action                                                              |
|-|-|-|

## Javascript
| key            | Mode    | Action                                                              |
| -              | -       | -                                                                   |
| `:ImportJSFix` | Command | Import any missing modules and remove any modules that are not used |
| `:JsDoc`       | Command | Generate JSDoc for the function

### React
| key | Mode | Action |
|-|-|-|

## CSS
| key            | Mode    | Action                                                              |
|-|-|-|

## HTML/JSX
| key          | Mode    | Action                                |
| -            | -       | -                                     |
| `Ctrl+y + ,` | Command | Expand emmet sequence                 |
| `Ctrl+y + ,` | visual  | Wrap selected tag with emmet sequence |
| `<c-y>d`     | insert  | Balance a Tag Inward                  |
| `<c-y>D`     | insert  | Balance a Tag Outward                 |
| `<c-y>n`     | insert  | Go to the Next Edit Point             |
| `<c-y>N`     | insert  | Go to the Previous Edit Point         |

# Required
- https://github.com/BurntSushi/ripgrep
- https://github.com/junegunn/vim-plug
- http://ctags.sourceforge.net
- https://github.com/junegunn/fzf

# How to install
```
$ cd ~/.config
$ mv nvim nvim-bk
$ git clone git@github.com:AlexVKO/VimKO.git nvim

And then inside neovim run :PlugInstall
```

Install the treesitter parsers required by render-markdown.nvim:
```
:TSInstall markdown markdown_inline
```
Inspired by:
  - https://github.com/rafi/vim-config
