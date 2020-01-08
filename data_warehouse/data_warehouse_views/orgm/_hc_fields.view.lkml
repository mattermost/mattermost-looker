view: _hc_fields {
  extension: required

  dimension: _hc_err {
    group_label: "System"
    label: "HC Error"
    sql: ${TABLE}._hc_err ;;
    type: string
  }

  dimension: _hc_lastop {
    sql: ${TABLE}._hc_lastop ;;
    group_label: "System"
    label: "HC Last Op"
    type: string
  }
}
