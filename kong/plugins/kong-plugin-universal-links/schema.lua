return {
  no_consumer = true, -- This means our plugin will not apply to specific service consumers
  fields      = {
    header_user_agent = {
      type     = "string",
      required = true,
      default  = "User-Agent"
    },
    header_location = {
      type     = "string",
      required = true,
      default  = "Location"
    },
    android_keyword = {
      type     = "string",
      required = false,
      default  = "Android"
    },
    android_link = {
      type     = "string",
      required = false,
      default  = ""
    },
    iphone_keyword = {
      type     = "string",
      required = false,
      default  = "iPhone"
    },
    iphone_link = {
      type     = "string",
      required = false,
      default  = ""
    }, 
    ipad_keyword = {
      type     = "string",
      required = false,
      default  = "iPad"
    },
    ipad_link = {
      type     = "string",
      required = false,
      default  = ""
    }
  }
}