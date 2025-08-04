-- Basic Vim Options
require('vim-opts').setup()

require('basic-keymaps').setup()

require('basic-autocmds').setup()

require('lazy-plugins').setup()
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
