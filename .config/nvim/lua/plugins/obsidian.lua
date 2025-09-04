return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  -- Also load on commands so keymaps work everywhere
  cmd = {
    "ObsidianToday",
    "ObsidianYesterday",
    "ObsidianTomorrow",
    "ObsidianNew",
    "ObsidianDailies",
    "ObsidianSearch",
  },
  -- lazy-load via event
  -- ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    -- refer to `:h file-pattern` for more examples
    "BufReadPre "
      .. vim.fn.expand("~")
      .. "/Nextcloud/obsidian/*.md",
  },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Nextcloud/obsidian",
      },
    },
    note_id_func = function(title)
      if title ~= nil then
        return title:gsub("[^%w%s_-]", ""):gsub("%s+", "-"):lower()
      else
        return tostring(os.time())
      end
    end,
    -- Add this section for image attachments
    attachments = {
      -- The folder to store images in, relative to the vault root
      img_folder = "assets/imgs",
      -- This will create a subfolder with the same name as the note
      -- img_folder = "assets/imgs/{notename}",
    },

    notes_subdir = "Zettelkasten",

    daily_notes = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = "Periodic Notes/Daily",
      -- Optional, if you want to change the date format for the ID of daily notes.
      date_format = "%Y-%m-%d",
      -- Optional, if you want to change the date format of the default alias of daily notes.
      alias_format = "%B %-d, %Y",
      -- Optional, default tags to add to each new daily note created.
      default_tags = { "daily-notes" },
      -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
      template = nil,
    },
    weekly_notes = {
      folder = "Periodic Notes/Weekly",
      date_format = "%Y-W%V", -- e.g. 2025-W20
      template = "weekly.md",
    },
    -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
    completion = {
      -- Set to false to disable completion.
      nvim_cmp = true,
      -- Trigger completion at 2 chars.
      min_chars = 2,
    },

    -- Optional, for templates (see below).
    templates = {
      folder = "Templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
      -- A map for custom variables, the key should be the variable and the value a function
      substitutions = {},
    },
  },
}
