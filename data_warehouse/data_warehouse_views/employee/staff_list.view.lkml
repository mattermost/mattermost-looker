view: staff_list {
  sql_table_name: employee.staff_list ;;

  dimension: category {
    type: string
    sql: ${TABLE}.CATEGORY ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.DEPARTMENT ;;
  }

  dimension: region_country {
    type: string
    sql: ${TABLE}.REGION_COUNTRY ;;
  }

  dimension: major_city {
    type: string
    sql: ${TABLE}.MAJOR_CITY ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.EMAIL ;;
  }

  dimension: feature_team {
    type: string
    sql: ${TABLE}.FEATURE_TEAM ;;
  }

  dimension: firstname {
    type: string
    sql: ${TABLE}.FIRSTNAME ;;
  }

  dimension: focus_expertise {
    type: string
    sql: ${TABLE}.Focus_Expertise ;;
  }

  dimension: fullname {
    type: string
    sql: ${TABLE}.FULLNAME ;;
  }

  dimension: github {
    type: string
    sql: ${TABLE}.GITHUB ;;
  }

  dimension: gitlab {
    type: string
    sql: ${TABLE}.GITLAB ;;
  }

  dimension: languages {
    type: string
    sql: ${TABLE}.Languages ;;
  }

  dimension: lastname {
    type: string
    sql: ${TABLE}.LASTNAME ;;
  }

  dimension: location {
    type: location
    sql_latitude: ${latitude};;
    sql_longitude: ${longitude};;
  }

  dimension: latitude {
    type: number
    sql: ${contributor_employee_map_data.latitude} ;;
  }

  dimension: longitude {
    type: number
    sql: ${contributor_employee_map_data.longitude} ;;
  }

  dimension: role {
    type: string
    sql: ${TABLE}.ROLE ;;
  }

  dimension: timezone {
    type: string
    sql: ${TABLE}.TIMEZONE ;;
  }

  dimension: timezone_utc {
    type: string
    sql: ${TABLE}.TIMEZONE_UTC ;;
  }

  dimension: twitter {
    type: string
    sql: ${TABLE}.TWITTER ;;
  }

  measure: count {
    type: count
    drill_fields: [fullname, lastname, firstname]
  }

  measure: count_distict {
    sql: ${email} ;;
    type: count_distinct
  }
}
