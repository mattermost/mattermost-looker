# This is the view file for the analytics.events.cloud_onboarding_flows table.
view: cloud_onboarding_flows {
  sql_table_name: events.cloud_onboarding_flows ;;
  view_label: "Cloud Onboarding Flows"

  # FILTERS

  # DIMENSIONS
  dimension: chronological_seqence {
    description: "" 
    type: number
    sql: ${TABLE}.chronological_seqence ;;
    hidden: no
  }

  dimension: type {
    description: "" 
    type: string
    sql: ${TABLE}.type ;;
    hidden: no
  }

  dimension: category {
    description: "" 
    type: string
    sql: ${TABLE}.category ;;
    hidden: no
  }

  dimension: path {
    description: "" 
    type: string
    sql: ${TABLE}.path ;;
    hidden: no
  }

  dimension: description {
    description: "" 
    type: string
    sql: ${TABLE}.description ;;
    hidden: no
  }

  dimension: onboarding_flow {
    description: "" 
    type: string
    sql: ${TABLE}.onboarding_flow ;;
    hidden: no
  }

  
  # DIMENSION GROUPS/DATES
  
  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: chronological_seqence_max {
    description: "The max Chronological Seqences within each grouping."
    type: max
    group_label: "Chronological Seqence Measures"
    sql: ${chronological_seqence} ;;
  }

  measure: chronological_seqence_min {
    description: "The min Chronological Seqences within each grouping."
    type: min
    group_label: "Chronological Seqence Measures"
    sql: ${chronological_seqence} ;;
  }

  measure: chronological_seqence_avg {
    description: "The average Chronological Seqences within each grouping."
    type: average
    group_label: "Chronological Seqence Measures"
    sql: ${chronological_seqence} ;;
  }

  measure: chronological_seqence_median {
    description: "The median  Chronological Seqences within each grouping."
    type: median
    group_label: "Chronological Seqence Measures"
    sql: ${chronological_seqence} ;;
  }


}