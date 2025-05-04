-- ~/.config/nvim/lua/neotest_helpers.lua
local M = {}

function M.open_output_for_node_at_cursor()
  local neotest = require("neotest")

  -- This is the official API to get the test under the cursor
  local pos = neotest.run.get_tree_from_current()
  if not pos then
    vim.notify("No test node found under cursor.", vim.log.levels.WARN)
    return
  end

  neotest.output.open({
    position = pos:data().id,
    enter = true,
  })
end

return M
