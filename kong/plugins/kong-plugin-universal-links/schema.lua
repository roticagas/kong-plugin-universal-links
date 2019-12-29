return {
  no_consumer = true, -- This means our plugin will not apply to specific service consumers
  fields      = {
    headerName = {
      type     = "string",
      required = true,
      default  = "User-Agent"
    },
    androidKeyword = {
      type     = "string",
      required = false,
      default  = "Android"
    },
    androidLink = {
      type     = "string",
      required = false,
      default  = ""
    },
    iphoneKeyword = {
      type     = "string",
      required = false,
      default  = "iPhone"
    },
    iphoneLink = {
      type     = "string",
      required = false,
      default  = ""
    }, 
    ipadKeyword = {
      type     = "string",
      required = false,
      default  = "iPad"
    },
    ipadLink = {
      type     = "string",
      required = false,
      default  = ""
    }
  }
}