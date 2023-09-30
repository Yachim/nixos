vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.prisma",
  command = "setfiletype graphql",
})

return {
  { "jparise/vim-graphql" },
}
