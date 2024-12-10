-- NOTE: Where it all begins.
-- 1) Load basic vim options prior to ANYTHING else
-- init.lua already knows about the lua directory below it
require("config.vimopts") -- import lua/config/vimopts.lua here
-- 2) Set non plugin specific keymaps
require("config.globalkeybinds") -- import lua/config/globalkeybinds.lua here
-- 3) Load Lazy Plugin Manager
require("config.lazy") -- guess what's happening here.
