return {
  "Civitasv/cmake-tools.nvim",
  lazy = false,
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    cmake_use_preset = true,
  },
  keys = {
    { "<leader>mb", "<cmd>CMakeBuild<cr>", desc = "CMake Build" },
    { "<leader>mr", "<cmd>CMakeRun<cr>", desc = "CMake Run" },
    { "<leader>ms", "<cmd>CMakeSelectBuildPreset<cr>", desc = "Select Preset" },
    { "<leader>mt", "<cmd>CMakeSelectLaunchTarget<cr>", desc = "Select Target" },
  },
}
