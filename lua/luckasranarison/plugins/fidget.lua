local icons = require("luckasranarison.utils.icons")

return {
  "j-hui/fidget.nvim",
  opts = {
    notification = {
      override_vim_notify = true,
    },
  },
  config = function(_, opts)
    local notification = require("fidget.notification")

    notification.default_config.name = "notifications"
    notification.default_config.icon = icons.notification

    require("fidget").setup(opts)
  end,
}
