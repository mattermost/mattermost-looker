view: staff_list {
  sql_table_name: mattermost.staff_list ;;

  dimension: category {
    type: string
    sql: ${TABLE}.CATEGORY ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.DEPARTMENT ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.EMAIL ;;
  }

  dimension: feature_team {
    type: string
    sql: ${TABLE}.FEATURE_TEAM ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.FIRST_NAME ;;
  }

  dimension: focusexpertise {
    type: string
    sql: ${TABLE}.Focus/Expertise ;;
  }

  dimension: full_name {
    type: string
    sql: ${TABLE}.FULL_NAME ;;
  }

  dimension: github {
    type: string
    sql: ${TABLE}.GITHUB ;;
  }

  dimension: gitlab {
    type: string
    sql: ${TABLE}.GITLAB ;;
  }

  dimension: languages_spoken {
    type: string
    sql: ${TABLE}.Languages Spoken ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.LAST_NAME ;;
  }

  dimension: major_city {
    type: string
    sql: case when ${TABLE}.MAJOR_CITY in ('New York City','New Jersey') then 'New York' when ${TABLE}.MAJOR_CITY = 'Bangalore' then 'Bengalūru' else ${TABLE}.MAJOR_CITY end;;
  }

  dimension: location {
    type: location
    sql_latitude:${world_cities.lat} ;;
    sql_longitude:${world_cities.lng} ;;
  }
  dimension: region_country {
    type: string
    sql: case when ${TABLE}.REGION_COUNTRY = 'USA' then 'United States' when ${TABLE}.REGION_COUNTRY = 'UK' then 'United Kingdom' else ${TABLE}.REGION_COUNTRY end;;
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
    drill_fields: [full_name, last_name, first_name]
  }

  measure: count_distict {
    sql: ${first_name} || ${last_name} ;;
    type: count_distinct
  }
}
