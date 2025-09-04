return {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = {
    bullet = {
      -- add a space between bullet marker and text
      right_pad = 1,
    },
    -- Leave YAML front matter un-rendered to keep natural spacing
    yaml = {
      enabled = false,
    },
    -- Example: adjust code block padding if desired
    -- code = {
    --   right_pad = 1,
    -- },
  },
  ft = { "markdown", "norg", "rmd", "org", "codecompanion" },
  config = function(_, opts)
    require("render-markdown").setup(opts)
    Snacks.toggle({
      name = "Render Markdown",
      get = function()
        return require("render-markdown.state").enabled
      end,
      set = function(enabled)
        local m = require("render-markdown")
        if enabled then
          m.enable()
        else
          m.disable()
        end
      end,
    }):map("<leader>um")
  end,
}
