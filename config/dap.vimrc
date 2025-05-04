lua << EOF
local dap = require('dap')
local dapui = require('dapui')

-- Setup the UI
require("dapui").setup()
require("nvim-dap-virtual-text").setup()

-- JavaScript/TypeScript adapter (using vscode-js-debug)
require("dap-vscode-js").setup({
  node_path = "node",
  debugger_path = os.getenv("HOME") .. "/.local/share/nvim/vscode-js-debug",
  adapters = { "pwa-node" },
})

for _, language in ipairs({"typescript", "javascript", "typescriptreact", "javascriptreact"}) do
  dap.configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch Current File",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      runtimeExecutable = "node",
      sourceMaps = true,
      protocol = "inspector",
      console = "integratedTerminal",
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Jest Current File",
      runtimeExecutable = "node",
      runtimeArgs = {
        "./node_modules/jest/bin/jest.js",
        "${file}",
        "--runInBand"
      },
      rootPath = vim.fn.getcwd(),
      cwd = vim.fn.getcwd(),
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen",
    },
  }
end

-- Keybindings
vim.fn.sign_define('DapBreakpoint', {text='🔴', texthl='', linehl='', numhl=''})
EOF
