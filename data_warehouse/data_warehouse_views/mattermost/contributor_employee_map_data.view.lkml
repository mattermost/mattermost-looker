view: contributor_employee_map_data {
  sql_table_name: MATTERMOST.CONTRIBUTOR_EMPLOYEE_MAP_DATA ;;

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

  dimension: reason {
    type: string
    sql: ${TABLE}.REASON ;;
  }

  dimension: unique_identifier {
    type: string
    sql: ${TABLE}.UNIQUE_IDENTIFIER ;;
  }

  dimension: compound_primary {
    type: string
    sql: ${unique_identifier}||${reason} ;;
  }

  measure: count_distinct {
    type: count_distinct
    sql: ${unique_identifier} ;;
  }
}
