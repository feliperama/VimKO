lua << EOF
local dap = require('dap')

dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    args = {os.getenv("HOME") .. "/.local/share/nvim/vscode-js-debug/dist/src/vsDebugServer.js", "${port}"},
  }
}

-- Idioma: ts, js, tsx, jsx
for _, lang in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
  dap.configurations[lang] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Debug Jest Test (ts-node)",
      runtimeExecutable = "npx",
      runtimeArgs = {
        "ts-node",
        "./node_modules/jest/bin/jest",
        "--runInBand",
        "${file}"  -- roda o arquivo atualmente aberto (útil no test)
      },
      program = "${file}",          -- <- ESSENCIAL para o DAP funcionar corretamente
      cwd = vim.fn.getcwd(),
      rootPath = vim.fn.getcwd(),
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen",
    },
  }
end

vim.fn.sign_define('DapBreakpoint', {text='🔴', texthl='', linehl='', numhl=''})
EOF
