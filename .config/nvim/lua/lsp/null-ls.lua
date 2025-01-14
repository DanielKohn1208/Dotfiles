local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local source = { }

null_ls.setup({
	debug = false,
	sources = {
		-- formatting.autopep8.with({extra_args= {"-a"}}),
		formatting.stylua,
		formatting.google_java_format.with({extra_args = {"--aosp"}}),
		-- diagnostics.flake8.with({ extra_args = {"--max-line-length", "100"} }),
		formatting.djlint.with({extra_args = {"--format-js", "--indent", "2"}}),
		null_ls.builtins.code_actions.gitsigns, -- codeactions for null ls
	},
	border = "rounded",
	on_attach = require("lsp.lsp-config").on_attach,
})

