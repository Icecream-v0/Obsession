" I Have ADHD - Vim Plugin
" Transform AI coding assistant responses to be ADHD-friendly

if exists('g:loaded_i_have_adhd')
  finish
endif
let g:loaded_i_have_adhd = 1

" Default settings
if !exists('g:adhd_mode_enabled')
  let g:adhd_mode_enabled = 0
endif

" ADHD rules text
let s:adhd_rules = '
\## Output style
\
\The reader has ADHD. Shape every response so it can be acted on:
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

" Toggle ADHD mode
function! AdhdToggle()
  let g:adhd_mode_enabled = !g:adhd_mode_enabled
  if g:adhd_mode_enabled
    echohl Statement
    echo "ADHD-friendly mode ENABLED"
    echohl None
  else
    echohl WarningMsg
    echo "ADHD-friendly mode DISABLED"
    echohl None
  endif
endfunction

" Show ADHD rules
function! AdhdShowRules()
  echo s:adhd_rules
endfunction

" Copy rules to clipboard
function! AdhdCopyRules()
  let @* = s:adhd_rules
  echo "ADHD rules copied to clipboard"
endfunction

" Status line indicator
function! AdhdStatusLine()
  if g:adhd_mode_enabled
    return '[ADHD ON]'
  else
    return ''
  endif
endfunction

" Commands
command! AdhdToggle call AdhdToggle()
command! AdhdEnable let g:adhd_mode_enabled = 1 | echo "ADHD mode enabled"
command! AdhdDisable let g:adhd_mode_enabled = 0 | echo "ADHD mode disabled"
command! AdhdRules call AdhdShowRules()
command! AdhdCopy call AdhdCopyRules()

" Keybindings (configurable)
if !hasmapto('AdhdToggle')
  nnoremap <silent> <Leader>aa :AdhdToggle<CR>
endif

" Add to statusline (optional)
if !exists('g:adhd_in_statusline')
  let g:adhd_in_statusline = 1
endif

if g:adhd_in_statusline
  if &statusline !~# '%{AdhdStatusLine()}'
    let &statusline .= '%{AdhdStatusLine()}'
  endif
endif

echo "I Have ADHD plugin loaded. Use :AdhdToggle to enable/disable."
