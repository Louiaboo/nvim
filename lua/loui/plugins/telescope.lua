return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-file-browser.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")
		local fb_actions = require("telescope").extensions.file_browser.actions

		local function telescope_buffer_dir()
			return vim.fn.expand("%:p:h")
		end

		telescope.setup({
			defaults = {
				mappings = {
					n = {
						["q"] = actions.close,
					},
				},
			},
			extensions = {
				file_browser = {
					theme = "dropdown",
					hijack_netrw = true,
					mappings = {
						["i"] = {
							["<C-w>"] = function()
								vim.cmd("normal vbd")
							end,
						},
						["n"] = {
							["N"] = fb_actions.create,
							["h"] = fb_actions.goto_parent_dir,
							["/"] = function()
								vim.cmd("startinsert")
							end,
							["<C-u>"] = function(prompt_bufnr)
								for i = 1, 10 do
									actions.move_selection_previous(prompt_bufnr)
								end
							end,
							["<C-d>"] = function(prompt_bufnr)
								for i = 1, 10 do
									actions.move_selection_next(prompt_bufnr)
								end
							end,
							["<PageUp>"] = actions.preview_scrolling_up,
							["<PageDown>"] = actions.preview_scrolling_down,
						},
					},
				},
			},
		})

		telescope.load_extension("file_browser")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness
		keymap.set("n", "<leader>ff", function()
			builtin.find_files({
				no_ignore = false,
				hidden = true,
			})
		end)
		keymap.set("n", "<leader>fr", function()
			builtin.live_grep()
		end)
		keymap.set("n", "\\\\", function()
			builtin.buffers()
		end)
		keymap.set("n", "<leader>ft", function()
			builtin.help_tags()
		end)
		keymap.set("n", "<leader>f;", function()
			builtin.resume()
		end)
		keymap.set("n", "<leader>fe", function()
			builtin.diagnostics()
		end)
		keymap.set("n", "sf", function()
			telescope.extensions.file_browser.file_browser({
				path = "%:p:h",
				cwd = telescope_buffer_dir(),
				respect_gitignore = false,
				hidden = true,
				grouped = true,
				previewer = true,
				initial_mode = "normal",
				layout_config = { height = 40 },
			})
		end)
	end,
}
