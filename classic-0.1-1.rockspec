package = "classic"
version = "0.1-1"
source = {
  url = "git://github.com/rxi/classic",
  branch = "master"
}
description = {
  summary = "Tiny class module for Lua",
  detailed = [[
    A tiny class module for Lua. Attempts to stay simple and provide decent performance by avoiding unnecessary over-abstraction.
  ]],
  homepage = "https://github.com/rxi/classic",
  license = "MIT"
}
dependencies = {
  "lua >= 5.1"
}
build = {
  type = "builtin",
  modules = {
    classic = "src/classic.lua"
  }
}
