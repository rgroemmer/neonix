## Docs

With great power comes great responsiblity, to remember the power of `neovim` here is my cheatsheet.

### Vim motion

- `qw q` -> record macro to reg w, stop
- `@w` -> play macro from reg w
- `ciw` `diw` `yiw` -> change/delete/yank inner word
- `caw` `daw` `yaw` -> change/delete/yank around word

### My config

| Action        | keymap                                    |
| --------      | --------                                  |
| `<leader>,`   | vertical split                            |
| `<leader>,`   | horizontal split                          |
| `<leader>c`   | Select system clipboard                   |
| `<leader>T`   | Toggle termimal                           |
| `<leader>t`   | Toggle test summary                       |
| `<leader>dc`  | Start/Continue debugging                  |
| `K`           | Toggle `lsp_signature`                    |
| `L`           | Toggle `lsp_diagnostic: hover`            |
| `gcc`         | Toggle comment                            |

## Helpers

| Action            | description                                                       |
| --------          | --------                                                          |
| :noautocmd w      | write without triggering autocmds (autoformat)                    |
