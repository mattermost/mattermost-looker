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

  dimension: major_city {
    type: string
    sql: case
        when ${TABLE}.MAJOR_CITY in ('New York City','New Jersey') then 'New York'
        when ${TABLE}.MAJOR_CITY = 'Bangalore' then 'Bengalūru'
        when ${TABLE}.MAJOR_CITY = 'Lake Tahoe' then 'Reno'
        when ${TABLE}.MAJOR_CITY = 'Waterloo' OR ${TABLE}.MAJOR_CITY = 'Toronto/Waterloo' then 'Toronto'
        when ${TABLE}.MAJOR_CITY = 'Luzon' then 'Baguio City'
        when ${TABLE}.MAJOR_CITY = 'North District' then 'Nazareth'
        else ${TABLE}.MAJOR_CITY end;;
  }

  dimension: location {
    type: location
    sql_latitude:${world_cities.lat} ;;
    sql_longitude:${world_cities.lng} ;;
  }

  dimension: region_country {
    type: string
    sql: case
        when ${TABLE}.REGION_COUNTRY = 'USA' then 'United States'
        when ${TABLE}.REGION_COUNTRY = 'UK' then 'United Kingdom'
        when ${TABLE}.REGION_COUNTRY = 'South Korea' then 'Korea, South'
        else ${TABLE}.REGION_COUNTRY end;;
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
    sql: ${firstname} || ${lastname} ;;
    type: count_distinct
  }
}
