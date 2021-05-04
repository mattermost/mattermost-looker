view: products {
  sql_table_name: "STRIPE"."PRODUCTS"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension: active {
    type: yesno
    sql: ${TABLE}."ACTIVE" ;;
  }

  dimension: attributes {
    type: string
    sql: ${TABLE}."ATTRIBUTES" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: CAST(${TABLE}."CREATED" AS TIMESTAMP_NTZ) ;;
  }

  dimension: cws_allowable_addons {
    type: string
    sql: ${TABLE}."CWS_ALLOWABLE_ADDONS" ;;
  }

  dimension: cws_product_family {
    type: string
    sql: ${TABLE}."CWS_PRODUCT_FAMILY" ;;
  }

  dimension: cws_sku_name {
    type: string
    sql: ${TABLE}."CWS_SKU_NAME" ;;
  }

  dimension: images {
    type: string
    sql: ${TABLE}."IMAGES" ;;
  }

  dimension: livemode {
    type: yesno
    sql: ${TABLE}."LIVEMODE" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

  dimension: unit_label {
    type: string
    sql: ${TABLE}."UNIT_LABEL" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: CAST(${TABLE}."UPDATED" AS TIMESTAMP_NTZ) ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, cws_sku_name]
  }
}
