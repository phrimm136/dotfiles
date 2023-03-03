local global = {}
local home = os.getenv("HOME")

function global:load_variables()
    self.vim_path = vim.fn.stdpath('config')
    self.cache_dir = home .. '/.cache/nvim/'
    self.modules_dir = self.vim_path .. '/modules/'
    self.home = home
    self.data_dir = string.format('%s/site/', vim.fn.stdpath('data'))
end

global:load_variables()

return global
