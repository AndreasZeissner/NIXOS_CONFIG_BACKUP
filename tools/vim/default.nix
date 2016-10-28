{ pkgs, ... }:
{

environment.systemPackages = with pkgs; [
        vim # ...
        (
          vim_configurable.customize {
              name = "wvim";
              vimrcConfig.customRC = ''
                set encoding=utf-8
                set fileencoding=utf-8
                set fileencodings=utf-8
                set backspace=indent,eol,start
                set tabstop=4
                set softtabstop=0
                set shiftwidth=4
                set expandtab
                set number
                set hidden
                set hlsearch
                set incsearch
                set ignorecase
                set smartcase
                set bomb
                set binary
                set ttyfast
                set nobackup
                set noswapfile
                set fileformats=unix
                set showcmd
                set shell=/bin/sh
                let g:session_directory = "~/.vim/session"
                let g:session_autoload = "no"
                let g:session_autosave = "no"
                let g:session_command_aliases = 1
                syntax on
                set ruler
                let g:NERDTreeChDirMode=2
                let g:NERDTreeShowBookmarks=1
                let g:nerdtree_tabs_focus_on_files=1
                let g:NERDTreeWinSize = 50
                set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
                nnoremap <silent> <F2> :NERDTreeFind<CR>
                let g:syntastic_always_populate_loc_list=1
                let g:syntastic_auto_loc_list=1
                let g:syntastic_aggregate_errors = 1
                let g:molokai_original = 1
              '';
              vimrcConfig.vam.knownPlugins = pkgs.vimPlugins;
              vimrcConfig.vam.pluginDictionaries = [
              { names = [
                "nerdtree" "vim-nerdtree-tabs" "syntastic" "vim-addon-nix" "vimwiki" "molokai" "calendar"
              ]; }
            ];
          }
        )
      ];
    }
