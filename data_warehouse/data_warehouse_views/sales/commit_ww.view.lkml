view: commit_ww {
  sql_table_name: "SALES"."COMMIT_WW"
    ;;

  dimension: qtr {
    type: string
    sql: ${TABLE}."QTR" ;;
    label: "Commit Qtr"
  }

  dimension: commit_netnew {
    type: number
    sql: ${TABLE}."COMMIT_NETNEW" ;;
    hidden:  yes
  }

  dimension: commit_renewal {
    type: number
    sql: ${TABLE}."COMMIT_RENEWAL" ;;
    hidden:  yes
  }


  dimension: upside_netnew {
    type: number
    sql: ${TABLE}."UPSIDE_NETNEW" ;;
    hidden:  yes
  }

  dimension: upside_renewal {
    type: number
    sql: ${TABLE}."UPSIDE_RENEWAL" ;;
    hidden:  yes

    }
# Measures

  measure:  amt_commit_netnew{
    type: sum
    sql: ${commit_netnew} ;;
    label: "Commit (Net New)"
    value_format_name: usd_0
  }

  measure:  amt_upside_netnew{
    type: sum
    sql: ${upside_netnew} ;;
    label: "Upside (Net New)"
    value_format_name: usd_0
  }

  measure:  amt_commit_renewal{
    type: sum
    sql: ${commit_renewal} ;;
    label: "Commit (Renewal)"
    value_format_name: usd_0
  }

  measure:  amt_upside_renewal{
    type: sum
    sql: ${upside_renewal} ;;
    label: "Upside (Renewal)"
    value_format_name: usd_0
  }
}
