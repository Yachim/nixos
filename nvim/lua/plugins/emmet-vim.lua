vim.g.user_emmet_install_global = 0
vim.cmd([[autocmd FileType html,css EmmetInstall]])
vim.g.user_emmet_leader_key = "<C-Enter>"

return {
  { "mattn/emmet-vim" },
}
