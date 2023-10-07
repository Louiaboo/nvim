return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	config = function()
		require("bufferline").setup({
			options = {
				close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
				right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
				separator_style = "thin", -- slant, padded_slant; slope, padded_slope; thick; thin
				color_icons = true,
				diagnostics = false,
				diagnostics_update_in_insert = false,
				diagnostics_indicator = true,
				always_show_bufferline = true,
				themable = true,
				show_buffer_icons = true,
			},
		})
	end,
}
