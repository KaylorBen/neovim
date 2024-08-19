local hipatterns = require("mini.hipatterns")
hipatterns.setup({
  highlighters = {
    -- Highlihgt standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
    fixme = { pattern = "%f[%w]()FIXME()%f[%w]", group = "MiniHipatternsFixme" },
    hack  = { pattern = "%f[%w]()HACK()%f[%w]", group = "MiniHipatternsHack" },
    todo  = { pattern = "%f[%w]()TODO()%f[%w]", group = "MiniHipatternsTodo" },
    note  = { pattern = "%f[%w]()NOTE()%f[%w]", group = "MiniHipatternsNote" },

    -- Highlight hex color string ('#rrggbb') using that color
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
})
