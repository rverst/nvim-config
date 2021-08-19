local fn = require('utils.fn')

local function calcColors(hex)
  if #hex ~= 7 then
    return nil
  end

  local r = tonumber(hex:sub(2, 3), 16)
  local g = tonumber(hex:sub(4, 5), 16)
  local b = tonumber(hex:sub(6, 7), 16)

  return { hex = hex, raw = hex:sub(2, 7), r = r, g = g, b = b, term = fn.rgbToX256(r, g, b) }
end

-- stylua: ignore
local c = {
black         = calcColors('#000000'),
white         = calcColors('#FFFFFF'),
dark1         = calcColors('#232323'),
dark2         = calcColors('#3C3836'),
dark3         = calcColors('#504945'),
gray          = calcColors('#8A8A8A'),
white_dark    = calcColors('#F7F7F7'),
red           = calcColors('#C75646'),
red_light     = calcColors('#E09690'),
red_dark      = calcColors('#D75F5F'),
red_error     = calcColors('#E04223'),
green         = calcColors('#8EB33B'),
green_light   = calcColors('#CDCE23'),
green_dark    = calcColors('#6B8E23'),
yellow        = calcColors('#D0B03C'),
yellow_light  = calcColors('#FFE377'),
blue          = calcColors('#4E90A7'),
blue_light    = calcColors('#9CD9F0'),
magenta       = calcColors('#8B008B'),
magenta_light = calcColors('#DA70D6'),
cyan          = calcColors('#218693'),
cyan_light    = calcColors('#77dfd8'),
border        = calcColors('#BDAE92'),
acc1          = calcColors('#D5C4A1'),
acc2          = calcColors('#EBEDD0'),
orange        = calcColors('#FE8019'),
orange_light  = calcColors('#FABD2F'),
purple        = calcColors('#C8A0D1'),
purple_light  = calcColors('#FBB1F9'),
comment       = calcColors('#656565'),
cursorline    = calcColors('#282828'),
cursor        = calcColors('#EBDBB2'),
virtual_text  = calcColors('#535510'),
virtual_info  = calcColors('#CC6600'),
virtual_error = calcColors('#CC4C4C'),
none          = { hex = 'NONE', term = 'NONE' },
}

c.bg = c.dark1
c.fg = c.white_dark

-- stylua: ignore
local theme = {
  base00 = c.bg.raw,
  base01 = c.dark2.raw,
  base02 = c.dark3.raw,
  base03 = c.gray.raw,
  base04 = c.border.raw,
  base05 = c.acc1.raw,
  base06 = c.acc2.raw,
  base07 = c.fg.raw,
  base08 = c.red.raw,
  base09 = c.yellow.raw,
  base0A = c.yellow_light.raw,
  base0B = c.green_light.raw,
  base0C = c.green.raw,
  base0D = c.orange.raw,
  base0E = c.red_light.raw,
  base0F = c.red_dark.raw
}

vim.g.mytheme = theme
vim.g.colors = c

-- themes['smyck'] = {
--      base00 = '#232323', base01 = '#3c3836', base02 = '#504945', base03 = '#8a8a8a',
--      base04 = '#bdae92', base05 = '#d5c4a1', base06 = '#ebedb0', base07 = '#f7f7f7',
--      base08 = '#e04223', base09 = '#d0b03c', base0A = '#ffe377', base0B = '#cdce23',
--      base0C = '#8eb33b', base0D = '#4e90a7', base0E = '#e06990', base0F = '#c75646',
-- }
-- themes['gruvbox-dark-hard'] = {
-- 	base00 = '#1d2021'; base01 = '#3c3836'; base02 = '#504945'; base03 = '#665c54';
-- 	base04 = '#bdae93'; base05 = '#d5c4a1'; base06 = '#ebdbb2'; base07 = '#fbf1c7';
-- 	base08 = '#fb4934'; base09 = '#fe8019'; base0A = '#fabd2f'; base0B = '#b8bb26';
-- 	base0C = '#8ec07c'; base0D = '#83a598'; base0E = '#d3869b'; base0F = '#d65d0e';
-- }
-- themes['gruvbox-dark-medium'] = {
-- 	base00 = '#282828'; base01 = '#3c3836'; base02 = '#504945'; base03 = '#665c54';
-- 	base04 = '#bdae93'; base05 = '#d5c4a1'; base06 = '#ebdbb2'; base07 = '#fbf1c7';
-- 	base08 = '#fb4934'; base09 = '#fe8019'; base0A = '#fabd2f'; base0B = '#b8bb26';
-- 	base0C = '#8ec07c'; base0D = '#83a598'; base0E = '#d3869b'; base0F = '#d65d0e';
-- }
-- themes['gruvbox-dark-pale'] = {
-- 	base00 = '#262626'; base01 = '#3a3a3a'; base02 = '#4e4e4e'; base03 = '#8a8a8a';
-- 	base04 = '#949494'; base05 = '#dab997'; base06 = '#d5c4a1'; base07 = '#ebdbb2';
-- 	base08 = '#d75f5f'; base09 = '#ff8700'; base0A = '#ffaf00'; base0B = '#afaf00';
-- 	base0C = '#85ad85'; base0D = '#83adad'; base0E = '#d485ad'; base0F = '#d65d0e';
-- }
-- themes['gruvbox-dark-soft'] = {
-- 	base00 = '#32302f'; base01 = '#3c3836'; base02 = '#504945'; base03 = '#665c54';
-- 	base04 = '#bdae93'; base05 = '#d5c4a1'; base06 = '#ebdbb2'; base07 = '#fbf1c7';
-- 	base08 = '#fb4934'; base09 = '#fe8019'; base0A = '#fabd2f'; base0B = '#b8bb26';
-- 	base0C = '#8ec07c'; base0D = '#83a598'; base0E = '#d3869b'; base0F = '#d65d0e';
-- }
