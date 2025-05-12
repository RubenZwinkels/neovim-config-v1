local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("v3full", {
    t({ "<template>" }),
    i(1),
    t({ "</template>", "", '<script setup lang="ts"">' }),
    i(2),
    t({ "</script>", "", '<style scoped lang="scss">', '  @import "@/styles/variables.scss";' }),
    i(3),
    t({ "</style>" }),
  }),
}
