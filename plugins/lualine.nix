{
  plugins.lualine = {
    enable = true;
    globalstatus = true;

    theme = {
      normal = {
        a = {
          fg = "#1E1D2D";
          bg = "#89B4FA";
        };
        b = {
          fg = "#D9E0EE";
          bg = "#2f2e3e";
        };
        c = {
          fg = "#605f6f";
          bg = "#232232";
        };
      };

      insert = {
        a = {
          fg = "#1E1D2D";
          bg = "#c7a0dc";
        };
      };
      visual = {
        a = {
          fg = "#1E1D2D";
          bg = "#89DCEB";
        };
      };
      replace = {
        a = {
          fg = "#1E1D2D";
          bg = "#F8BD96";
        };
      };
      terminal = {
        a = {
          fg = "#1E1D2D";
          bg = "#ABE9B3";
        };
      };
      command = {
        a = {
          fg = "#1E1D2D";
          bg = "#ABE9B3";
        };
      };
      confirm = {
        a = {
          fg = "#1E1D2D";
          bg = "#B5E8E0";
        };
      };
      select = {
        a = {
          fg = "#1E1D2D";
          bg = "#89B4FA";
        };
      };

      inactive = {
        b = {
          fg = "#D9E0EE";
          bg = "#2f2e3e";
        };
        c = {
          fg = "#D9E0EE";
          bg = "#232232";
        };
      };
    };

    sectionSeparators = {
      left = "";
      right = "";
    };
    componentSeparators = {
      left = "";
      right = "";
    };

    sections = {
      lualine_a = [
        {
          name = "mode";
          extraConfig = {
            fmt.__raw =
              # lua
              ''
                function(str)
                  return "❆ " .. str
                end
              '';
          };
        }
      ];
      lualine_b = [
        {
          name = "filetype";
          extraConfig = {
            icon_only = true;
            colored = false;
            separator = "";
            padding = {
              left = 1;
              right = 0;
            };
          };
        }
        {
          name = "filename";
          extraConfig = {
            path = 1;
          };
        }
      ];
      lualine_c = [
        {
          name = "branch";
          extraConfig = {
            padding = {
              left = 2;
              right = 0;
            };
            icon = "";
            color = {
              fg = "#94e2d5";
              gui = "bold";
            };
          };
        }
        {
          name = "diff";
          extraConfig = {
            colored = false;
            symbols = {
              added = " ";
              modified = " ";
              removed = " ";
            };
          };
        }
      ];
      lualine_x = [
        {
          name = "diagnostics";
          extraConfig = {
            color = {
              fg = "#605f6f";
              bg = "#232232";
              gui = "bold";
            };
            diagnostics_color = {
              color_error = {
                fg = "#F38BA8";
              };
              color_warn = {
                fg = "#FAE3B0";
              };
            };
            symbols = {
              error = " ";
              warn = " ";
            };
          };
        }
      ];
      lualine_y = [
        {
          name.__raw =
            # lua
            ''
              function()
                  return "   "
              end
            '';

          padding = {
            left = 0;
            right = 0;
          };
          color = {
            fg = "#2d2c3c";
            bg = "#8bc2f0";
          };
        }
        {
          name.__raw =
            # lua
            ''
              function()
              		local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
              		local clients = vim.lsp.get_active_clients()
              		if next(clients) == nil then
              				return "None"
              		end

              		local msg = ""
              		for _, client in ipairs(clients) do
              				local filetypes = client.config.filetypes
              				if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 and client.name ~= "null-ls" then
              						msg = msg .. client.name .. " "
              				end
              		end

              		if msg then
              			return msg
              		else
              			return "None"
              		end

              	end
            '';
          color = {
            fg = "#D9E0EE";
            bg = "#2f2e3e";
            gui = "bold";
          };
        }
      ];
      lualine_z = [
        {
          name.__raw =
            # lua
            ''
              function()
                  return "  "
              end
            '';

          padding = {
            left = 0;
            right = 0;
          };
          color = {
            fg = "#2d2c3c";
            bg = "#ABE9B3";
            gui = "bold";
          };
        }
        {
          name = "progress";
          color = {
            bg = "#2d2c3c";
            fg = "#ABE9B3";
          };
        }
      ];
    };
  };
}
