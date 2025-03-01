return {
	"ibhagwan/fzf-lua",
	lazy = false,
	dependencies = { "echasnovski/mini.icons" },
	version = false,
	keys = {
		{ "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find Files" },
		{ "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Find Buffers" },
		{ "<leader>fs", "<cmd>FzfLua live_grep_native<cr>", desc = "Find Live grep" },
	},
	opts = function()
		local actions = require("fzf-lua.actions")
		local img_prev_bin = vim.fn.executable("ueberzug") == 1 and { "ueberzug" }
			or vim.fn.executable("chafa") == 1 and { "chafa" }
			or vim.fn.executable("viu") == 1 and { "viu", "-b" }
			or nil
		local fzflua = {
			"default-prompt",
			fzf_colors = {
				true,
				["fg"] = { "fg", "CursorLine" },
				["fg+"] = { "fg", "PmenuSel" },
				["bg"] = { "bg", "Normal" },
				["bg+"] = { "bg", { "PmenuSel", "Normal" } },
				["gutter"] = "-1",
			},
			keymap = {
				builtin = {
					["<c-u>"] = "preview-page-up",
					["<c-d>"] = "preview-page-down",
				},
				fzf = {
					["ctrl-e"] = "select-all+accept",
				},
			},
			fzf_opts = {
				["--cycle"] = "",
			},
			previewers = {
				builtin = {
					ueberzug_scaler = "cover",
					extensions = {
						["gif"] = img_prev_bin,
						["png"] = img_prev_bin,
						["jpg"] = img_prev_bin,
						["jpeg"] = img_prev_bin,
						["svg"] = { "chafa" },
					},
				},
			},
			winopts = {
				-- split = 'botright new',
				border = "single",
				backdrop = 100,
				preview = {
					border = "single",
					layout = "flex",
					scrollbar = "float",
				},
			},
			files = {
				cwd_prompt = false,
				prompt = "Files❯ ",
				actions = {
					["alt-i"] = { actions.toggle_ignore },
					["alt-h"] = { actions.toggle_hidden },
					["ctrl-q"] = { fn = require("fzf-lua").actions.file_sel_to_qf, prefix = "select-all" },
				},
			},
			grep = {
				actions = {
					["alt-i"] = { actions.toggle_ignore },
					["alt-h"] = { actions.toggle_hidden },
					["ctrl-q"] = { fn = require("fzf-lua").actions.file_sel_to_qf, prefix = "select-all" },
				},
			},
			lsp = {
				code_actions = {
					winopts = {
						preview = {
							layout = "vertical",
						},
					},
				},
			},
		}
		return fzflua
	end,
}
