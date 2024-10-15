return {
  'theHamsta/nvim-dap-virtual-text',
  lazy = true,
  opts = {
    endable = false,
    -- Display debug text as a comment
    commented = true,
    -- Customize virtual text
    display_callback = function(variable, buf, stackframe, node, options)
      -- Check if `variable` and `variable.value` are valid to prevent errors
      if variable and variable.value then
        -- Handle different virtual text positions
        if options.virt_text_pos == 'inline' then
          return ' = ' .. tostring(variable.value)
        else
          return tostring(variable.name) .. ' = ' .. tostring(variable.value)
        end
      else
        -- Return an empty string if the variable or value is nil
        return ''
      end
    end,
  }
}
-- -- Inline Debug Text
-- return {
--   'theHamsta/nvim-dap-virtual-text',
--   lazy = true,
--   opts = {
--     -- Display debug text as a comment
--     commented = true,
--     -- Customize virtual text
--     display_callback = function(variable, buf, stackframe, node, options)
--       if options.virt_text_pos == 'inline' then
--         return ' = ' .. variable.value
--       else
--         return variable.name .. ' = ' .. variable.value
--       end
--     end,
--   }
-- }

