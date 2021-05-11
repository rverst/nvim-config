local fn = require('utils.fn')

local function calcColors(hex)
  if #hex ~= 7 then return nil end

  local r = tonumber(hex:sub(2, 3), 16)
  local g = tonumber(hex:sub(4, 5), 16)
  local b = tonumber(hex:sub(6, 7), 16)

  return {hex = hex, raw = hex:sub(2, 7), r = r, g = g, b = b, term = fn.rgbToX256(r, g, b)}
end

-- LuaFormatter off
local c = {}
c.black         = calcColors('#000000')
c.white         = calcColors('#FFFFFF')
c.dark1         = calcColors('#232323')
c.dark2         = calcColors('#3C3836')
c.dark3         = calcColors('#504945')
c.gray          = calcColors('#8A8A8A')
c.white_dark    = calcColors('#F7F7F7')
c.red           = calcColors('#C75646')
c.red_light     = calcColors('#E09690')
c.red_dark      = calcColors('#D75F5F')
c.red_error     = calcColors('#E04223')
c.green         = calcColors('#8EB33B')
c.green_light   = calcColors('#CDCE23')
c.green_dark    = calcColors('#6B8E23')
c.yellow        = calcColors('#D0B03C')
c.yellow_light  = calcColors('#FFE377')
c.blue          = calcColors('#72B3CC')
c.blue_light    = calcColors('#9CD9F0')
c.magenta       = calcColors('#8B008B')
c.magenta_light = calcColors('#DA70D6')
c.cyan          = calcColors('#218693')
c.cyan_light    = calcColors('#77dfd8')
c.border        = calcColors('#BDAE92')
c.acc1          = calcColors('#D5C4A1')
c.acc2          = calcColors('#EBEDD0')
c.orange        = calcColors('#FE8019')
c.orange_light  = calcColors('#FABD2F')
c.purple        = calcColors('#C8A0D1')
c.purple_light  = calcColors('#FBB1F9')
c.comment       = calcColors('#656565')
c.cursorline    = calcColors('#282828')
c.cursor        = calcColors('#EBDBB2')
c.bg            = c.dark1
c.fg            = c.white_dark

c.none          = { hex = 'NONE', term = 'NONE' }
-- LuaFormatter on

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

