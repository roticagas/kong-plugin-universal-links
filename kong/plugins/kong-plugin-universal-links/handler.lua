local BasePlugin = require "kong.plugins.base_plugin"

local plugin = BasePlugin:extend()

plugin.PRIORITY = 1000
plugin.VERSION = "0.1.0"

function plugin:new()
  plugin.super.new(self, "kong-plugin-universal-links");
end

-- Run this when the client request hits the service
function plugin:access(conf)
  plugin.super.access(self);
  print(conf.headerName);
  print(conf.androidKeyword);
  print(conf.androidLink);
  print(conf.iphoneKeyword);
  print(conf.iphoneLink);
  print(conf.ipadKeyword); 
  print(conf.ipadLink);
  -- kong.* functions are from the PDK (plugin development kit)
  -- and do not need to be explicitly required
  local agent = kong.request.get_header(conf.headerName);
  print(agent);
  if string.find(agent, conf.androidKeyword) then
    return kong.response.exit(302, conf.androidLink);
  end

  if string.find(agent, conf.iphoneKeyword) then
    return kong.response.exit(302, conf.iphoneLink);
  end

  if string.find(agent, conf.ipadKeyword) then
    return kong.response.exit(302, conf.ipadLink);
  end
end

function plugin:header_filter(conf)
  plugin.super.header_filter(self);
end

return plugin