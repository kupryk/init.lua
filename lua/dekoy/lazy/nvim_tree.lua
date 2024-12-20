return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- optional, for file icons
  },
  config = function()
    require("nvim-tree").setup({
      hijack_netrw = true, -- Disable netrw
      sync_root_with_cwd = true, -- Synchronize the tree's root with the working directory
      respect_buf_cwd = true, -- Change tree root based on buffer's parent directory
      view = {
        -- Dynamically set the width to 1/5 of the screen
        width = function()
          return math.floor(vim.o.columns * 0.2)
        end,
        adaptive_size = false, -- Disable automatic resizing
        side = "left", -- Tree appears on the left side
        preserve_window_proportions = true, -- Maintain proportions
      },
      renderer = {
        highlight_git = true, -- Highlight Git status in the tree
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
        },
      },
      diagnostics = {
        enable = true, -- Show diagnostics in the tree
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      actions = {
        open_file = {
          resize_window = true, -- Resize the tree window when opening a file
          quit_on_open = false, -- Keep the tree open after opening a file
        },
      },
      git = {
        enable = true, -- Enable Git integration
        ignore = false, -- Do not hide ignored files
      },
      filesystem_watchers = {
        enable = true, -- Watch for file changes
      },
    })

    -- Automatically open the tree when starting Neovim
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function(data)
        -- Check if the buffer is a directory
        local directory = vim.fn.isdirectory(data.file) == 1
        if directory then
          -- Change to the directory
          vim.cmd.cd(data.file)
          -- Open the tree
          require("nvim-tree.api").tree.open()
        end
      end,
    })
  end,
}
