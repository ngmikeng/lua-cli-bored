package = "lua-cli-bored"
version = "scm-1"
source = {
   url = "git+https://github.com/ngmikeng/lua-cli-bored.git"
}
description = {
   homepage = "https://github.com/ngmikeng/lua-cli-bored",
   license = "MIT"
}
dependencies = {
   "lua >= 5.1",
   "http >= 0.4"
}
build = {
   type = "builtin",
   modules = {
      ["config.env"] = "config/env.lua",
      ["lib.json"] = "lib/json.lua",
      main = "main.lua",
      ["services.bored-data"] = "services/bored-data.lua",
      ["utils.misc"] = "utils/misc.lua",
      ["utils.menu"] = "utils/menu.lua"
   }
}
