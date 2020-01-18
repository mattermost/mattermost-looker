view: _hc_fields {
  extension: required

  dimension: _hc_err {
    group_label: "System"
    label: "HC Error"
    sql: ${TABLE}._hc_err ;;
    type: string
  }

  dimension: _hc_lastop {
    group_label: "System"
    label: "HC Last Op"
    sql: ${TABLE}._hc_lastop ;;
    type: string
  }

  dimension: id {
    group_label: "System"
    sql: ${TABLE}.ID ;;
    type: number
  }
}
