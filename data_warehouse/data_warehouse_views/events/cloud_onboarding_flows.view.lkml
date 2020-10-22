# This is the view file for the analytics.events.cloud_onboarding_flows table.
view: cloud_onboarding_flows {
  sql_table_name: events.cloud_onboarding_flows ;;
  view_label: "Cloud Onboarding Flows"

  # FILTERS

  # DIMENSIONS
  dimension: chronological_seqence {
    description: "The order sequence the events would be excpected to occur chronologically i.e. the steps the user must take. Negative Discrepancies in user counts between sequential events indicates the drop-off. Positive discrepancies indicate data quality issues."
    type: number
    sql: ${TABLE}.chronological_seqence ;;
    hidden: no
  }

  dimension: type {
    label: "Event Name"
    description: "The name of the cloud onboarding event as it is captured in the event properties when triggered."
    type: string
    sql: ${TABLE}.type ;;
    hidden: no
  }

  dimension: category {
    label: "Event Category"
    description: "The category of the cloud onboarding event as it is captured in the event properties when triggered."
    type: string
    sql: ${TABLE}.category ;;
    hidden: no
  }

  dimension: path {
    description: "The page URL path for pageview events."
    type: string
    sql: ${TABLE}.path ;;
    hidden: no
  }

  dimension: description {
    description: "A description of what must occur in order for the event to be triggered."
    type: string
    sql: ${TABLE}.description ;;
    hidden: no
  }

  dimension: onboarding_flow {
    description: "The specific cloud onboarding flow the event pertains to (i.e. Cloud Workspace Creation, Cloud First User, Cloud End User, etc.)"
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
    hidden: yes
  }

  measure: chronological_seqence_min {
    description: "The min Chronological Seqences within each grouping."
    type: min
    group_label: "Chronological Seqence Measures"
    sql: ${chronological_seqence} ;;
    hidden: yes
  }

  measure: chronological_seqence_avg {
    description: "The average Chronological Seqences within each grouping."
    type: average
    group_label: "Chronological Seqence Measures"
    sql: ${chronological_seqence} ;;
    hidden: yes
  }

  measure: chronological_seqence_median {
    description: "The median  Chronological Seqences within each grouping."
    type: median
    group_label: "Chronological Seqence Measures"
    sql: ${chronological_seqence} ;;
    hidden: yes
  }


}
