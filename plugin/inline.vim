function! InlineEvaluate ()
    silent normal `<"*y`>
    python<<EOF
    import vim 
    expr = vim.eval('@"')
    ans = eval(expr)
    vim.command("`<,`>d")
    vim.command("i\n" + str(ans) + "\n.")
EOF
endfunction

map \e :InlineEvaluate()<CR>

