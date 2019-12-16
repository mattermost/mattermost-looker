connection: "snowflake"

include: "/data_warehouse/data_warehouse_views/*.view.lkml"
fiscal_month_offset: 1

explore: oli_level_arr {
  label: "OLI Level ARR"
  group_label: "  Favorite Explores"
}

explore: product2 {}
