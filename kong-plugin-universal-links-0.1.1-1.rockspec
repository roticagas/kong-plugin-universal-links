package = "kong-plugin-universal-links"
version = "0.1.1-1"
local pluginName = package:match("^kong%-plugin%-(.+)$")  -- "universal-links"

source = {
   url = "git//github.com/roticagas/kong-plugin-universal-links.git"
}
description = {
   homepage = "https://github.com/roticagas/kong-plugin-universal-links",
   license = "MIT"
}
dependencies = {
  "lua >= 5.3",
  "kong >= 0.14"
}
build = {
   type = "builtin",
   modules = {
      ["kong.plugins."..pluginName..".handler"] = "kong/plugins/"..pluginName.."/handler.lua",
      ["kong.plugins."..pluginName..".schema"] = "kong/plugins/"..pluginName.."/schema.lua"
   }
}