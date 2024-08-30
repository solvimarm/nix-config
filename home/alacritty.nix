{ config, ...}:

{
    programs.alacritty.enable = true;
    programs.alacritty.settings = {
      colors = with config.colorScheme.colors; {
        bright = {
          black = "0x${base00}";
          blue = "0x${base0D}";
          cyan = "0x${base0C}";
          green = "0x${base0B}";
          magenta = "0x${base0E}";
          red = "0x${base08}";
          white = "0x${base06}";
          yellow = "0x${base09}";
        };
        cursor = {
          cursor = "0x${base06}";
          text = "0x${base06}";
        };
        normal = {
          black = "0x${base00}";
          blue = "0x${base0D}";
          cyan = "0x${base0C}";
          green = "0x${base0B}";
          magenta = "0x${base0E}";
          red = "0x${base08}";
          white = "0x${base06}";
          yellow = "0x${base0A}";
        };
        primary = {
          background = "0x${base00}";
          foreground = "0x${base06}";
        };
      };
      window = {
        opacity = 0.90;
      };
      /* 
      keyboard.bindings = [
        # Create new Window
        {
          key = "T";
          mods = "Control";
          chars = "\\u0000\\u0063";
        }
        # Cycle next window
        {
          key = "Tab";
          mods = "Control";
          chars = "\\u0000\\u006e";
        }
        # Cycle prev window
        {
          key = "Tab";
          mods = "Control|Shift";
          chars = "\\u0000\\u0070";
        }
        # Kill pane
        {
          key = "W";
          mods = "Control";
          chars = "\\u0000\\u0078";
        }
        # split pane vertically
        {
          key = "V";
          mods = "Control";
          chars = "\\u0000\\u0025";
        }
        # split pane hrizontally 
        {
          key = "H";
          mods = "Control";
          chars = "\\u0000\\u0022";
        }
      ];
      */
  };
}
