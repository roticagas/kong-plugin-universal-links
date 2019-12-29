local BasePlugin = require "kong.plugins.base_plugin"

local LinkHandler = BasePlugin:extend()

LinkHandler.PRIORITY = 2000
LinkHandler.VERSION = "0.1.0"

function LinkHandler:new()
  LinkHandler.super.new(self, "kong-plugin-universal-links")
  self.agent = ""
end

-- Run this when the client request hits the service
function LinkHandler:access(conf)
  LinkHandler.super.access(self)

  -- kong.* functions are from the PDK (plugin development kit)
  -- and do not need to be explicitly required
  self.agent = kong.request.get_header(conf.headerName)
end

function LinkHandler:header_filter(conf)
  LinkHandler.super.header_filter(self)
  if 
  if string.find(self.agent, conf.androidKeyword) then
    if conf.androidLink ~= "" then
      kong.response.exit(302, conf.androidLink)
    end
  end
  if string.find(self.agent, conf.iphoneKeyword) then
    if conf.iphoneLink ~= "" then
      kong.response.exit(302, conf.iphoneLink)
    end
  end
  if string.find(self.agent, conf.ipadKeyword) then
    if conf.ipadLink ~= "" then
      kong.response.exit(302, conf.ipadLink)
    end
  end
end

return LinkHandler