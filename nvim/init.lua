-- vim config
vim.cmd([[
set number
set splitright
set tabstop=4
set termguicolors
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
]])
local keyset = vim.keymap.set

keyset("n", "<C-s>", ":w<CR>")
keyset("i", "<C-s>", "<Esc>:w<CR>i<right>")
keyset({ "n", "i" }, "<A-i>", "<plug>(coc-format)")

-- Coc configs

-- Autocomplete
function _G.check_back_space()
	local col = vim.fn.col('.') - 1
	return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use Tab for trigger completion with characters ahead and navigate
-- NOTE: There's always a completion item selected by default, you may want to enable
-- no select by setting `"suggest.noselect": true` in your configuration file
-- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
-- other plugins before putting this into your config
local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
-- colorizer

require 'colorizer'.setup(
	{ "*" },
	{
		RGB      = true, -- #RGB hex codes
		RRGGBB   = true, -- #RRGGBB hex codes
		names    = true, -- "Name" codes like Blue
		RRGGBBAA = true, -- #RRGGBBAA hex codes
		rgb_fn   = true, -- CSS rgb() and rgba() functions
		hsl_fn   = true, -- CSS hsl() and hsla() functions
		css      = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
		css_fn   = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
		-- Available modes: foreground, background
		mode     = 'background', -- Set the display mode.
	}
);


-- packer

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	-- autocomplete and LSP
	use { 'neoclide/coc.nvim', branch = 'release' }
	-- Vim motion trainer
	use 'thePrimeagen/vim-be-good'
	-- Nice little colors
	use 'arzg/vim-colors-xcode'
	-- LaTeX support
	use 'lervag/vimtex'
	-- ctrl -p fuzzy finder
	use 'kien/ctrlp.vim'
	-- colorizer
	use 'norcalli/nvim-colorizer.lua'

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)

--[[
<BS>           Backspace
<Tab>          Tab
<CR>           Enter
<Enter>        Enter
<Return>       Enter
<Esc>          Escape
<Space>        Space
<Up>           Up arrow
<Down>         Down arrow
<Left>         Left arrow
<Right>        Right arrow
<F1> - <F12>   Function keys 1 to 12
#1, #2..#9,#0  Function keys F1 to F9, F10
<Insert>       Insert
<Del>          Delete
<Home>         Home
<End>          End
<PageUp>       Page-Up
<PageDown>     Page-Down
<bar>          the '|' character, which otherwise needs to be escaped '\|'
--]]
