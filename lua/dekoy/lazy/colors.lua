return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        config = function()
            require('catppuccin').setup({
                styles = {
                    italic = false,
                },
            })
        end
    },
}
