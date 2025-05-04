if exists('g:plugs["neotest"]')
lua << EOF
vim.notify = function(msg, ...) print("NOTIFY >>>", msg) end

local neotest = require("neotest")

neotest.setup({
  adapters = {
    require("neotest-jest")({
      jestCommand = "npm test --",
      jestConfigFile = "jest.config.ts",
      env = { CI = true },
      cwd = function() return vim.fn.getcwd() end,
    }),
  },
})
EOF
endif
