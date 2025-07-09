return {
  "yetone/avante.nvim",
  build = function()
    if vim.fn.has("win32") == 1 then
      return "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    else
      return "make"
    end
  end,
  event = "VeryLazy",
  version = false,
  opts = {
    provider = "openai",
    providers = {
      openai = {
        endpoint = "https://api.openai.com/v1",
        model = "gpt-4o", -- or your preferred model
        timeout = 30000,
        extra_request_body = {
          temperature = 0.7,
          max_tokens = 2048,
        },
        -- DO NOT put api_key here!
        -- api_key = "sk-xxxxxx", -- <--- DO NOT DO THIS
      },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-tree/nvim-web-devicons",
    -- ...other deps if you want (optional)
  },
}
