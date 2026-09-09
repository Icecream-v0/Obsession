" I Have OBSESSION - Vim Plugin
" Transform AI coding assistant responses to be OBSESSION-friendly

if exists('g:loaded_obsession_ai')
  finish
endif
let g:loaded_obsession_ai = 1

" Default settings
if !exists('g:obsession_mode_enabled')
  let g:obsession_mode_enabled = 0
endif

" OBSESSION rules text
let s:obsession_rules = '
\## Output style
\
\The reader has OBSESSION. Shape every response so it can be acted on:
\
\1. Lead with the answer or next action: command, path, or snippet first.
\2. Number multi-step work; one bounded action per step.
\3. End with one next action doable in under two minutes.
\4. Finish the current issue before raising a new one.
\5. Restate progress each turn ("step 3 of 5 done").
\6. Give time estimates in concrete units, never "a bit".
\7. After a change, show what now works.
\8. Errors: state location, cause, and fix. No drama.
\9. Cap lists at 5 items.
\10. No preamble, no recaps, no closers.
\'

" Toggle OBSESSION mode
function! AdhdToggle()
  let g:obsession_mode_enabled = !g:obsession_mode_enabled
  if g:obsession_mode_enabled
    echohl Statement
    echo "OBSESSION-friendly mode ENABLED"
    echohl None
  else
    echohl WarningMsg
    echo "OBSESSION-friendly mode DISABLED"
    echohl None
  endif
endfunction

" Show OBSESSION rules
function! AdhdShowRules()
  echo s:obsession_rules
endfunction

" Copy rules to clipboard
function! AdhdCopyRules()
  let @* = s:obsession_rules
  echo "OBSESSION rules copied to clipboard"
endfunction

" Status line indicator
function! AdhdStatusLine()
  if g:obsession_mode_enabled
    return '[OBSESSION ON]'
  else
    return ''
  endif
endfunction

" Commands
command! AdhdToggle call AdhdToggle()
command! AdhdEnable let g:obsession_mode_enabled = 1 | echo "OBSESSION mode enabled"
command! AdhdDisable let g:obsession_mode_enabled = 0 | echo "OBSESSION mode disabled"
command! AdhdRules call AdhdShowRules()
command! AdhdCopy call AdhdCopyRules()

" Keybindings (configurable)
if !hasmapto('AdhdToggle')
  nnoremap <silent> <Leader>aa :AdhdToggle<CR>
endif

" Add to statusline (optional)
if !exists('g:obsession_in_statusline')
  let g:obsession_in_statusline = 1
endif

if g:obsession_in_statusline
  if &statusline !~# '%{AdhdStatusLine()}'
    let &statusline .= '%{AdhdStatusLine()}'
  endif
endif

echo "I Have OBSESSION plugin loaded. Use :AdhdToggle to enable/disable."
