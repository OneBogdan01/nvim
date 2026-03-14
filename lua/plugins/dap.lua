return {
  "mfussenegger/nvim-dap",
  opts = function()
    local dap = require("dap")

    -- Configure the codelldb adapter (Windows-compatible)
    local mason_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb"
    if vim.fn.has("win32") == 1 then
      mason_path = mason_path .. ".exe"
    end

    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = mason_path,
        args = { "--port", "${port}" },
      },
    }

    -- Tell DAP how to launch/debug C++ executables
    dap.configurations.cpp = {
      {
        name = "Launch executable",
        type = "codelldb",
        request = "launch",
        -- Automatically get the path from cmake-tools
        program = function()
          local cmake = require("cmake-tools")
          local target_path = cmake.get_launch_target_path()
          if target_path then
            return target_path
          end
          vim.notify("No launch target selected! Use :CMakeSelectLaunchTarget first.", vim.log.levels.ERROR)
          return ""
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
      },
    }

    -- Reuse the same config for C
    dap.configurations.c = dap.configurations.cpp
  end,
}