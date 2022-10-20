view: effective_inactive_server_emails {
  view_label: "Effective Inactive Server Emails"
  derived_table: {
    sql: select
          date as "Date",
          count(distinct(CASE WHEN event_type = 'inactive_server_emails_sent' THEN user_id END)) as "Inactive Server Emails Sent",
          count(distinct(CASE WHEN event_type != 'inactive_server_emails_sent' AND
                          event_type != 'inactive_server' AND
                          prev_event = 'inactive_server_emails_sent' AND
                          category != 'performance' THEN user_id END)) as "Active Servers After Email"
      from (
          select
              to_date(uet.timestamp) as date,
              COALESCE(uet.type, uet.event) as event_type,
              uet.user_id as user_id,
              uet.category as category,
              lag(event_type) over (partition by user_id order by timestamp) as prev_event
          from analytics.events.user_events_telemetry uet
          where date between
              dateadd('day',-30,current_date()) and current_date()
      )

      group by
      date
      order by
      date desc
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: date {
    type: date
    sql: ${TABLE}."Date" ;;
  }

  dimension: inactive_server_emails_sent {
    type: number
    label: "Inactive Server Emails Sent"
    sql: ${TABLE}."Inactive Server Emails Sent" ;;
  }

  dimension: active_servers_after_email {
    type: number
    label: "Active Servers After Email"
    sql: ${TABLE}."Active Servers After Email" ;;
  }

  set: detail {
    fields: [date, inactive_server_emails_sent, active_servers_after_email]
  }
}
