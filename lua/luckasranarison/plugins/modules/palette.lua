local palette = require("github-theme.palette")
local light = palette.load("github_light")

return {
  red = light.red.base,
  blue = light.blue.base,
  cyan = light.cyan.base,
  gray = light.scale.gray[6],
  green = light.green.base,
  white = light.scale.white,
  black = light.black.base,
  yellow = light.yellow.base,
  magenta = light.magenta.base,
}
