local vimp = require('vimp')

vimp.always_override = true

function map2(lhs, rhs)
    vimp.nnoremap(lhs, rhs)
    vimp.xnoremap(lhs, rhs)
    vimp.onoremap(lhs, rhs)
end

-- Basic arrow keys --
map2('u', 'gk')
map2('e', 'gj')
map2('a', 'h')
map2('o', 'l')

map2('<M-u>', 'O')
map2('<M-a>', 'i')
map2('<M-e>', 'o')
map2('<M-o>', 'a')

map2('<C-w>u', '<C-w>k')
map2('<C-w>a', '<C-w>h')
map2('<C-w>e', '<C-w>j')
map2('<C-w>o', '<C-w>l')
map2('<C-w>U', '<C-w>K')
map2('<C-w>A', '<C-w>H')
map2('<C-w>E', '<C-w>J')
map2('<C-w>O', '<C-w>L')

-- F, B keys --
map2('f', 'b')
map2('F', '^')
map2('<C-f>', 'B')
map2('<M-f>', 'I')
map2('b', 'w')
map2('B', '$')
map2('<C-b>', 'W')
map2('<M-b>', 'A')

-- High, Mid, Low keys --
map2('y', '<nop>')
map2('Y', '<nop>')
map2('<M-y>', 'H')
map2('<M-i>', 'M')
map2('k', 'y')
map2('K', 'y$')
map2('<M-k>', 'L')

map2('h', 'e')

map2('<C-h>', 'E')

-- Find (Look) --
map2('l', 'f')
map2('L', 'F')

-- Undo --
map2('w', 'u')
map2('W', 'U')