{ pkgs, ... }:
{
  extraPlugins = [ pkgs.vimPlugins.lsp_signature-nvim ];

  plugins = {

    cmp-nvim-lsp.enable = true;
    cmp-path.enable = true;
    cmp_luasnip.enable = true;
    cmp-buffer.enable = true;
    cmp-emoji.enable = true;
    cmp-cmdline.enable = true;

    cmp = {
      enable = true;
      autoEnableSources = false;
      settings = {

        sources = {
          __raw = ''
            cmp.config.sources({
              { name = 'nvim_lsp', max_item_count = 8, group_index = 1},
              { name = 'path', group_index = 2},
              { name = 'luasnip', max_item_count = 3, group_index = 1},
              { name = 'emoji', max_item_count = 5, group_index = 2},
              { name = 'cmdline', max_item_count = 6},
              -- { name = 'ultisnips' },
              -- { name = 'snippy' },
              -- { name = 'vsnip' },
            }, {
              { name = 'buffer' , max_item_count = 3, group_index = 2},
            })
          '';
        };

        snippet.expand = "luasnip";

        completion.keyword_length = 2;

        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.close()";
          "<CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = false })";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
        };

        window = {
          completion = {
            winhighlight = "FloatBorder:CmpBorder";
            scrollbar = false;
          };

          documentation = {
            winhighlight = "FloatBorder:CmpBorder";
          };
        };

        formatting = {
          fields = [
            "abbr"
            "kind"
            "menu"
          ];
          format =
            # lua
            ''
              function(_, item)
                local icons = {
                  Namespace = "󰌗",
                  Text = "󰉿",
                  Method = "󰆧",
                  Function = "󰆧",
                  Constructor = "",
                  Field = "󰜢",
                  Variable = "󰀫",
                  Class = "󰠱",
                  Interface = "",
                  Module = "",
                  Property = "󰜢",
                  Unit = "󰑭",
                  Value = "󰎠",
                  Enum = "",
                  Keyword = "󰌋",
                  Snippet = "",
                  Color = "󰏘",
                  File = "󰈚",
                  Reference = "󰈇",
                  Folder = "󰉋",
                  EnumMember = "",
                  Constant = "󰏿",
                  Struct = "󰙅",
                  Event = "",
                  Operator = "󰆕",
                  TypeParameter = "󰊄",
                  Table = "",
                  Object = "󰅩",
                  Tag = "",
                  Array = "[]",
                  Boolean = "",
                  Number = "",
                  Null = "󰟢",
                  String = "󰉿",
                  Calendar = "",
                  Watch = "󰥔",
                  Package = "",
                  Copilot = "",
                  Codeium = "",
                  TabNine = "",
                }

                local icon = icons[item.kind] or ""
                item.kind = string.format("%s %s", icon, item.kind or "")
                return item
              end
            '';
        };
      };
    };
  };
  extraConfigLua = ''
    require "lsp_signature".setup({
      handler_opts = {
        border = "none"
      },
    })
    local golang_setup = {
      on_attach = function(client, bufnr)
        require "lsp_signature".on_attach(signature_setup, bufnr)  -- Note: add in lsp client on-attach
      end,
    }
    require'lspconfig'.gopls.setup(golang_setup)
  '';
}
