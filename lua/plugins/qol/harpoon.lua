return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup({})
		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				})
				:find()
		end

		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():append()
		end, { desc = "[H]arpoon [A]dd" })
		vim.keymap.set("n", "<leader>he", function()
			toggle_telescope(harpoon:list())
		end, { desc = "[H]arpoon ui" })
		vim.keymap.set("n", "<leader>h1", function()
			harpoon:list():select(1)
		end, { desc = "[H]arpoon file 1" })
		vim.keymap.set("n", "<leader>h2", function()
			harpoon:list():select(2)
		end, { desc = "[H]arpoon file 2" })
		vim.keymap.set("n", "<leader>h3", function()
			harpoon:list():select(3)
		end, { desc = "[H]arpoon file 3" })
		vim.keymap.set("n", "<leader>hp", function()
			harpoon:list():prev()
		end, { desc = "[H]arpoon [P]rev" })
		vim.keymap.set("n", "<leader>hn", function()
			harpoon:list():next()
		end, { desc = "[H]arpoon [N]ext" })
	end,
}
