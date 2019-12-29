local BasePlugin = require "kong.plugins.base_plugin"

local plugin = BasePlugin:extend()

plugin.PRIORITY = 1000
plugin.VERSION = "0.1.0"

function plugin:new()
  plugin.super.new(self, "kong-plugin-universal-links");
end

-- Run this when the client request hits the service
function plugin:access(conf)
  -- plugin.super.access(self);
  print(conf.header_name);
  print(conf.android_keyword);
  print(conf.android_link);
  print(conf.iphone_keyword);
  print(conf.iphone_link);
  print(conf.ipad_keyword); 
  print(conf.ipad_link);

  local agent = kong.request.get_header(conf.header_name);
  print(agent);
  if string.find(agent, conf.android_keyword) then
    return kong.response.exit(302, conf.android_link);
  end

  if string.find(agent, conf.iphone_keyword) then
    return kong.response.exit(302, conf.iphone_link);
  end

  if string.find(agent, conf.ipad_keyword) then
    return kong.response.exit(302, conf.ipad_link);
  end
end

-- function plugin:header_filter(conf)
--   plugin.super.header_filter(self);
-- end

return plugin