local present, cmp = pcall(require, "cmp")
if not present then
  return
end

cmp.setup({
    snippet = {
        expand = function(args)
          snippy.expand_snippet(args.body)
        end
    },
    sources = {
        { name = "buffer" },
        { name = "path" },
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "snippy" },
    },
})