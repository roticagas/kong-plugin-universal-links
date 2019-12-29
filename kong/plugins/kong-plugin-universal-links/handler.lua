local BasePlugin = require "kong.plugins.base_plugin"

local plugin = BasePlugin:extend()

plugin.PRIORITY = 1000
plugin.VERSION = "0.1.3"

function plugin:new()
  plugin.super.new(self, "kong-plugin-universal-links");
end

-- Run this when the client request hits the service
function plugin:access(conf)
  local agent = kong.request.get_header(conf.header_user_agent);

  if string.find(agent, conf.android_keyword) then
    if conf.android_link ~= "" then
      kong.response.set_header(conf.header_location, conf.android_link);
      return kong.response.exit(302, conf.android_link);
    end
  end

  if string.find(agent, conf.iphone_keyword) then
    if conf.iphone_link ~= "" then
      kong.response.set_header(conf.header_location, conf.iphone_link);
      return kong.response.exit(302, conf.iphone_link);
    end
  end

  if string.find(agent, conf.ipad_keyword) then
    if conf.ipad_link ~= "" then
      kong.response.set_header(conf.header_location, conf.ipad_link);
      return kong.response.exit(302, conf.ipad_link);
    end
  end
end

-- function plugin:header_filter(conf)
--   plugin.super.header_filter(self);
-- end

return plugin