package = "universal-links"
version = "0.1.0-1"
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
      ["kong.plugins.kong-plugin-universal-links.handler"] = "kong/plugins/kong-plugin-universal-links/handler.lua",
      ["kong.plugins.kong-plugin-universal-links.schema"] = "kong/plugins/kong-plugin-universal-links/schema.lua"
   }
}