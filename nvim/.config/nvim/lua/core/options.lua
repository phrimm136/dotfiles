local vim = vim
local system = require('core.system')

local M = {}

local function bind_option(options)
    for k, v in pairs(options) do
        if v == true or v == false then
            vim.cmd('set ' .. k)
        else
            vim.cmd('set ' .. k .. '=' .. v)
        end
    end
end

M.load_options = function()
    local global_options = {
        guifont = "Monospace:h8",
        termguicolors = true,
        mouse = 'nv',
        hidden = true,
        fileformats = "unix,mac,dos",
        magic = true,
        virtualedit = "block",
        encoding = "utf-8",
        viewoptions = "folds,cursor,curdir,options",
        sessionoptions = "buffers,curdir,help,tabpages,winsize",
        clipboard = "unnamedplus",
        wildignorecase = true,
        backup = true,
        swapfile = false,
        directory = system.cache_dir .. "swap/",
        undodir = system.cache_dir .. "undo/",
        backupdir = system.cache_dir .. "backup/",
        viewdir = system.cache_dir .. "view/",
        spellfile = system.cache_dir .. "spell/en.utf-8.add",
        history = 2000,
        shada = "!,'300,<50,@100,s10,h",
        backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim",
        smarttab = true,
        shiftround = true,
        timeout = true,
        ttimeout = true,
        timeoutlen = 500,
        ttimeoutlen = 10,
        updatetime = 100,
        redrawtime = 1500,
        ignorecase = true,
        smartcase = true,
        infercase = true,
        incsearch = true,
        wrapscan = true,
        complete = ".,w,b,k",
        inccommand = "nosplit",
        grepformat = "%f:%l:%c:%m",
        grepprg = "rg --hidden --vimgrep --smart-case --",
        breakat = [[\ ;:,!?]],
        startofline = false,
        whichwrap = "b,s",
        switchbuf = "useopen",
        -- backspace = "indent,elo,start",
        diffopt = "filler,iwhite,internal,algorithm:patience,vertical,closeoff,hiddenoff",
        completeopt = "menu,menuone,preview,noselect",
        jumpoptions = "stack",
        showmode = true,
        shortmess = "aoOIcF",
        scrolloff = 1,
        sidescrolloff = 5,
        foldlevelstart = 99,
        ruler = true,
        list = true,
        showtabline = 8,
        equalalways = false,
        laststatus = 2,
        display = "lastline",
        showbreak = "↳  ",
        listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←",
        pumblend = 50,
        winblend = 50,
    }

    local bw_options = {
        undofile = true,
        synmaxcol = 2500,
        formatoptions = "1jcroql",
        textwidth = 160,
        expandtab = true,
        autoindent = true,
        smartindent = true,
        tabstop = 8,
        shiftwidth = 4,
        softtabstop = -1,
        breakindent = false,
        wrap = true,
        linebreak = false,
        colorcolumn = 160,
        foldenable = true,
        -- signcolumn = "yes",
        conceallevel = 1,
        concealcursor = "niv",
    }

    for name, value in pairs(global_options) do
        vim.o[name] = value
    end
    bind_option(bw_options)
end

return M
