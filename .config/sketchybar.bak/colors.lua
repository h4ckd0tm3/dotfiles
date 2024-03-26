return {
  black = 0xff1F2229,
  white = 0xffE6E6E6,
  red = 0xffBF2E5D,
  green = 0xff5EBDAB,
  blue = 0xff367BF0,
  yellow = 0xffFEA44C,
  orange = 0xfff5a97f,
  magenta = 0xffBF2E5D,
  grey = 0xff939ab7,
  transparent = 0x00000000,

  bar = {
    bg = 0xf02c2e34,
    border = 0x778C42AB,
  },
  popup = {
    bg = 0xdd1f2229,
    border = 0xff7f8490
  },
  bg1 = 0x603c3e4f,
  bg2 = 0x60494d64,

  with_alpha = function(color, alpha)
    if alpha > 1.0 or alpha < 0.0 then return color end
    return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
  end,
}
