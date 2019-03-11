set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
" set rtp+=$USERPROFILE\AppData\Local\nvim\.vim\bundle\Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ervandew/supertab'
    let g:SuperTabDefaultCompletionType = '<C-n>'
Plugin 'w0rp/ale'
    let g:ale_linters = {
        \   'python': ['flake8'],
    \}
    let g:ale_fixers = {
         \   'python': ['black']
    \}
    let g:ale_python_black_options = "-l 79"
    let g:ale_fix_on_save = 1
    let g:airline#extensions#ale#enabled = 1
    let g:ale_echo_msg_error_str = 'E'
    let g:ale_echo_msg_warning_str = 'W'
    let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
Plugin 'davidhalter/jedi-vim'
    let g:jedi#completions_enabled = 0
" Plugin 'Shougo/deoplete.nvim'
"   let g:deoplete#enable_at_startup = 1
"
Plugin 'Valloric/YouCompleteMe'
    let g:ycm_python_binary_path = '/Users/kwanwaichung/anaconda3/bin/python'
    let g:ycm_global_ycm_extra_conf = expand("~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py")
    let g:ycm_autoclose_preview_window_after_insertion = 1
    let g:ycm_autoclose_preview_window_after_completion = 0
    let g:ycm_filetype_whitelist = {'cpp': 1}
    if !exists('g:ycm_semantic_triggers')
      let g:ycm_semantic_triggers = {}
    endif
Plugin 'ncm2/ncm2'
Plugin 'roxma/nvim-yarp'
        " enable ncm2 for all buffers
        autocmd BufEnter * call ncm2#enable_for_buffer()

        " IMPORTANT: :help Ncm2PopupOpen for more information
        set completeopt=noinsert,menuone,noselect,preview

        augroup ncm_preview
                autocmd InsertLeave * if pumvisible() == 0|pclose|endif
        augroup END

        " NOTE: you need to install completion sources to get completions. Check
        " our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
        Plugin 'ncm2/ncm2-bufword'
        Plugin 'ncm2/ncm2-path'
        Plugin 'ncm2/ncm2-jedi'
        Plugin 'ncm2/ncm2-tmux'

Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'easymotion/vim-easymotion'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-airline/vim-airline'
    " let g:airline_theme='luna'
    let g:airline_theme='gruvbox'
    set laststatus=2
    " Enable the list of buffers
    let g:airline#extensions#tabline#enabled = 1
    " Show just the filename
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline_powerline_fonts = 1

Plugin 'scrooloose/nerdcommenter'
    " Add spaces after comment delimiters by default
    let g:NERDSpaceDelims = 1
    " Enable trimming of trailing whitespace when uncommenting
    let g:NERDTrimTrailingWhitespace = 1


Plugin 'Chiel92/vim-autoformat'
      let g:formatters_python = ['black']
      " let g:formatdef_black = '"black -l 79"'
      " let g:formatter_yapf_style = 'facebook'

Plugin 'xuhdev/SingleCompile'



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       General                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  " {
      filetype plugin indent on   " Automatically detect file types.
      set mouse=a                 " Automatically enable mouse usage
      set mousehide               " Hide the mouse cursor while typing
      set backspace=indent,eol,start
      set hidden
      set fo-=t

      fu! SaveSess()
        execute 'mksession! ~/.vim/.session.vim'
      endfunction

      fu! RestoreSess()
        if filereadable($VIM . '~/.vim/.session.vim')
          echo("found")
          execute 'so ~/.vim/.session.vim'
          if bufexists(1)
              for l in range(1, bufnr('$'))
                if bufwinnr(l) == -1
                  exec 'sbuffer ' . l
                endif
              endfor
          endif
        endif
      endfunction

      autocmd VimLeave * call SaveSess()
      autocmd VimEnter * nested call RestoreSess()
  " }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Fonts                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  " {
      if has("gui_running")
        if has("gui_gtk2")
          set guifont=Inconsolata\ 12
        elseif has("gui_macvim")
            set guifont=Monaco:h12
        elseif has("gui_win32")
          set guifont=DejaVu Sans Mono:h13:cANSI
        endif
      endif
  " }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Colors Settings                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  " {
      syntax enable       " switches on syntax highlighting
      set background=dark
      colorscheme gruvbox
      if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
              let g:solarized_termcolors=256
              let g:solarized_termtrans=1
              let g:solarized_contrast="normal"
              let g:solarized_visibility="normal"
       "colorscheme solarized
       
      endif
  " }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Remap                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " {
      "Leader Shortcuts
      " leader is comma
        let mapleader=","

      "AutoFormat
      if has("mac")
        nnoremap Ï :Autoformat<CR>
      else
        nnoremap <A-S-f> :Autoformat<CR>
      endif

      "SingleCompile
      map <F10> :SCCompileRun<cr>

      "nerdtree
        map <leader>t :NERDTreeToggle<CR>
        map <leader>w <C-w>w
        " Set nerdtree to current folder
        if has("MAC")
          map ® :NERDTreeFind<cr>
        else
          map <A-r> :NERDTreeFind<cr>
        endif

      "ALE
      nmap <silent> <leader>ej :ALENext<CR>
      nmap <silent> <leader>ek :ALEPrevious<CR>

      "Easymotion
      map  <Leader>f <Plug>(easymotion-bd-f)
      nmap <Leader>f <Plug>(easymotion-overwin-f)

      " for inverse tab
      inoremap <S-Tab> <C-d>

      " jk is escape
      inoremap jk <esc>
      vnoremap jk <esc>
      " save session
      nnoremap <leader>s :mksession<CR>

      "Movement
        " move vertically by visual line
        nnoremap j gj
        nnoremap k gk
        " move between split windows
        nnoremap <C-J> <C-W><C-J>
        nnoremap <C-K> <C-W><C-K>
        nnoremap <C-L> <C-W><C-L>
        nnoremap <C-H> <C-W><C-H>

      "Buffer
        " Move to the next buffer
        nmap <leader>l :bnext!<CR>

        " Move to the previous buffer
        nmap <leader>h :bprevious!<CR>

        " To open a new empty buffer
        nmap <C-n> :enew<cr>

        " Close the current buffer and move to the previous one
        nmap <leader>q :bp <BAR> bd #<CR>


      " Copy to clipboard
        vnoremap  <leader>y  "+y
        nnoremap  <leader>Y  "+yg_
        nnoremap  <leader>y  "+y
        nnoremap  <leader>yy  "+yy

      " Paste from clipboard
        nnoremap <leader>p "+p
        nnoremap <leader>P "+P
        vnoremap <leader>p "+p
        vnoremap <leader>P "+P

      " NERDCommenter
      if has('win32')
        nmap <C-/> <Plug>NERDCommenterToggle
        vmap <C-/> <Plug>NERDCommenterToggle
      else
        nmap <C-_> <Plug>NERDCommenterToggle
        vmap <C-_> <Plug>NERDCommenterToggle
      endif

      " ALE
      nmap <silent> <leader>ej :ALENext<CR>
      nmap <silent> <leader>ek :ALEPrevious<CR>
  " }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Folding                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  " {
      set foldenable          " enable folding
      set foldlevelstart=10   " open most folds by default, only very
                              " nested blocks of code are foded
      set foldnestmax=10      " 10 nested fold max
      set foldmethod=syntax   " fold based on syntax
  " }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Searching                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  " {
      set incsearch           " search as characters are entered
      set hlsearch            " highlight matches
      " turn off search highlight (, space)
      nnoremap <leader><space> :nohlsearch<CR>
  " }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       UI Config                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  " {
      set number              " show line numbers
      set relativenumber 
      " nnoremap <leader>n :call NumberToggle()<cr> " to change between relative number
      autocmd InsertEnter * :set norelativenumber
      autocmd InsertLeave * :set relativenumber
      set showcmd             " show command in bottom bar
      set cursorline          " highlight current line
      filetype indent on      " load filetype-specific indent files
      set wildmenu            " visual autocomplete for command menu
      set lazyredraw          " redraw only when we need to.
      set showmatch           " highlight matching [{()}]
      set showmode            " Display the current mode

    function! NumberToggle()
      if(&relativenumber == 1)
        set norelativenumber
      else
        set relativenumber
      endif
    endfunc
  " }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Spaces & Tabs                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  " {
      set tabstop=4       " number of visual spaces per TAB
      set shiftwidth=4       " number of visual spaces per TAB
      set softtabstop=4   " number of spaces in tab when editing
      set expandtab       " tabs are spaces
      set tw=79
  " }
  
"Autogroups
augroup configgroup
autocmd!
autocmd VimEnter * highlight clear SignColumn
au BufNewFile,BufRead *.ejs set filetype=html
autocmd FileType cpp setlocal shiftwidth=2
autocmd FileType cpp setlocal softtabstop=2
autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md :%s/\s\+$//e
"   autocmd FileType java setlocal noexpandtab
"   autocmd FileType java setlocal list
"   autocmd FileType java setlocal listchars=tab:+\ ,eol:-
"   autocmd FileType java setlocal formatprg=par\ -w80\ -T4
autocmd FileType html setlocal shiftwidth=2
autocmd FileType tex setl updatetime=1
autocmd FileType javascript setlocal tabstop=2
autocmd FileType javascript setlocal shiftwidth=2
autocmd FileType php setlocal expandtab
autocmd FileType php setlocal list
autocmd FileType php setlocal listchars=tab:+\ ,eol:-
autocmd FileType php setlocal formatprg=par\ -w80\ -T4
autocmd FileType ruby setlocal tabstop=2
autocmd FileType ruby setlocal shiftwidth=2
autocmd FileType ruby setlocal softtabstop=2
autocmd FileType ruby setlocal commentstring=#\ %s
autocmd FileType python setlocal commentstring=#\ %s
autocmd BufEnter *.cls setlocal filetype=java
autocmd BufEnter *.zsh-theme setlocal filetype=zsh
autocmd BufEnter Makefile setlocal noexpandtab
autocmd BufEnter *.sh setlocal tabstop=2
autocmd BufEnter *.sh setlocal shiftwidth=2
autocmd BufEnter *.sh setlocal softtabstop=2
augroup END<Paste>
