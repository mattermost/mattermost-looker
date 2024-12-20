view: fct_feature_daily_snapshot {
  sql_table_name: "MART_PRODUCT".fct_feature_daily_snapshot ;;
  label: "Feature usage"

  ## Keys

  dimension: daily_server_id {
    type: string
    sql: ${TABLE}.daily_server_id ;;
    primary_key: yes
    hidden: yes
  }

  dimension: server_id {
    type: string
    sql: ${TABLE}.server_id ;;
    label: "Server ID"
    description: "The server's unique id."
    view_label: "* Telemetry: Information"
  }

  dimension_group: activity {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.activity_date ;;
    description: "The date that the events for each feature were counted."
    view_label: "* Telemetry: Information"
  }

  ## Facts

  ### Custom user groups

  dimension: count_custom_ug_events_daily {
    type: number
    sql: ${TABLE}.count_custom_groups_events_daily;;
    label: "# of Custom User Group Events (Daily)"
    description: "The number of events related to Custom user groups feature for the current day."
    view_label: "* Features: Custom User Groups"
  }

  dimension: count_custom_ug_events_monthly {
    type: number
    sql: ${TABLE}.count_custom_groups_events_monthly;;
    label: "# of Custom User Group Events (Monthly)"
    description: "The number of events related to  Custom user groups feature for the current day and past 29 days."
    view_label: "* Features: Custom User Groups"
  }

  dimension: count_custom_ug_users_daily {
    type: number
    sql: ${TABLE}.count_custom_groups_users_daily ;;
    label: "# of Custom User Group Unique Users (Daily)"
    description: "The number of unique users related to  Custom user groups feature for the current day."
    view_label: "* Features: Custom User Groups"
  }

  dimension: count_custom_ug_users_monthly {
    type: number
    sql: ${TABLE}.count_custom_groups_users_monthly ;;
    label: "# of Custom User Group Unique Users (Monthly)"
    description: "The number of unique users related to  Custom user groups feature for the current day and past 29 days."
    view_label: "* Features: Custom User Groups"
  }

  ### Custom user groups - metrics

  measure: total_count_custom_ug_events_daily {
    type: sum
    sql: ${count_custom_ug_events_daily} ;;
    label: "Total # of Custom User Group Events (Daily)"
    view_label: "* Features: Custom User Groups"
  }

  measure: total_count_custom_ug_events_monthly {
    type: sum
    sql: ${count_custom_ug_events_monthly} ;;
    label: "Total # of Custom User Group Events (Monthly)"
    view_label: "* Features: Custom User Groups"
  }

  measure: total_count_custom_ug_users_daily {
    type: sum
    sql: ${count_custom_ug_users_daily} ;;
    label: "Total # of Custom User Group Users (Daily)"
    view_label: "* Features: Custom User Groups"
  }

  measure: total_count_custom_ug_users_monthly {
    type: sum
    sql: ${count_custom_ug_users_monthly} ;;
    label: "Total # of Custom User Group Users (Monthly)"
    view_label: "* Features: Custom User Groups"
  }

  ### Guest accounts

  dimension: count_guest_accounts_events_daily {
    type: number
    sql: ${TABLE}.count_guest_accounts_events_daily ;;
    label: "# of Guest Account Events (Daily)"
    description: "The number of events related to Guest Accounts feature for the current day."
    view_label: "* Features: Guest Accounts"
  }

  dimension: count_guest_accounts_events_monthly {
    type: number
    sql: ${TABLE}.count_guest_accounts_events_monthly ;;
    label: "# of Guest Account Events (Monthly)"
    description: "The number of events related to Guest Accounts feature  for the current day and past 29 days."
    view_label: "* Features: Guest Accounts"
  }

  dimension: count_guest_accounts_users_daily {
    type: number
    sql: ${TABLE}.count_guest_accounts_users_daily ;;
    label: "# of Guest Accounts Unique Users (Daily)"
    description: "The number of unique users related to Guest Account feature for the current day."
    view_label: "* Features: Guest Accounts"
  }

  dimension: count_guest_accounts_users_monthly {
    type: number
    sql: ${TABLE}.count_guest_accounts_users_monthly ;;
    label: "# of Guest Accounts Unique Users (Monthly)"
    description: "The number of unique users related to Guest Account feature  for the current day and past 29 days."
    view_label: "* Features: Guest Accounts"
  }

  ### Guest Accounts - metrics

  measure: total_count_guest_accounts_events_daily {
    type: sum
    sql: ${count_guest_accounts_events_daily} ;;
    label: "Total # of Guest Accounts Events (Daily)"
    view_label: "* Features: Guest Accounts"
  }

  measure: total_count_guest_accounts_events_monthly {
    type: sum
    sql: ${count_guest_accounts_events_monthly} ;;
    label: "Total # of Guest Accounts Events (Monthly)"
    view_label: "* Features: Guest Accounts"
  }

  measure: total_count_guest_accounts_users_daily {
    type: sum
    sql: ${count_guest_accounts_users_daily} ;;
    label: "Total # of Guest Accounts Users (Daily)"
    view_label: "* Features: Guest Accounts"
  }

  measure: total_count_guest_accounts_users_monthly {
    type: sum
    sql: ${count_guest_accounts_users_monthly} ;;
    label: "Total # of Guest Accounts Users (Monthly)"
    view_label: "* Features: Guest Accounts"
  }

  ### Message Ack

  dimension: count_message_ack_events_daily {
    type: number
    sql: ${TABLE}.count_message_ack_events_daily ;;
    label: "# of Message Ack Events (Daily)"
    description: "The number of events related to Message Ack feature for the current day."
    view_label: "* Features: Message Acknowledgment"
  }

  dimension: count_message_ack_events_monthly {
    type: number
    sql: ${TABLE}.count_message_ack_events_monthly ;;
    label: "# of Message Ack Events (Monthly)"
    description: "The number of events related to Message Ack feature  for the current day and past 29 days."
    view_label: "* Features: Message Acknowledgment"

  }

  dimension: count_message_ack_users_daily {
    type: number
    sql: ${TABLE}.count_message_ack_users_daily ;;
    label: "# of Message Ack Unique Users (Daily)"
    description: "The number of unique users related to Message Ack feature for the current day."
    view_label: "* Features: Message Acknowledgment"
  }

  dimension: count_message_ack_users_monthly {
    type: number
    sql: ${TABLE}.count_message_ack_users_monthly ;;
    label: "# of Message Ack Unique Users (Monthly)"
    description: "The number of unique users related to Message Ack feature  for the current day and past 29 days."
    view_label: "* Features: Message Acknowledgment"
  }


  ### Message Ack - metrics

  measure: total_count_message_ack_events_daily {
    type: sum
    sql: ${count_message_ack_events_daily} ;;
    label: "Total # of Message Ack Events (Daily)"
    view_label: "* Features: Message Acknowledgment"
  }

  measure: total_count_message_ack_events_monthly {
    type: sum
    sql: ${count_message_ack_events_monthly} ;;
    label: "Total # of Message Ack Events (Monthly)"
    view_label: "* Features: Message Acknowledgment"
  }

  measure: total_count_message_ack_users_daily {
    type: sum
    sql: ${count_message_ack_users_daily} ;;
    label: "Total # of Message Ack Users (Daily)"
    view_label: "* Features: Message Acknowledgment"
  }

  measure: total_count_message_ack_users_monthly {
    type: sum
    sql: ${count_message_ack_users_monthly} ;;
    label: "Total # of Message Ack Users (Monthly)"
    view_label: "* Features: Message Acknowledgment"
  }


  ### Message Priority

  dimension: count_message_priority_events_daily {
    type: number
    sql: ${TABLE}.count_message_priority_events_daily ;;
    label: "# of Message Priority Events (Daily)"
    description: "The number of events related to Message Priority feature for the current day."
    view_label: "* Features: Message Priority"
  }

  dimension: count_message_priority_events_monthly {
    type: number
    sql: ${TABLE}.count_message_priority_events_monthly ;;
    label: "# of Message Priority Events (Monthly)"
    description: "The number of events related to Message Priority feature  for the current day and past 29 days."
    view_label: "* Features: Message Priority"
  }

  dimension: count_message_priority_users_daily {
    type: number
    sql: ${TABLE}.count_message_priority_users_daily ;;
    label: "# of Message Priority Unique Users (Daily)"
    description: "The number of unique users related to Message Priority feature for the current day."
    view_label: "* Features: Message Priority"
  }

  dimension: count_message_priority_users_monthly {
    type: number
    sql: ${TABLE}.count_message_priority_users_monthly ;;
    label: "# of Message Priority Unique Users (Monthly)"
    description: "The number of unique users related to Message Priority feature  for the current day and past 29 days."
    view_label: "* Features: Message Priority"
  }


  ### Message Ack - metrics

  measure: total_count_message_priority_events_daily {
    type: sum
    sql: ${count_message_priority_events_daily} ;;
    label: "Total # of Message Priority Events (Daily)"
    view_label: "* Features: Message Priority"
  }

  measure: total_count_message_priority_events_monthly {
    type: sum
    sql: ${count_message_priority_events_monthly} ;;
    label: "Total # of Message Priority Events (Monthly)"
    view_label: "* Features: Message Priority"
  }

  measure: total_count_message_priority_users_daily {
    type: sum
    sql: ${count_message_priority_users_daily} ;;
    label: "Total # of Message Priority Users (Daily)"
    view_label: "* Features: Message Priority"
  }

  measure: total_count_message_priority_users_monthly {
    type: sum
    sql: ${count_message_priority_users_monthly} ;;
    label: "Total # of Message Priority Users (Monthly)"
    view_label: "* Features: Message Priority"
  }


  ### Scheduled posts

  dimension: count_scheduled_posts_events_daily {
    type: number
    sql: ${TABLE}.count_scheduled_posts_events_daily ;;
    label: "# of Scheduled Posts Events (Daily)"
    description: "The number of events related to Scheduled Posts feature for the current day."
    view_label: "* Features: Scheduled Posts"
  }

  dimension: count_scheduled_posts_events_monthly {
    type: number
    sql: ${TABLE}.count_scheduled_posts_events_monthly ;;
    label: "# of Scheduled Posts Events (Monthly)"
    description: "The number of events related to Scheduled Posts feature  for the current day and past 29 days."
    view_label: "* Features: Scheduled Posts"
  }

  dimension: count_scheduled_posts_users_daily {
    type: number
    sql: ${TABLE}.count_scheduled_posts_users_daily ;;
    label: "# of Scheduled Posts Unique Users (Daily)"
    description: "The number of unique users related to Scheduled Posts feature for the current day."
    view_label: "* Features: Scheduled Posts"
  }

  dimension: count_scheduled_posts_users_monthly {
    type: number
    sql: ${TABLE}.count_scheduled_posts_users_monthly ;;
    label: "# of Scheduled Posts Unique Users (Monthly)"
    description: "The number of unique users related to Scheduled Posts feature  for the current day and past 29 days."
    view_label: "* Features: Scheduled Posts"
  }

  ### Scheduled Posts - metrics

  measure: total_count_scheduled_posts_events_daily {
    type: sum
    sql: ${count_scheduled_posts_events_daily} ;;
    label: "Total # of Scheduled Posts Events (Daily)"
    view_label: "* Features: Scheduled Posts"
  }

  measure: total_count_scheduled_posts_events_monthly {
    type: sum
    sql: ${count_scheduled_posts_events_monthly} ;;
    label: "Total # of Scheduled Posts Events (Monthly)"
    view_label: "* Features: Scheduled Posts"
  }

  measure: total_count_scheduled_posts_users_daily {
    type: sum
    sql: ${count_scheduled_posts_users_daily} ;;
    label: "Total # of Scheduled Posts Users (Daily)"
    view_label: "* Features: Scheduled Posts"
  }

  measure: total_count_scheduled_posts_users_monthly {
    type: sum
    sql: ${count_scheduled_posts_users_monthly} ;;
    label: "Total # of Scheduled Posts Users (Monthly)"
    view_label: "* Features: Scheduled Posts"
  }


    ### Passive keywords

    dimension: count_passive_keywords_events_daily {
      type: number
      sql: ${TABLE}.count_passive_keywords_events_daily;;
      label: "# of Passive Keywords Events (Daily)"
      description: "The number of events related to Passive keywords feature for the current day."
      view_label: "* Features: Passive keywords"
    }

    dimension: count_passive_keywords_events_monthly {
      type: number
      sql: ${TABLE}.count_passive_keywords_events_monthly;;
      label: "# of Passive Keywords Events (Monthly)"
      description: "The number of events related to Passive Keywords feature for the current day and past 29 days."
      view_label: "* Features: Passive keywords"
    }

    dimension: count_passive_keywords_users_daily {
      type: number
      sql: ${TABLE}.count_passive_keywords_users_daily ;;
      label: "# of Passive Keywords Unique Users (Daily)"
      description: "The number of unique users related to Passive Keywords feature for the current day."
      view_label: "* Features: Passive keywords"
    }

    dimension: count_passive_keywords_users_monthly {
      type: number
      sql: ${TABLE}.count_passive_keywords_users_monthly ;;
      label: "# of Passive Keywords Unique Users (Monthly)"
      description: "The number of unique users related to Passive Keywords feature for the current day and past 29 days."
      view_label: "* Features: Passive keywords"
    }

    ### Passive keywords - metrics

    measure: total_count_passive_keywords_events_daily {
      type: sum
      sql: ${count_passive_keywords_events_daily} ;;
      label: "Total # of Passive Keywords Events (Daily)"
      view_label: "* Features: Passive keywords"
    }

    measure: total_count_passive_keywords_events_monthly {
      type: sum
      sql: ${count_passive_keywords_events_monthly} ;;
      label: "Total # of Passive Keywords Events (Monthly)"
      view_label: "* Features: Passive keywords"
    }

    measure: total_count_passive_keywords_users_daily {
      type: sum
      sql: ${count_passive_keywords_users_daily} ;;
      label: "Total # of Passive Keywords Users (Daily)"
      view_label: "* Features: Passive keywords"
    }

    measure: total_count_passive_keywords_users_monthly {
      type: sum
      sql: ${count_passive_keywords_users_monthly} ;;
      label: "Total # of Passive Keywords Users (Monthly)"
      view_label: "* Features: Passive keywords"
    }


  ### Read-only Channels

  dimension: count_read_only_channels_events_daily {
    type: number
    sql: ${TABLE}.count_read_only_channels_events_daily ;;
    label: "# of Read-only Channels Events (Daily)"
    description: "The number of events related to Read-only Channels feature for the current day."
    view_label: "* Features: Read-only Channels"
  }

  dimension: count_read_only_channels_events_monthly {
    type: number
    sql: ${TABLE}.count_read_only_channels_events_monthly ;;
    label: "# of Read-only Channels Events (Monthly)"
    description: "The number of events related to Read-only Channels feature  for the current day and past 29 days."
    view_label: "* Features: Read-only Channels"
  }

  dimension: count_read_only_channels_users_daily {
    type: number
    sql: ${TABLE}.count_read_only_channels_users_daily ;;
    label: "# of Read-only Channels Unique Users (Daily)"
    description: "The number of unique users related to Read-only Channels feature for the current day."
    view_label: "* Features: Read-only Channels"
  }

  dimension: count_read_only_channels_users_monthly {
    type: number
    sql: ${TABLE}.count_read_only_channels_users_monthly ;;
    label: "# of Read-only Channels Unique Users (Monthly)"
    description: "The number of unique users related to Read-only Channels feature  for the current day and past 29 days."
    view_label: "* Features: Read-only Channels"
  }

  ### Read-only Channels - metrics

  measure: total_count_read_only_channels_events_daily {
    type: sum
    sql: ${count_read_only_channels_events_daily} ;;
    label: "Total # of Read-only Channels Events (Daily)"
    view_label: "* Features: Read-only Channels"
  }

  measure: total_count_read_only_channels_events_monthly {
    type: sum
    sql: ${count_read_only_channels_events_monthly} ;;
    label: "Total # of Read-only Channels Events (Monthly)"
    view_label: "* Features: Read-only Channels"
  }

  measure: total_count_read_only_channels_users_daily {
    type: sum
    sql: ${count_read_only_channels_users_daily} ;;
    label: "Total # of Read-only Channels Users (Daily)"
    view_label: "* Features: Read-only Channels"
  }

  measure: total_count_read_only_channels_users_monthly {
    type: sum
    sql: ${count_read_only_channels_users_monthly} ;;
    label: "Total # of Read-only Channels Users (Monthly)"
    view_label: "* Features: Read-only Channels"
  }


  ### Shared Channels

  dimension: count_shared_channels_events_daily {
    type: number
    sql: ${TABLE}.count_shared_channels_events_daily;;
    label: "# of Shared Channels Events (Daily)"
    description: "The number of events related to Shared Channels feature for the current day."
    view_label: "* Features: Shared Channels"
  }

  dimension: count_shared_channels_events_monthly {
    type: number
    sql: ${TABLE}.count_shared_channels_events_monthly;;
    label: "# of Shared Channels Events (Monthly)"
    description: "The number of events related to Shared Channels feature for the current day and past 29 days."
    view_label: "* Features: Shared Channels"
  }

  dimension: count_shared_channels_users_daily {
    type: number
    sql: ${TABLE}.count_shared_channels_users_daily ;;
    label: "# of Shared Channels Unique Users (Daily)"
    description: "The number of unique users related to Shared Channels feature for the current day."
    view_label: "* Features: Shared Channels"
  }

  dimension: count_shared_channels_users_monthly {
    type: number
    sql: ${TABLE}.count_shared_channels_users_monthly ;;
    label: "# of Shared Channels Unique Users (Monthly)"
    description: "The number of unique users related to Shared Channels feature for the current day and past 29 days."
    view_label: "* Features: Shared Channels"
  }

  ### Shared Channels - metrics

  measure: total_count_shared_channels_events_daily {
    type: sum
    sql: ${count_shared_channels_events_daily} ;;
    label: "Total # of Shared Channels Events (Daily)"
    view_label: "* Features: Shared Channels"
  }

  measure: total_count_shared_channels_events_monthly {
    type: sum
    sql: ${count_shared_channels_events_monthly} ;;
    label: "Total # of Shared Channels Events (Monthly)"
    view_label: "* Features: Shared Channels"
  }

  measure: total_count_shared_channels_users_daily {
    type: sum
    sql: ${count_shared_channels_users_daily} ;;
    label: "Total # of Shared Channels Users (Daily)"
    view_label: "* Features: Shared Channels"
  }

  measure: total_count_shared_channels_users_monthly {
    type: sum
    sql: ${count_shared_channels_users_monthly} ;;
    label: "Total # of Shared Channels Users (Monthly)"
    view_label: "* Features: Shared Channels"
  }


  ### Playbooks

  dimension: count_playbooks_events_daily {
    type: number
    sql: ${TABLE}.count_playbooks_events_daily ;;
    label: "# of Playbooks Events (Daily)"
    description: "The number of events related to Playbooks for the current day."
    view_label: "* Features: Playbooks"
  }

  dimension: count_playbooks_events_monthly {
    type: number
    sql: ${TABLE}.count_playbooks_events_monthly ;;
    label: "# of Playbooks Events (Monthly)"
    description: "The number of events related to Playbooks for the current day and past 29 days."
    view_label: "* Features: Playbooks"
  }

  dimension: count_playbooks_users_daily {
    type: number
    sql: ${TABLE}.count_playbooks_users_daily ;;
    label: "# of Playbooks Unique Users (Daily)"
    description: "The number of unique users related to Playbooks for the current day."
    view_label: "* Features: Playbooks"
  }

  dimension: count_playbooks_users_monthly {
    type: number
    sql: ${TABLE}.count_playbooks_users_monthly ;;
    label: "# of Playbooksk Unique Users (Monthly)"
    description: "The number of unique users related to Playbooks for the current day and past 29 days."
    view_label: "* Features: Playbooks"
  }


  ### Playbooks - metrics

  measure: total_count_playbooks_events_daily {
    type: sum
    sql: ${count_playbooks_events_daily} ;;
    label: "Total # of Playbooks Events (Daily)"
    view_label: "* Features: Playbooks"
  }

  measure: total_count_playbooks_events_monthly {
    type: sum
    sql: ${count_playbooks_events_monthly} ;;
    label: "Total # of Playbooks Events (Monthly)"
    view_label: "* Features: Playbooks"
  }

  measure: total_count_playbooks_users_daily {
    type: sum
    sql: ${count_playbooks_users_daily} ;;
    label: "Total # of Playbooks Users (Daily)"
    view_label: "* Features: Playbooks"
  }

  measure: total_count_playbooks_users_monthly {
    type: sum
    sql: ${count_playbooks_users_monthly} ;;
    label: "Total # of Playbooks Users (Monthly)"
    view_label: "* Features: Playbooks"
  }



  ### Calls

  dimension: count_calls_events_daily {
    type: number
    sql: ${TABLE}.count_calls_events_daily ;;
    label: "# of Calls Events (Daily)"
    description: "The number of events related to Calls for the current day."
    view_label: "* Features: Calls"
  }

  dimension: count_calls_events_monthly {
    type: number
    sql: ${TABLE}.count_calls_events_monthly ;;
    label: "# of Calls Events (Monthly)"
    description: "The number of events related to Calls for the current day and past 29 days."
    view_label: "* Features: Calls"
  }

  dimension: count_calls_users_daily {
    type: number
    sql: ${TABLE}.count_calls_users_daily ;;
    label: "# of Calls Unique Users (Daily)"
    description: "The number of unique users related to Calls for the current day."
    view_label: "* Features: Calls"
  }

  dimension: count_calls_users_monthly {
    type: number
    sql: ${TABLE}.count_calls_users_monthly ;;
    label: "# of Calls Unique Users (Monthly)"
    description: "The number of unique users related to Calls for the current day and past 29 days."
    view_label: "* Features: Calls"
  }


  ### Calls - metrics

  measure: total_count_calls_events_daily {
    type: sum
    sql: ${count_calls_events_daily} ;;
    label: "Total # of Calls Events (Daily)"
    view_label: "* Features: Calls"
  }

  measure: total_count_calls_events_monthly {
    type: sum
    sql: ${count_calls_events_monthly} ;;
    label: "Total # of Calls Events (Monthly)"
    view_label: "* Features: Calls"
  }

  measure: total_count_calls_users_daily {
    type: sum
    sql: ${count_calls_users_daily} ;;
    label: "Total # of Calls Users (Daily)"
    view_label: "* Features: Calls"
  }

  measure: total_count_calls_users_monthly {
    type: sum
    sql: ${count_calls_users_monthly} ;;
    label: "Total # of Calls Users (Monthly)"
    view_label: "* Features: Calls"
  }



  ### Copilot

  dimension: count_copilot_events_daily {
    type: number
    sql: ${TABLE}.count_copilot_events_daily ;;
    label: "# of Copilot Events (Daily)"
    description: "The number of events related to Copilot for the current day."
    view_label: "* Features: Copilot"
  }

  dimension: count_copilot_events_monthly {
    type: number
    sql: ${TABLE}.count_copilot_events_monthly ;;
    label: "# of Copilot Events (Monthly)"
    description: "The number of events related to Copilot for the current day and past 29 days."
    view_label: "* Features: Copilot"
  }

  dimension: count_copilot_users_daily {
    type: number
    sql: ${TABLE}.count_copilot_users_daily ;;
    label: "# of Copilot Unique Users (Daily)"
    description: "The number of unique users related to Copilot for the current day."
    view_label: "* Features: Copilot"
  }

  dimension: count_copilot_users_monthly {
    type: number
    sql: ${TABLE}.count_copilot_users_monthly ;;
    label: "# of Copilot Unique Users (Monthly)"
    description: "The number of unique users related to Copilot for the current day and past 29 days."
    view_label: "* Features: Copilot"
  }


  ### Copilot - metrics

  measure: total_count_copilot_events_daily {
    type: sum
    sql: ${count_copilot_events_daily} ;;
    label: "Total # of Copilot Events (Daily)"
    view_label: "* Features: Copilot"
  }

  measure: total_count_copilot_events_monthly {
    type: sum
    sql: ${count_copilot_events_monthly} ;;
    label: "Total # of Copilot Events (Monthly)"
    view_label: "* Features: Copilot"
  }

  measure: total_count_copilot_users_daily {
    type: sum
    sql: ${count_copilot_users_daily} ;;
    label: "Total # of Copilot Users (Daily)"
    view_label: "* Features: Copilot"
  }

  measure: total_count_copilot_users_monthly {
    type: sum
    sql: ${count_copilot_users_monthly} ;;
    label: "Total # of Copilot Users (Monthly)"
    view_label: "* Features: Copilot"
  }

  ### Known feature aggregates per server/date

  dimension: count_known_features_events_daily {
    type: number
    sql: ${TABLE}.count_known_features_events_daily ;;
    label: "# of Events for Known Features (Daily)"
    description: "The number of events captured the current day that can be mapped to any known feature."
    view_label: "* Features: Known features (aggregated)"
  }

  dimension: count_known_features_events_monthly {
    type: number
    sql: ${TABLE}.count_known_features_events_monthly ;;
    label: "# of Events for Known Features (Monthly)"
    description: "The number of events captured the current day and past 29 days that can be mapped to any known feature."
    view_label: "* Features: Known features (aggregated)"
  }

  dimension: count_known_features_users_daily {
    type: number
    sql: ${TABLE}.count_known_features_users_daily ;;
    label: "# of Unique Users for Known Features (Daily)"
    description: "The number of unique users captured the current day performing an action that can be mapped to any known feature."
    view_label: "* Features: Known features (aggregated)"
  }

  dimension: count_known_features_users_monthly {
    type: number
    sql: ${TABLE}.count_known_features_users_monthly ;;
    label: "# of Unique Users for Known Features (Monthly)"
    description: "The number of unique users captured the current day and past 29 days performing an action that can be mapped to any known feature."
    view_label: "* Features: Known features (aggregated)"
  }

  ### Known feature aggregates per server/date - measures

  measure: total_count_known_features_events_daily {
    type: sum
    sql: ${count_known_features_events_daily} ;;
    label: "Total # of Known Feature Events (Daily)"
    view_label: "* Features: Known features (aggregated)"
  }

  measure: total_count_known_features_events_monthly {
    type: sum
    sql: ${count_known_features_events_monthly} ;;
    label: "Total # of Known Feature Events (Monthly)"
    view_label: "* Features: Known features (aggregated)"
  }

  measure: total_count_known_features_users_daily {
    type: sum
    sql: ${count_known_features_users_daily} ;;
    label: "Total # of Known Feature Users (Daily)"
    view_label: "* Features: Known features (aggregated)"
  }

  measure: total_count_known_features_users_monthly {
    type: sum
    sql: ${count_known_features_users_monthly} ;;
    label: "Total # of Known Feature Users (Monthly)"
    view_label: "* Features: Known features (aggregated)"
  }

  ### Unknown feature aggregates per server/date

    dimension: count_unknown_features_events_daily {
    type: number
    sql: ${TABLE}.count_unknown_features_events_daily ;;
    label: "# of Events for not Known Features. (Daily)"
    description: "The number of events captured the current day that cannot (yet) be mapped to a feature."
    view_label: "* Features: Unknown features (aggregated)"
  }

  dimension: count_unknown_features_events_monthly {
    type: number
    sql: ${TABLE}.count_known_features_events_monthly ;;
    label: "# of Events for not Known Features. (Monthly)"
    description: "The number of events captured the current day and past 29 days that cannot (yet) be mapped to a feature."
    view_label: "* Features: Unknown features (aggregated)"
  }

  dimension: count_unknown_features_users_daily {
    type: number
    sql: ${TABLE}.count_unknown_features_users_daily ;;
    label: "# of Unique Users of not Known Features. (Daily)"
    description: "The number of unique users captured the current day performing an action that cannot (yet) be mapped to a feature."
    view_label: "* Features: Unknown features (aggregated)"
  }

  dimension: count_unknown_features_users_monthly {
    type: number
    sql: ${TABLE}.count_unknown_features_users_monthly ;;
    label: "# of Unique Users of not Known Features. (Monthly)"
    description: "The number of unique users captured the current day and past 29 days performing an action that cannot (yet) be mapped to a feature."
    view_label: "* Features: Unknown features (aggregated)"
  }

  ### Unknown feature aggregates per server/date - measures

  measure: total_count_unknown_features_events_daily {
    type: sum
    sql: ${count_unknown_features_events_daily} ;;
    label: "Total # of Events for not Known Features. (Daily)"
    view_label: "* Features: Unknown features (aggregated)"
  }

  measure: total_count_unknown_features_events_monthly {
    type: sum
    sql: ${count_unknown_features_events_monthly} ;;
    label: "Total # of Events for not Known Features. (Monthly)"
    view_label: "* Features: Unknown features (aggregated)"
  }

  measure: total_count_unknown_features_users_daily {
    type: sum
    sql: ${count_unknown_features_users_daily} ;;
    label: "Total # of Unique Users of not Known Features. (Daily)"
    view_label: "* Features: Unknown features (aggregated)"
  }

  measure: total_count_unknown_features_users_monthly {
    type: sum
    sql: ${count_unknown_features_users_monthly} ;;
    label: "Total # of Unique Users of not Known Features. (Monthly)"
    view_label: "* Features: Unknown features (aggregated)"
  }

  ### DAU/MAU per server/date
  dimension: client_daily_active_users {
    type: number
    sql: ${TABLE}.client_daily_active_users ;;
    label: "DAU (Client)"
    description: "DAU reported by MM client activity. Defined as the number of unique users that performed an action for the given server and date, as counted based on user events originating from the user's client."
    view_label: "* Metrics: Active Users"
  }

  dimension: client_monthly_active_users {
    type: number
    sql: ${TABLE}.client_monthly_active_users ;;
    label: "MAU (Client)"
    description: "DAU reported by MM client activity. Defined as the number of unique users that performed an action for the given server on the given date and previous 29 days, as counted based on user events originating from the user's client."
    view_label: "* Metrics: Active Users"
  }

  dimension: server_daily_active_users {
    type: number
    sql: ${TABLE}.server_daily_active_users ;;
    label: "DAU (Server)"
    description: "DAU reported by MM server activity. Defined as the number of unique users that performed an action in the 24 hours previous to sending the telemetry data."
    view_label: "* Metrics: Active Users"
  }


  dimension: server_monthly_active_users {
    type: number
    sql: ${TABLE}.server_monthly_active_users ;;
    label: "MAU (Server)"
    description: "MAU reported by MM server activity. Defined as the number of unique users that performed an action in the 31 days previous to sending the telemetry data."
    view_label: "* Metrics: Active Users"
  }


  dimension: count_registered_users {
    type: number
    sql: ${TABLE}.count_registered_users ;;
    label: "Registered users"
    description: "Total number of registered users. Includes deleted users."
    view_label: "* Metrics: Active Users"
  }

  dimension: count_registered_deactivated_users {
    type: number
    sql: ${TABLE}.count_registered_deactivated_users ;;
    label: "Deactivated Users"
    description: "Total number of inactive (deleted) users."
    view_label: "* Metrics: Active Users"
  }


  dimension: count_registered_active_users {
    type: number
    sql: ${TABLE}.count_registered_users - ${TABLE}.count_registered_deactivated_users;;
    label: "Active Registered Users"
    description: "Total number of active registered users. Does not include deleted users."
    view_label: "* Metrics: Active Users"
  }

  measure: total_client_daily_active_users {
    type: sum
    sql: ${client_daily_active_users} ;;
    label: "Total DAU (Client)"
    view_label: "* Metrics: Active Users"
  }

  measure: total_client_monthly_active_users {
    type: sum
    sql: ${client_monthly_active_users} ;;
    label: "Total MAU (Client)"
    view_label: "* Metrics: Active Users"
  }

  measure: total_server_daily_active_users {
    type: sum
    sql: ${server_daily_active_users} ;;
    label: "Total DAU (Server)"
    view_label: "* Metrics: Active Users"
  }

  measure: total_server_monthly_active_users {
    type: sum
    sql: ${server_monthly_active_users} ;;
    label: "Total MAU (Server)"
    view_label: "* Metrics: Active Users"
  }

  measure: total_count_registered_users {
    type: sum
    sql: ${count_registered_users} ;;
    label: "Total Registered Users"
    view_label: "* Metrics: Active Users"
  }

  measure: total_count_registered_deactivated_users {
    type: sum
    sql: ${count_registered_deactivated_users} ;;
    label: "Total Deactivated Users"
    view_label: "* Metrics: Active Users"
  }

  measure: total_count_registered_active_users {
    type: sum
    sql: ${count_registered_active_users} ;;
    label: "Total Active Registered Users"
    view_label: "* Metrics: Active Users"
  }


  measure: count_distinct_servers {
    type: count_distinct
    sql: ${server_id} ;;
    label: "Count Unique Servers"
    description: "Count of distinct servers"
    view_label: " * Metrics: Active Users"
    drill_fields: [server_id, count_known_features_events_daily, count_known_features_users_daily, count_unknown_features_events_daily, count_unknown_features_users_daily, client_daily_active_users, server_daily_active_users]
  }
}
