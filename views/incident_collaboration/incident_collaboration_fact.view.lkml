# This is the view file for the analytics.incident_collaboration.incident_collaboration_fact table.
view: incident_collaboration_fact {
  sql_table_name: incident_collaboration.incident_collaboration_fact ;;
  view_label: "Playbooks Fact"

  # FILTERS
  set: incident_facts{
    fields: [current_plugin_version, users_max, daily_active_users_max, playbooks_created, incidents_reported, incidents_acknowledged, incidents_resolved, incidents_archived, first_active_date, first_active_week, first_active_month, first_active_year, last_active_date, last_active_week, last_active_month, last_active_year, days_active, first_product_edition, users_max_max, daily_active_users_max_max, first_active_min, last_active_max, days_active_max]
  }

  # DIMENSIONS
  dimension: server_id {
    description: ""
    type: string
    sql: ${TABLE}.server_id ;;
    hidden: no
  }

  dimension: first_product_edition{
    description: ""
    type: string
    sql: CASE WHEN ${TABLE}.first_product_edition = 5 then 'E20'
            WHEN ${TABLE}.first_product_edition = 4 then 'E10'
            WHEN ${TABLE}.first_product_edition = 3 then 'E20 Trial'
            WHEN ${TABLE}.first_product_edition = 2 then 'Mattermost Cloud'
            WHEN ${TABLE}.first_product_edition = 1 then 'E0'
            WHEN ${TABLE}.first_product_edition = 0 then 'TE'
            ELSE NULL END;;
    hidden: no
    order_by_field: first_product_edition_sort
  }

  dimension: first_product_edition_sort {
    description: ""
    type: string
    sql: ${TABLE}.first_product_edition ;;
    hidden: no
  }

  dimension: days_active {
    type: number
    description: "The count of days from the instances first to last active date where >= 1 active incident collaboration user was associated with the instance."
    sql: ${TABLE}.days_active ;;
  }

  dimension: current_plugin_version {
    description: ""
    type: string
    sql: ${TABLE}.current_plugin_version ;;
    hidden: no
  }

  dimension: users_max {
    description: ""
    type: number
    sql: ${TABLE}.users_max ;;
    hidden: no
  }

  dimension: daily_active_users_max {
    description: ""
    type: number
    sql: ${TABLE}.daily_active_users_max ;;
    hidden: no
  }

  dimension: monthly_active_users_max {
    description: ""
    type: number
    sql: ${TABLE}.monthly_active_users_max ;;
    hidden: no
  }

  dimension: weekly_active_users_max {
    description: ""
    type: number
    sql: ${TABLE}.weekly_active_users_max ;;
    hidden: no
  }

  dimension: playbooks_created {
    description: ""
    type: number
    sql: ${TABLE}.playbooks_created ;;
    hidden: no
  }

  dimension: playbooks_edited {
    description: ""
    type: number
    sql: ${TABLE}.playbooks_edited ;;
    hidden: no
  }

  dimension: incidents_reported {
    description: ""
    type: number
    sql: ${TABLE}.incidents_reported ;;
    hidden: no
  }

  dimension: incidents_acknowledged {
    description: ""
    type: number
    sql: ${TABLE}.incidents_acknowledged ;;
    hidden: no
  }

  dimension: incidents_resolved {
    description: ""
    type: number
    sql: ${TABLE}.incidents_resolved ;;
    hidden: no
  }

  dimension: incidents_archived {
    description: ""
    type: number
    sql: ${TABLE}.incidents_archived ;;
    hidden: no
  }


  # DIMENSION GROUPS/DATES
  dimension_group: first_active {
    description: ""
    type: time
    timeframes: [week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.first_active_date ;;
    hidden: no
  }

  measure: first_active_min {
    label: "First Active Date (Min)"
    group_label: "First & Last Active (Min/Max)"
    type: date
    sql: MIN(${first_active_date}::date) ;;
  }

  measure: last_active_max {
    group_label: "First & Last Active (Min/Max)"
    label: "Last Active Date (Max)"
    type: date
    sql: MAX(${last_active_date}::date) ;;
  }

  measure: days_active_max {
    label: "Days Active (Total)"
    type: number
    value_format_name: decimal_0
    sql: DATEDIFF(DAY, ${first_active_min}, ${last_active_max}) ;;
  }

  dimension_group: last_active {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.last_active_date ;;
    hidden: no
  }


  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: server_count {
    label: " Server Count"
    description: "The distinct count of Incident Collaboration Fact Servers within each grouping."
    type: count_distinct
    sql: ${server_id} ;;
  }

  measure: users_max_sum {
    description: "The Sum of Users Max."
    type: sum
    group_label: "Users Max Measures"
    sql: ${users_max} ;;
  }

  measure: users_max_max {
    description: "The Max. Users Max."
    label: "Users (Max)"
    type: max
    group_label: "Users Max Measures"
    sql: ${users_max} ;;
  }

  measure: users_max_min {
    description: "The Min. Users Max."
    type: min
    group_label: "Users Max Measures"
    sql: ${users_max} ;;
  }

  measure: users_max_avg {
    description: "The Average Users Max."
    type: average
    group_label: "Users Max Measures"
    sql: ${users_max} ;;
  }

  measure: users_max_median {
    description: "The Median Users Max."
    type: median
    group_label: "Users Max Measures"
    sql: ${users_max} ;;
  }

  measure: daily_active_users_max_sum {
    description: "The Sum of Daily Active Users Max."
    type: sum
    group_label: "Daily Active Users Max Measures"
    sql: ${daily_active_users_max} ;;
  }

  measure: daily_active_users_max_max {
    description: "The Max. Daily Active Users Max."
    label: "Daily Active Users (Max)"
    type: max
    group_label: "Daily Active Users Max Measures"
    sql: ${daily_active_users_max} ;;
  }

  measure: daily_active_users_max_min {
    description: "The Min. Daily Active Users Max."
    type: min
    group_label: "Daily Active Users Max Measures"
    sql: ${daily_active_users_max} ;;
  }

  measure: daily_active_users_max_avg {
    description: "The Average Daily Active Users Max."
    type: average
    group_label: "Daily Active Users Max Measures"
    sql: ${daily_active_users_max} ;;
  }

  measure: daily_active_users_max_median {
    description: "The Median Daily Active Users Max."
    type: median
    group_label: "Daily Active Users Max Measures"
    sql: ${daily_active_users_max} ;;
  }

  measure: weekly_active_users_max_sum {
    description: "The Sum of Weekly Active Users Max."
    type: sum
    group_label: "Weekly Active Users Max Measures"
    sql: ${weekly_active_users_max} ;;
  }

  measure: weekly_active_users_max_max {
    description: "The Max. Weekly Active Users Max."
    type: max
    group_label: "Weekly Active Users Max Measures"
    sql: ${weekly_active_users_max} ;;
  }

  measure: weekly_active_users_max_min {
    description: "The Min. Weekly Active Users Max."
    type: min
    group_label: "Weekly Active Users Max Measures"
    sql: ${weekly_active_users_max} ;;
  }

  measure: weekly_active_users_max_avg {
    description: "The Average Weekly Active Users Max."
    type: average
    group_label: "Weekly Active Users Max Measures"
    sql: ${weekly_active_users_max} ;;
  }

  measure: weekly_active_users_max_median {
    description: "The Median Weekly Active Users Max."
    type: median
    group_label: "Weekly Active Users Max Measures"
    sql: ${weekly_active_users_max} ;;
  }

  measure: monthly_active_users_max_sum {
    description: "The Sum of Monthly Active Users Max."
    type: sum
    group_label: "Monthly Active Users Max Measures"
    sql: ${monthly_active_users_max} ;;
  }

  measure: monthly_active_users_max_max {
    description: "The Max. Monthly Active Users Max."
    type: max
    group_label: "Monthly Active Users Max Measures"
    sql: ${monthly_active_users_max} ;;
  }

  measure: monthly_active_users_max_min {
    description: "The Min. Monthly Active Users Max."
    type: min
    group_label: "Monthly Active Users Max Measures"
    sql: ${monthly_active_users_max} ;;
  }

  measure: monthly_active_users_max_avg {
    description: "The Average Monthly Active Users Max."
    type: average
    group_label: "Monthly Active Users Max Measures"
    sql: ${monthly_active_users_max} ;;
  }

  measure: monthly_active_users_max_median {
    description: "The Median Monthly Active Users Max."
    type: median
    group_label: "Monthly Active Users Max Measures"
    sql: ${monthly_active_users_max} ;;
  }

  measure: instances_with_playbooks_created {
    description: "The distinct count of instances that have Playbooks Created."
    type: count_distinct
    group_label: "Instance Counts"
    sql: CASE WHEN ${playbooks_created} > 0 THEN ${server_id} ELSE NULL END ;;
  }

  measure: playbooks_created_sum {
    description: "The Sum of Playbooks Created."
    type: sum
    group_label: "Playbooks Created Measures"
    sql: ${playbooks_created} ;;
  }

  measure: playbooks_created_max {
    description: "The Max. Playbooks Created."
    type: max
    group_label: "Playbooks Created Measures"
    sql: ${playbooks_created} ;;
  }

  measure: playbooks_created_min {
    description: "The Min. Playbooks Created."
    type: min
    group_label: "Playbooks Created Measures"
    sql: ${playbooks_created} ;;
  }

  measure: playbooks_created_avg {
    description: "The Average Playbooks Created."
    type: average
    group_label: "Playbooks Created Measures"
    sql: ${playbooks_created} ;;
  }

  measure: playbooks_created_median {
    description: "The Median Playbooks Created."
    type: median
    group_label: "Playbooks Created Measures"
    sql: ${playbooks_created} ;;
  }

  measure: instances_with_playbooks_edited {
    description: "The distinct count of instances that have Playbooks Edited."
    type: count_distinct
    group_label: "Instance Counts"
    sql: CASE WHEN ${playbooks_edited} > 0 THEN ${server_id} ELSE NULL END ;;
  }

  measure: playbooks_edited_sum {
    description: "The Sum of Playbooks Edited."
    type: sum
    group_label: "Playbooks Edited Measures"
    sql: ${playbooks_edited} ;;
  }

  measure: playbooks_edited_max {
    description: "The Max. Playbooks Edited."
    type: max
    group_label: "Playbooks Edited Measures"
    sql: ${playbooks_edited} ;;
  }

  measure: playbooks_edited_min {
    description: "The Min. Playbooks Edited."
    type: min
    group_label: "Playbooks Edited Measures"
    sql: ${playbooks_edited} ;;
  }

  measure: playbooks_edited_avg {
    description: "The Average Playbooks Edited."
    type: average
    group_label: "Playbooks Edited Measures"
    sql: ${playbooks_edited} ;;
  }

  measure: playbooks_edited_median {
    description: "The Median Playbooks Edited."
    type: median
    group_label: "Playbooks Edited Measures"
    sql: ${playbooks_edited} ;;
  }


  measure: incidents_reported_sum {
    description: "The Sum of Incidents Reported."
    type: sum
    group_label: "Incidents Reported Measures"
    sql: ${incidents_reported} ;;
  }

  measure: incidents_reported_max {
    description: "The Max. Incidents Reported."
    type: max
    group_label: "Incidents Reported Measures"
    sql: ${incidents_reported} ;;
  }

  measure: incidents_reported_min {
    description: "The Min. Incidents Reported."
    type: min
    group_label: "Incidents Reported Measures"
    sql: ${incidents_reported} ;;
  }

  measure: incidents_reported_avg {
    description: "The Average Incidents Reported."
    type: average
    group_label: "Incidents Reported Measures"
    sql: ${incidents_reported} ;;
  }

  measure: incidents_reported_median {
    description: "The Median Incidents Reported."
    type: median
    group_label: "Incidents Reported Measures"
    sql: ${incidents_reported} ;;
  }

  measure: incidents_acknowledged_sum {
    description: "The Sum of Incidents Acknowledged."
    type: sum
    group_label: "Incidents Acknowledged Measures"
    sql: ${incidents_acknowledged} ;;
  }

  measure: incidents_acknowledged_max {
    description: "The Max. Incidents Acknowledged."
    type: max
    group_label: "Incidents Acknowledged Measures"
    sql: ${incidents_acknowledged} ;;
  }

  measure: incidents_acknowledged_min {
    description: "The Min. Incidents Acknowledged."
    type: min
    group_label: "Incidents Acknowledged Measures"
    sql: ${incidents_acknowledged} ;;
  }

  measure: incidents_acknowledged_avg {
    description: "The Average Incidents Acknowledged."
    type: average
    group_label: "Incidents Acknowledged Measures"
    sql: ${incidents_acknowledged} ;;
  }

  measure: incidents_acknowledged_median {
    description: "The Median Incidents Acknowledged."
    type: median
    group_label: "Incidents Acknowledged Measures"
    sql: ${incidents_acknowledged} ;;
  }

  measure: incidents_resolved_sum {
    description: "The Sum of Incidents Resolved."
    type: sum
    group_label: "Incidents Resolved Measures"
    sql: ${incidents_resolved} ;;
  }

  measure: incidents_resolved_max {
    description: "The Max. Incidents Resolved."
    type: max
    group_label: "Incidents Resolved Measures"
    sql: ${incidents_resolved} ;;
  }

  measure: incidents_resolved_min {
    description: "The Min. Incidents Resolved."
    type: min
    group_label: "Incidents Resolved Measures"
    sql: ${incidents_resolved} ;;
  }

  measure: incidents_resolved_avg {
    description: "The Average Incidents Resolved."
    type: average
    group_label: "Incidents Resolved Measures"
    sql: ${incidents_resolved} ;;
  }

  measure: incidents_resolved_median {
    description: "The Median Incidents Resolved."
    type: median
    group_label: "Incidents Resolved Measures"
    sql: ${incidents_resolved} ;;
  }

  measure: incidents_archived_sum {
    description: "The Sum of Incidents Archived."
    type: sum
    group_label: "Incidents Archived Measures"
    sql: ${incidents_archived} ;;
  }

  measure: incidents_archived_max {
    description: "The Max. Incidents Archived."
    type: max
    group_label: "Incidents Archived Measures"
    sql: ${incidents_archived} ;;
  }

  measure: incidents_archived_min {
    description: "The Min. Incidents Archived."
    type: min
    group_label: "Incidents Archived Measures"
    sql: ${incidents_archived} ;;
  }

  measure: incidents_archived_avg {
    description: "The Average Incidents Archived."
    type: average
    group_label: "Incidents Archived Measures"
    sql: ${incidents_archived} ;;
  }

  measure: incidents_archived_median {
    description: "The Median Incidents Archived."
    type: median
    group_label: "Incidents Archived Measures"
    sql: ${incidents_archived} ;;
  }


}
