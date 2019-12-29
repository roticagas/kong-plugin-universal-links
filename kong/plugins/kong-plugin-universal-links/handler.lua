local BasePlugin = require "kong.plugins.base_plugin"

local plugin = BasePlugin:extend()

plugin.PRIORITY = 1000
plugin.VERSION = "0.1.0"

function plugin:new()
  plugin.super.new(self, "kong-plugin-universal-links");
end

-- Run this when the client request hits the service
function plugin:access(conf)
  local agent = kong.request.get_header(conf.header_name);

  if string.find(agent, conf.android_keyword) then
    kong.response.set_header("Location", conf.android_link)
    return kong.response.exit(302);
  end

  if string.find(agent, conf.iphone_keyword) then
    kong.response.set_header("Location", conf.iphone_link)
    return kong.response.exit(302);
  end

  if string.find(agent, conf.ipad_keyword) then
    kong.response.set_header("Location", conf.ipad_link)
    return kong.response.exit(302);
  end
end

-- function plugin:header_filter(conf)
--   plugin.super.header_filter(self);
-- end

return plugin