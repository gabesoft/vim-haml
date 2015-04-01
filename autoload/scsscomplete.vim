function! s:css_keywords()
    " code
endfunction

function! s:findstart()
    let line  = getline('.')
    let start = col('.') - 1
    let begin = col('.') - 2

    while start >= 0 && line[start - 1] =~ '\%(\k\|-\)'
        let start = start - 1
    endw

    let b:compl_context = line[0:begin]

    return start
endfunction

function! s:borders(line)
    let borders = {}
    let line    = a:line

    let openbrace  = strridx(line, '{')
    let closebrace = strridx(line, '}')
    let colon      = strridx(line, ':')
    let dot        = strridx(line, '.')
    let anddot     = strridx(line, '&.')
    let andcolon   = strridx(line, '&:')
    let semicolon  = strridx(line, ';')
    let opencomm   = strridx(line, '/*')
    let closecomm  = strridx(line, '*/')
    let style      = strridx(line, 'style\s*=')
    let atrule     = strridx(line, '@')
    let exclam     = strridx(line, '!')

    if openbrace > -1  | let borders[openbrace]  = "openbrace"  | endif
    if closebrace > -1 | let borders[closebrace] = "closebrace" | endif
    if colon > -1      | let borders[colon]      = "colon"      | endif
    if dot > -1        | let borders[dot]        = "dot"        | endif
    if anddot > -1     | let borders[anddot]     = "anddot"     | endif
    if andcolon > -1   | let borders[andcolon]   = "andcolon"   | endif
    if semicolon > -1  | let borders[semicolon]  = "semicolon"  | endif
    if opencomm > -1   | let borders[opencomm]   = "opencomm"   | endif
    if closecomm > -1  | let borders[closecomm]  = "closecomm"  | endif
    if style > -1      | let borders[style]      = "style"      | endif
    if atrule > -1     | let borders[atrule]     = "atrule"     | endif
    if exclam > -1     | let borders[exclam]     = "exclam"     | endif

    return borders
endfunction

function! s:complete(base)
    let line = a:base
    if exists('b:compl_context')
        let line = b:compl_context
        unlet! b:compl_context
    endif

    let borders = s:borders(line)
endfunction

function! scsscomplete#CompleteSCSS(findstart, base)
    if a:findstart
        call s:findstart()
    else
        call s:complete(a:base)
    endif
endfunction
