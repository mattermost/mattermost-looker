
# This is the view file for the analytics.events.performance_events table.
view: performance_events {
sql_table_name: events.performance_events ;;
view_label: "Performance Events"



### SETS


    
### DIMENSIONS



  dimension: _dbt_source_relation {
    label: " Dbt Source Relation"
    description: "The  Dbt Source Relation of the instance (or user)."
    type: string
    sql: ${TABLE}._dbt_source_relation ;;
  }


  dimension: context_page_referrer {
    label: "Context Page Referrer"
    description: "The Context Page Referrer of the instance (or user)."
    type: string
    sql: ${TABLE}.context_page_referrer ;;
  }


  dimension: channel {
    label: "Channel"
    description: "The Channel of the instance (or user)."
    type: string
    sql: ${TABLE}.channel ;;
  }


  dimension: context_app_namespace {
    label: "Context App Namespace"
    description: "The Context App Namespace of the instance (or user)."
    type: string
    sql: ${TABLE}.context_app_namespace ;;
  }


  dimension: id {
    label: "Id"
    description: "The Id of the instance (or user)."
    type: string
    sql: ${TABLE}.id ;;
  }


  dimension: event {
    label: "Event"
    description: "The Event of the instance (or user)."
    type: string
    sql: ${TABLE}.event ;;
  }


  dimension: user_actual_id {
    label: "User Actual Id"
    description: "The User Actual Id of the instance (or user)."
    type: string
    sql: ${TABLE}.user_actual_id ;;
  }


  dimension: event_text {
    label: "Event Text"
    description: "The Event Text of the instance (or user)."
    type: string
    sql: ${TABLE}.event_text ;;
  }


  dimension: context_library_name {
    label: "Context Library Name"
    description: "The Context Library Name of the instance (or user)."
    type: string
    sql: ${TABLE}.context_library_name ;;
  }


  dimension: type {
    label: "Type"
    description: "The Type of the instance (or user)."
    type: string
    sql: ${TABLE}.type ;;
  }


  dimension: context_app_version {
    label: "Context App Version"
    description: "The Context App Version of the instance (or user)."
    type: string
    sql: ${TABLE}.context_app_version ;;
  }


  dimension: user_actual_role {
    label: "User Actual Role"
    description: "The User Actual Role of the instance (or user)."
    type: string
    sql: ${TABLE}.user_actual_role ;;
  }


  dimension: context_page_url {
    label: "Context Page Url"
    description: "The Context Page Url of the instance (or user)."
    type: string
    sql: ${TABLE}.context_page_url ;;
  }


  dimension: context_os_name {
    label: "Context Os Name"
    description: "The Context Os Name of the instance (or user)."
    type: string
    sql: ${TABLE}.context_os_name ;;
  }


  dimension: context_page_title {
    label: "Context Page Title"
    description: "The Context Page Title of the instance (or user)."
    type: string
    sql: ${TABLE}.context_page_title ;;
  }


  dimension: channel_id {
    label: "Channel Id"
    description: "The Channel Id of the instance (or user)."
    type: string
    sql: ${TABLE}.channel_id ;;
  }


  dimension: anonymous_id {
    label: "Anonymous Id"
    description: "The Anonymous Id of the instance (or user)."
    type: string
    sql: ${TABLE}.anonymous_id ;;
  }


  dimension: context_app_build {
    label: "Context App Build"
    description: "The Context App Build of the instance (or user)."
    type: string
    sql: ${TABLE}.context_app_build ;;
  }


  dimension: context_page_search {
    label: "Context Page Search"
    description: "The Context Page Search of the instance (or user)."
    type: string
    sql: ${TABLE}.context_page_search ;;
  }


  dimension: context_library_version {
    label: "Context Library Version"
    description: "The Context Library Version of the instance (or user)."
    type: string
    sql: ${TABLE}.context_library_version ;;
  }


  dimension: context_ip {
    label: "Context Ip"
    description: "The Context Ip of the instance (or user)."
    type: string
    sql: ${TABLE}.context_ip ;;
  }


  dimension: context_useragent {
    label: "Context Useragent"
    description: "The Context Useragent of the instance (or user)."
    type: string
    sql: ${TABLE}.context_useragent ;;
  }


  dimension: context_app_name {
    label: "Context App Name"
    description: "The Context App Name of the instance (or user)."
    type: string
    sql: ${TABLE}.context_app_name ;;
  }


  dimension: context_locale {
    label: "Context Locale"
    description: "The Context Locale of the instance (or user)."
    type: string
    sql: ${TABLE}.context_locale ;;
  }


  dimension: context_screen_density {
    label: "Context Screen Density"
    description: "The Context Screen Density of the instance."
    type: string
    sql: ${TABLE}.context_screen_density ;;
  }



  dimension: context_page_path {
    label: "Context Page Path"
    description: "The Context Page Path of the instance (or user)."
    type: string
    sql: ${TABLE}.context_page_path ;;
  }


  dimension: context_os_version {
    label: "Context Os Version"
    description: "The Context Os Version of the instance (or user)."
    type: string
    sql: ${TABLE}.context_os_version ;;
  }


  dimension: category {
    label: "Category"
    description: "The Category of the instance (or user)."
    type: string
    sql: ${TABLE}.category ;;
  }


  dimension: duration {
    label: "Duration"
    description: "The Duration of the instance."
    type: string
    sql: ${TABLE}.duration ;;
  }



  dimension: user_id {
    label: "User Id"
    description: "The User Id of the instance (or user)."
    type: string
    sql: ${TABLE}.user_id ;;
  }


  dimension: root_id {
    label: "Root Id"
    description: "The Root Id of the instance (or user)."
    type: string
    sql: ${TABLE}.root_id ;;
  }


  dimension: post_id {
    label: "Post Id"
    description: "The Post Id of the instance (or user)."
    type: string
    sql: ${TABLE}.post_id ;;
  }


  dimension: sort {
    label: "Sort"
    description: "The Sort of the instance (or user)."
    type: string
    sql: ${TABLE}.sort ;;
  }


  dimension: team_id {
    label: "Team Id"
    description: "The Team Id of the instance (or user)."
    type: string
    sql: ${TABLE}.team_id ;;
  }


  dimension: userid {
    label: "Userid"
    description: "The Userid of the instance (or user)."
    type: string
    sql: ${TABLE}.userid ;;
  }


  dimension: channelsids_1 {
    label: "Channelsids 1"
    description: "The Channelsids 1 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_1 ;;
  }


  dimension: channelsids_0 {
    label: "Channelsids 0"
    description: "The Channelsids 0 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_0 ;;
  }


  dimension: version {
    label: "Version"
    description: "The Version of the instance (or user)."
    type: string
    sql: ${TABLE}.version ;;
  }


  dimension: keyword {
    label: "Keyword"
    description: "The Keyword of the instance (or user)."
    type: string
    sql: ${TABLE}.keyword ;;
  }


  dimension: count {
    label: "Count"
    description: "The Count of the instance."
    type: string
    sql: ${TABLE}.count ;;
  }



  dimension: gfyid {
    label: "Gfyid"
    description: "The Gfyid of the instance (or user)."
    type: string
    sql: ${TABLE}.gfyid ;;
  }


  dimension: context {
    label: "Context"
    description: "The Context of the instance (or user)."
    type: string
    sql: ${TABLE}.context ;;
  }


  dimension: field {
    label: "Field"
    description: "The Field of the instance (or user)."
    type: string
    sql: ${TABLE}.field ;;
  }


  dimension: plugin_id {
    label: "Plugin Id"
    description: "The Plugin Id of the instance (or user)."
    type: string
    sql: ${TABLE}.plugin_id ;;
  }


  dimension: installed_version {
    label: "Installed Version"
    description: "The Installed Version of the instance (or user)."
    type: string
    sql: ${TABLE}.installed_version ;;
  }


  dimension: group_constrained {
    label: "Group Constrained"
    description: "Indicates Group Constrained is marked true/enabled."
    type: yesno
    sql: ${TABLE}.group_constrained ;;
  }



  dimension: channelsids_32 {
    label: "Channelsids 32"
    description: "The Channelsids 32 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_32 ;;
  }


  dimension: channelsids_7 {
    label: "Channelsids 7"
    description: "The Channelsids 7 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_7 ;;
  }


  dimension: channelsids_45 {
    label: "Channelsids 45"
    description: "The Channelsids 45 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_45 ;;
  }


  dimension: channelsids_44 {
    label: "Channelsids 44"
    description: "The Channelsids 44 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_44 ;;
  }


  dimension: channelsids_14 {
    label: "Channelsids 14"
    description: "The Channelsids 14 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_14 ;;
  }


  dimension: channelsids_16 {
    label: "Channelsids 16"
    description: "The Channelsids 16 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_16 ;;
  }


  dimension: channelsids_13 {
    label: "Channelsids 13"
    description: "The Channelsids 13 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_13 ;;
  }


  dimension: channelsids_29 {
    label: "Channelsids 29"
    description: "The Channelsids 29 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_29 ;;
  }


  dimension: channelsids_46 {
    label: "Channelsids 46"
    description: "The Channelsids 46 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_46 ;;
  }


  dimension: channelsids_2 {
    label: "Channelsids 2"
    description: "The Channelsids 2 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_2 ;;
  }


  dimension: channelsids_21 {
    label: "Channelsids 21"
    description: "The Channelsids 21 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_21 ;;
  }


  dimension: channelsids_3 {
    label: "Channelsids 3"
    description: "The Channelsids 3 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_3 ;;
  }


  dimension: channelsids_10 {
    label: "Channelsids 10"
    description: "The Channelsids 10 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_10 ;;
  }


  dimension: channelsids_6 {
    label: "Channelsids 6"
    description: "The Channelsids 6 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_6 ;;
  }


  dimension: channelsids_27 {
    label: "Channelsids 27"
    description: "The Channelsids 27 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_27 ;;
  }


  dimension: channelsids_39 {
    label: "Channelsids 39"
    description: "The Channelsids 39 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_39 ;;
  }


  dimension: channelsids_34 {
    label: "Channelsids 34"
    description: "The Channelsids 34 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_34 ;;
  }


  dimension: channelsids_31 {
    label: "Channelsids 31"
    description: "The Channelsids 31 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_31 ;;
  }


  dimension: channelsids_36 {
    label: "Channelsids 36"
    description: "The Channelsids 36 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_36 ;;
  }


  dimension: channelsids_28 {
    label: "Channelsids 28"
    description: "The Channelsids 28 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_28 ;;
  }


  dimension: channelsids_4 {
    label: "Channelsids 4"
    description: "The Channelsids 4 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_4 ;;
  }


  dimension: channelsids_30 {
    label: "Channelsids 30"
    description: "The Channelsids 30 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_30 ;;
  }


  dimension: channelsids_11 {
    label: "Channelsids 11"
    description: "The Channelsids 11 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_11 ;;
  }


  dimension: channelsids_23 {
    label: "Channelsids 23"
    description: "The Channelsids 23 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_23 ;;
  }


  dimension: channelsids_41 {
    label: "Channelsids 41"
    description: "The Channelsids 41 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_41 ;;
  }


  dimension: channelsids_37 {
    label: "Channelsids 37"
    description: "The Channelsids 37 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_37 ;;
  }


  dimension: channelsids_19 {
    label: "Channelsids 19"
    description: "The Channelsids 19 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_19 ;;
  }


  dimension: channelsids_9 {
    label: "Channelsids 9"
    description: "The Channelsids 9 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_9 ;;
  }


  dimension: channelsids_47 {
    label: "Channelsids 47"
    description: "The Channelsids 47 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_47 ;;
  }


  dimension: channelsids_12 {
    label: "Channelsids 12"
    description: "The Channelsids 12 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_12 ;;
  }


  dimension: channelsids_15 {
    label: "Channelsids 15"
    description: "The Channelsids 15 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_15 ;;
  }


  dimension: channelsids_20 {
    label: "Channelsids 20"
    description: "The Channelsids 20 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_20 ;;
  }


  dimension: channelsids_35 {
    label: "Channelsids 35"
    description: "The Channelsids 35 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_35 ;;
  }


  dimension: channelsids_24 {
    label: "Channelsids 24"
    description: "The Channelsids 24 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_24 ;;
  }


  dimension: channelsids_40 {
    label: "Channelsids 40"
    description: "The Channelsids 40 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_40 ;;
  }


  dimension: channelsids_5 {
    label: "Channelsids 5"
    description: "The Channelsids 5 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_5 ;;
  }


  dimension: channelsids_22 {
    label: "Channelsids 22"
    description: "The Channelsids 22 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_22 ;;
  }


  dimension: channelsids_8 {
    label: "Channelsids 8"
    description: "The Channelsids 8 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_8 ;;
  }


  dimension: channelsids_33 {
    label: "Channelsids 33"
    description: "The Channelsids 33 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_33 ;;
  }


  dimension: channelsids_42 {
    label: "Channelsids 42"
    description: "The Channelsids 42 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_42 ;;
  }


  dimension: channelsids_43 {
    label: "Channelsids 43"
    description: "The Channelsids 43 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_43 ;;
  }


  dimension: channelsids_25 {
    label: "Channelsids 25"
    description: "The Channelsids 25 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_25 ;;
  }


  dimension: channelsids_26 {
    label: "Channelsids 26"
    description: "The Channelsids 26 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_26 ;;
  }


  dimension: channelsids_38 {
    label: "Channelsids 38"
    description: "The Channelsids 38 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_38 ;;
  }


  dimension: channelsids_18 {
    label: "Channelsids 18"
    description: "The Channelsids 18 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_18 ;;
  }


  dimension: channelsids_17 {
    label: "Channelsids 17"
    description: "The Channelsids 17 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_17 ;;
  }


  dimension: value {
    label: "Value"
    description: "The Value of the instance (or user)."
    type: string
    sql: ${TABLE}.value ;;
  }


  dimension: include_deleted {
    label: "Include Deleted"
    description: "Indicates Include Deleted is marked true/enabled."
    type: yesno
    sql: ${TABLE}.include_deleted ;;
  }



  dimension: role {
    label: "Role"
    description: "The Role of the instance (or user)."
    type: string
    sql: ${TABLE}.role ;;
  }


  dimension: channelsids_49 {
    label: "Channelsids 49"
    description: "The Channelsids 49 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_49 ;;
  }


  dimension: channelsids_48 {
    label: "Channelsids 48"
    description: "The Channelsids 48 of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids_48 ;;
  }


  dimension: channel_ids_0 {
    label: "Channel Ids 0"
    description: "The Channel Ids 0 of the instance (or user)."
    type: string
    sql: ${TABLE}.channel_ids_0 ;;
  }


  dimension: channel_ids_1 {
    label: "Channel Ids 1"
    description: "The Channel Ids 1 of the instance (or user)."
    type: string
    sql: ${TABLE}.channel_ids_1 ;;
  }


  dimension: privacy {
    label: "Privacy"
    description: "The Privacy of the instance (or user)."
    type: string
    sql: ${TABLE}.privacy ;;
  }


  dimension: scheme_id {
    label: "Scheme Id"
    description: "The Scheme Id of the instance (or user)."
    type: string
    sql: ${TABLE}.scheme_id ;;
  }


  dimension: channel_ids_2 {
    label: "Channel Ids 2"
    description: "The Channel Ids 2 of the instance (or user)."
    type: string
    sql: ${TABLE}.channel_ids_2 ;;
  }


  dimension: channelsids {
    label: "Channelsids"
    description: "The Channelsids of the instance (or user)."
    type: string
    sql: ${TABLE}.channelsids ;;
  }


  dimension: channel_ids {
    label: "Channel Ids"
    description: "The Channel Ids of the instance (or user)."
    type: string
    sql: ${TABLE}.channel_ids ;;
  }


  dimension: from_page {
    label: "From Page"
    description: "The From Page of the instance (or user)."
    type: string
    sql: ${TABLE}.from_page ;;
  }


  dimension: context_compiled {
    label: "Context Compiled"
    description: "Indicates Context Compiled is marked true/enabled."
    type: yesno
    sql: ${TABLE}.context_compiled ;;
  }



  dimension: context_terminators_lastindex {
    label: "Context Terminators Lastindex"
    description: "The Context Terminators Lastindex of the instance."
    type: string
    sql: ${TABLE}.context_terminators_lastindex ;;
  }



  dimension: context_contains {
    label: "Context Contains"
    description: "The Context Contains of the instance (or user)."
    type: string
    sql: ${TABLE}.context_contains ;;
  }


  dimension: context_relevance {
    label: "Context Relevance"
    description: "The Context Relevance of the instance."
    type: string
    sql: ${TABLE}.context_relevance ;;
  }



  dimension: context_traits_41 {
    label: "Context Traits 41"
    description: "The Context Traits 41 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_41 ;;
  }


  dimension: context_traits_2 {
    label: "Context Traits 2"
    description: "The Context Traits 2 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_2 ;;
  }


  dimension: context_traits_9 {
    label: "Context Traits 9"
    description: "The Context Traits 9 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_9 ;;
  }


  dimension: context_traits_28 {
    label: "Context Traits 28"
    description: "The Context Traits 28 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_28 ;;
  }


  dimension: context_traits_53 {
    label: "Context Traits 53"
    description: "The Context Traits 53 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_53 ;;
  }


  dimension: context_traits_20 {
    label: "Context Traits 20"
    description: "The Context Traits 20 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_20 ;;
  }


  dimension: context_traits_40 {
    label: "Context Traits 40"
    description: "The Context Traits 40 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_40 ;;
  }


  dimension: context_traits_3 {
    label: "Context Traits 3"
    description: "The Context Traits 3 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_3 ;;
  }


  dimension: context_traits_1 {
    label: "Context Traits 1"
    description: "The Context Traits 1 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_1 ;;
  }


  dimension: context_traits_44 {
    label: "Context Traits 44"
    description: "The Context Traits 44 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_44 ;;
  }


  dimension: context_traits_10 {
    label: "Context Traits 10"
    description: "The Context Traits 10 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_10 ;;
  }


  dimension: context_traits_17 {
    label: "Context Traits 17"
    description: "The Context Traits 17 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_17 ;;
  }


  dimension: context_traits_34 {
    label: "Context Traits 34"
    description: "The Context Traits 34 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_34 ;;
  }


  dimension: context_traits_54 {
    label: "Context Traits 54"
    description: "The Context Traits 54 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_54 ;;
  }


  dimension: context_traits_15 {
    label: "Context Traits 15"
    description: "The Context Traits 15 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_15 ;;
  }


  dimension: context_traits_14 {
    label: "Context Traits 14"
    description: "The Context Traits 14 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_14 ;;
  }


  dimension: context_traits_31 {
    label: "Context Traits 31"
    description: "The Context Traits 31 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_31 ;;
  }


  dimension: context_traits_32 {
    label: "Context Traits 32"
    description: "The Context Traits 32 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_32 ;;
  }


  dimension: context_traits_38 {
    label: "Context Traits 38"
    description: "The Context Traits 38 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_38 ;;
  }


  dimension: context_traits_16 {
    label: "Context Traits 16"
    description: "The Context Traits 16 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_16 ;;
  }


  dimension: context_traits_56 {
    label: "Context Traits 56"
    description: "The Context Traits 56 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_56 ;;
  }


  dimension: context_traits_13 {
    label: "Context Traits 13"
    description: "The Context Traits 13 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_13 ;;
  }


  dimension: context_traits_23 {
    label: "Context Traits 23"
    description: "The Context Traits 23 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_23 ;;
  }


  dimension: context_traits_30 {
    label: "Context Traits 30"
    description: "The Context Traits 30 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_30 ;;
  }


  dimension: context_traits_39 {
    label: "Context Traits 39"
    description: "The Context Traits 39 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_39 ;;
  }


  dimension: context_traits_51 {
    label: "Context Traits 51"
    description: "The Context Traits 51 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_51 ;;
  }


  dimension: context_traits_45 {
    label: "Context Traits 45"
    description: "The Context Traits 45 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_45 ;;
  }


  dimension: context_traits_24 {
    label: "Context Traits 24"
    description: "The Context Traits 24 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_24 ;;
  }


  dimension: context_traits_47 {
    label: "Context Traits 47"
    description: "The Context Traits 47 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_47 ;;
  }


  dimension: context_traits_29 {
    label: "Context Traits 29"
    description: "The Context Traits 29 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_29 ;;
  }


  dimension: context_traits_19 {
    label: "Context Traits 19"
    description: "The Context Traits 19 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_19 ;;
  }


  dimension: context_traits_33 {
    label: "Context Traits 33"
    description: "The Context Traits 33 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_33 ;;
  }


  dimension: context_traits_55 {
    label: "Context Traits 55"
    description: "The Context Traits 55 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_55 ;;
  }


  dimension: context_traits_22 {
    label: "Context Traits 22"
    description: "The Context Traits 22 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_22 ;;
  }


  dimension: context_traits_11 {
    label: "Context Traits 11"
    description: "The Context Traits 11 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_11 ;;
  }


  dimension: context_traits_4 {
    label: "Context Traits 4"
    description: "The Context Traits 4 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_4 ;;
  }


  dimension: context_traits_27 {
    label: "Context Traits 27"
    description: "The Context Traits 27 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_27 ;;
  }


  dimension: context_traits_50 {
    label: "Context Traits 50"
    description: "The Context Traits 50 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_50 ;;
  }


  dimension: context_traits_12 {
    label: "Context Traits 12"
    description: "The Context Traits 12 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_12 ;;
  }


  dimension: context_traits_35 {
    label: "Context Traits 35"
    description: "The Context Traits 35 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_35 ;;
  }


  dimension: context_traits_37 {
    label: "Context Traits 37"
    description: "The Context Traits 37 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_37 ;;
  }


  dimension: context_traits_5 {
    label: "Context Traits 5"
    description: "The Context Traits 5 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_5 ;;
  }


  dimension: context_traits_21 {
    label: "Context Traits 21"
    description: "The Context Traits 21 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_21 ;;
  }


  dimension: context_traits_26 {
    label: "Context Traits 26"
    description: "The Context Traits 26 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_26 ;;
  }


  dimension: context_traits_6 {
    label: "Context Traits 6"
    description: "The Context Traits 6 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_6 ;;
  }


  dimension: context_traits_36 {
    label: "Context Traits 36"
    description: "The Context Traits 36 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_36 ;;
  }


  dimension: context_traits_57 {
    label: "Context Traits 57"
    description: "The Context Traits 57 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_57 ;;
  }


  dimension: context_traits_0 {
    label: "Context Traits 0"
    description: "The Context Traits 0 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_0 ;;
  }


  dimension: context_traits_42 {
    label: "Context Traits 42"
    description: "The Context Traits 42 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_42 ;;
  }


  dimension: context_traits_46 {
    label: "Context Traits 46"
    description: "The Context Traits 46 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_46 ;;
  }


  dimension: context_traits_52 {
    label: "Context Traits 52"
    description: "The Context Traits 52 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_52 ;;
  }


  dimension: context_traits_25 {
    label: "Context Traits 25"
    description: "The Context Traits 25 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_25 ;;
  }


  dimension: context_traits_43 {
    label: "Context Traits 43"
    description: "The Context Traits 43 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_43 ;;
  }


  dimension: context_traits_48 {
    label: "Context Traits 48"
    description: "The Context Traits 48 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_48 ;;
  }


  dimension: context_traits_7 {
    label: "Context Traits 7"
    description: "The Context Traits 7 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_7 ;;
  }


  dimension: context_traits_18 {
    label: "Context Traits 18"
    description: "The Context Traits 18 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_18 ;;
  }


  dimension: context_traits_8 {
    label: "Context Traits 8"
    description: "The Context Traits 8 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_8 ;;
  }


  dimension: context_traits_49 {
    label: "Context Traits 49"
    description: "The Context Traits 49 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_49 ;;
  }


  dimension: warnmetricid {
    label: "Warnmetricid"
    description: "The Warnmetricid of the instance (or user)."
    type: string
    sql: ${TABLE}.warnmetricid ;;
  }


  dimension: metric {
    label: "Metric"
    description: "The Metric of the instance (or user)."
    type: string
    sql: ${TABLE}.metric ;;
  }


  dimension: error {
    label: "Error"
    description: "The Error of the instance (or user)."
    type: string
    sql: ${TABLE}.error ;;
  }


  dimension: num_invitations_sent {
    label: "Num Invitations Sent"
    description: "The Num Invitations Sent of the instance (or user)."
    type: string
    sql: ${TABLE}.num_invitations_sent ;;
  }


  dimension: num_invitations {
    label: "Num Invitations"
    description: "The Num Invitations of the instance."
    type: string
    sql: ${TABLE}.num_invitations ;;
  }



  dimension: channel_sidebar {
    label: "Channel Sidebar"
    description: "Indicates Channel Sidebar is marked true/enabled."
    type: yesno
    sql: ${TABLE}.channel_sidebar ;;
  }



  dimension: app {
    label: "App"
    description: "The App of the instance (or user)."
    type: string
    sql: ${TABLE}.app ;;
  }


  dimension: method {
    label: "Method"
    description: "The Method of the instance (or user)."
    type: string
    sql: ${TABLE}.method ;;
  }


  dimension: remaining {
    label: "Remaining"
    description: "The Remaining of the instance."
    type: string
    sql: ${TABLE}.remaining ;;
  }



  dimension: screen {
    label: "Screen"
    description: "The Screen of the instance (or user)."
    type: string
    sql: ${TABLE}.screen ;;
  }


  dimension: filter {
    label: "Filter"
    description: "The Filter of the instance (or user)."
    type: string
    sql: ${TABLE}.filter ;;
  }


  dimension: context_campaign_name {
    label: "Context Campaign Name"
    description: "The Context Campaign Name of the instance (or user)."
    type: string
    sql: ${TABLE}.context_campaign_name ;;
  }


  dimension: context_campaign_source {
    label: "Context Campaign Source"
    description: "The Context Campaign Source of the instance (or user)."
    type: string
    sql: ${TABLE}.context_campaign_source ;;
  }


  dimension: context_campaign_medium {
    label: "Context Campaign Medium"
    description: "The Context Campaign Medium of the instance (or user)."
    type: string
    sql: ${TABLE}.context_campaign_medium ;;
  }


  dimension: context_campaign_content {
    label: "Context Campaign Content"
    description: "The Context Campaign Content of the instance (or user)."
    type: string
    sql: ${TABLE}.context_campaign_content ;;
  }


  dimension: context_passed_ip {
    label: "Context Passed Ip"
    description: "The Context Passed Ip of the instance (or user)."
    type: string
    sql: ${TABLE}.context_passed_ip ;;
  }


  dimension: context_request_ip {
    label: "Context Request Ip"
    description: "The Context Request Ip of the instance (or user)."
    type: string
    sql: ${TABLE}.context_request_ip ;;
  }


  dimension: context_user_agent {
    label: "Context User Agent"
    description: "The Context User Agent of the instance (or user)."
    type: string
    sql: ${TABLE}.context_user_agent ;;
  }


  dimension: channels_ids {
    label: "Channels Ids"
    description: "The Channels Ids of the instance (or user)."
    type: string
    sql: ${TABLE}.channels_ids ;;
  }


  dimension: context_page_referring_domain {
    label: "Context Page Referring Domain"
    description: "The Context Page Referring Domain of the instance (or user)."
    type: string
    sql: ${TABLE}.context_page_referring_domain ;;
  }


  dimension: context_app_where {
    label: "Context App Where"
    description: "The Context App Where of the instance (or user)."
    type: string
    sql: ${TABLE}.context_app_where ;;
  }


  dimension: context_where {
    label: "Context Where"
    description: "The Context Where of the instance (or user)."
    type: string
    sql: ${TABLE}.context_where ;;
  }


  dimension: context_page_where {
    label: "Context Page Where"
    description: "The Context Page Where of the instance (or user)."
    type: string
    sql: ${TABLE}.context_page_where ;;
  }


  dimension: context_campaign_where {
    label: "Context Campaign Where"
    description: "The Context Campaign Where of the instance (or user)."
    type: string
    sql: ${TABLE}.context_campaign_where ;;
  }


  dimension: context_screen_where {
    label: "Context Screen Where"
    description: "The Context Screen Where of the instance (or user)."
    type: string
    sql: ${TABLE}.context_screen_where ;;
  }


  dimension: context_library_where {
    label: "Context Library Where"
    description: "The Context Library Where of the instance (or user)."
    type: string
    sql: ${TABLE}.context_library_where ;;
  }


  dimension: context_os_where {
    label: "Context Os Where"
    description: "The Context Os Where of the instance (or user)."
    type: string
    sql: ${TABLE}.context_os_where ;;
  }


  dimension: _where {
    label: " Where"
    description: "The  Where of the instance (or user)."
    type: string
    sql: ${TABLE}._where ;;
  }


  dimension: context_traits_where {
    label: "Context Traits Where"
    description: "The Context Traits Where of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_where ;;
  }


  dimension: context_page_initial_referrer {
    label: "Context Page Initial Referrer"
    description: "The Context Page Initial Referrer of the instance (or user)."
    type: string
    sql: ${TABLE}.context_page_initial_referrer ;;
  }


  dimension: context_page_initial_referring_domain {
    label: "Context Page Initial Referring Domain"
    description: "The Context Page Initial Referring Domain of the instance (or user)."
    type: string
    sql: ${TABLE}.context_page_initial_referring_domain ;;
  }


  dimension: context_page_tab_url {
    label: "Context Page Tab Url"
    description: "The Context Page Tab Url of the instance (or user)."
    type: string
    sql: ${TABLE}.context_page_tab_url ;;
  }


  dimension: warn_metric_id {
    label: "Warn Metric Id"
    description: "The Warn Metric Id of the instance (or user)."
    type: string
    sql: ${TABLE}.warn_metric_id ;;
  }


  dimension: context_traits_60 {
    label: "Context Traits 60"
    description: "The Context Traits 60 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_60 ;;
  }


  dimension: context_traits_101 {
    label: "Context Traits 101"
    description: "The Context Traits 101 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_101 ;;
  }


  dimension: context_traits_77 {
    label: "Context Traits 77"
    description: "The Context Traits 77 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_77 ;;
  }


  dimension: context_traits_107 {
    label: "Context Traits 107"
    description: "The Context Traits 107 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_107 ;;
  }


  dimension: context_traits_90 {
    label: "Context Traits 90"
    description: "The Context Traits 90 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_90 ;;
  }


  dimension: context_traits_70 {
    label: "Context Traits 70"
    description: "The Context Traits 70 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_70 ;;
  }


  dimension: context_traits_88 {
    label: "Context Traits 88"
    description: "The Context Traits 88 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_88 ;;
  }


  dimension: context_traits_117 {
    label: "Context Traits 117"
    description: "The Context Traits 117 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_117 ;;
  }


  dimension: context_traits_65 {
    label: "Context Traits 65"
    description: "The Context Traits 65 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_65 ;;
  }


  dimension: context_traits_111 {
    label: "Context Traits 111"
    description: "The Context Traits 111 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_111 ;;
  }


  dimension: context_traits_95 {
    label: "Context Traits 95"
    description: "The Context Traits 95 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_95 ;;
  }


  dimension: context_traits_119 {
    label: "Context Traits 119"
    description: "The Context Traits 119 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_119 ;;
  }


  dimension: context_traits_86 {
    label: "Context Traits 86"
    description: "The Context Traits 86 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_86 ;;
  }


  dimension: context_traits_94 {
    label: "Context Traits 94"
    description: "The Context Traits 94 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_94 ;;
  }


  dimension: context_traits_96 {
    label: "Context Traits 96"
    description: "The Context Traits 96 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_96 ;;
  }


  dimension: context_traits_118 {
    label: "Context Traits 118"
    description: "The Context Traits 118 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_118 ;;
  }


  dimension: context_traits_93 {
    label: "Context Traits 93"
    description: "The Context Traits 93 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_93 ;;
  }


  dimension: context_traits_102 {
    label: "Context Traits 102"
    description: "The Context Traits 102 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_102 ;;
  }


  dimension: context_traits_105 {
    label: "Context Traits 105"
    description: "The Context Traits 105 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_105 ;;
  }


  dimension: context_traits_99 {
    label: "Context Traits 99"
    description: "The Context Traits 99 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_99 ;;
  }


  dimension: context_traits_84 {
    label: "Context Traits 84"
    description: "The Context Traits 84 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_84 ;;
  }


  dimension: context_traits_66 {
    label: "Context Traits 66"
    description: "The Context Traits 66 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_66 ;;
  }


  dimension: context_traits_120 {
    label: "Context Traits 120"
    description: "The Context Traits 120 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_120 ;;
  }


  dimension: context_traits_103 {
    label: "Context Traits 103"
    description: "The Context Traits 103 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_103 ;;
  }


  dimension: context_traits_76 {
    label: "Context Traits 76"
    description: "The Context Traits 76 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_76 ;;
  }


  dimension: context_traits_91 {
    label: "Context Traits 91"
    description: "The Context Traits 91 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_91 ;;
  }


  dimension: context_traits_68 {
    label: "Context Traits 68"
    description: "The Context Traits 68 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_68 ;;
  }


  dimension: context_traits_67 {
    label: "Context Traits 67"
    description: "The Context Traits 67 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_67 ;;
  }


  dimension: context_traits_115 {
    label: "Context Traits 115"
    description: "The Context Traits 115 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_115 ;;
  }


  dimension: context_traits_85 {
    label: "Context Traits 85"
    description: "The Context Traits 85 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_85 ;;
  }


  dimension: context_traits_58 {
    label: "Context Traits 58"
    description: "The Context Traits 58 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_58 ;;
  }


  dimension: context_traits_87 {
    label: "Context Traits 87"
    description: "The Context Traits 87 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_87 ;;
  }


  dimension: context_traits_63 {
    label: "Context Traits 63"
    description: "The Context Traits 63 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_63 ;;
  }


  dimension: context_traits_112 {
    label: "Context Traits 112"
    description: "The Context Traits 112 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_112 ;;
  }


  dimension: context_traits_61 {
    label: "Context Traits 61"
    description: "The Context Traits 61 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_61 ;;
  }


  dimension: context_traits_64 {
    label: "Context Traits 64"
    description: "The Context Traits 64 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_64 ;;
  }


  dimension: context_traits_81 {
    label: "Context Traits 81"
    description: "The Context Traits 81 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_81 ;;
  }


  dimension: context_traits_104 {
    label: "Context Traits 104"
    description: "The Context Traits 104 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_104 ;;
  }


  dimension: context_traits_83 {
    label: "Context Traits 83"
    description: "The Context Traits 83 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_83 ;;
  }


  dimension: context_traits_79 {
    label: "Context Traits 79"
    description: "The Context Traits 79 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_79 ;;
  }


  dimension: context_traits_78 {
    label: "Context Traits 78"
    description: "The Context Traits 78 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_78 ;;
  }


  dimension: context_traits_69 {
    label: "Context Traits 69"
    description: "The Context Traits 69 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_69 ;;
  }


  dimension: context_traits_92 {
    label: "Context Traits 92"
    description: "The Context Traits 92 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_92 ;;
  }


  dimension: context_traits_113 {
    label: "Context Traits 113"
    description: "The Context Traits 113 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_113 ;;
  }


  dimension: context_traits_62 {
    label: "Context Traits 62"
    description: "The Context Traits 62 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_62 ;;
  }


  dimension: context_traits_80 {
    label: "Context Traits 80"
    description: "The Context Traits 80 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_80 ;;
  }


  dimension: context_traits_82 {
    label: "Context Traits 82"
    description: "The Context Traits 82 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_82 ;;
  }


  dimension: context_traits_72 {
    label: "Context Traits 72"
    description: "The Context Traits 72 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_72 ;;
  }


  dimension: context_traits_109 {
    label: "Context Traits 109"
    description: "The Context Traits 109 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_109 ;;
  }


  dimension: context_traits_100 {
    label: "Context Traits 100"
    description: "The Context Traits 100 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_100 ;;
  }


  dimension: context_traits_75 {
    label: "Context Traits 75"
    description: "The Context Traits 75 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_75 ;;
  }


  dimension: context_traits_73 {
    label: "Context Traits 73"
    description: "The Context Traits 73 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_73 ;;
  }


  dimension: context_traits_121 {
    label: "Context Traits 121"
    description: "The Context Traits 121 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_121 ;;
  }


  dimension: context_traits_74 {
    label: "Context Traits 74"
    description: "The Context Traits 74 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_74 ;;
  }


  dimension: context_traits_106 {
    label: "Context Traits 106"
    description: "The Context Traits 106 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_106 ;;
  }


  dimension: context_traits_108 {
    label: "Context Traits 108"
    description: "The Context Traits 108 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_108 ;;
  }


  dimension: context_traits_110 {
    label: "Context Traits 110"
    description: "The Context Traits 110 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_110 ;;
  }


  dimension: context_traits_98 {
    label: "Context Traits 98"
    description: "The Context Traits 98 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_98 ;;
  }


  dimension: context_traits_97 {
    label: "Context Traits 97"
    description: "The Context Traits 97 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_97 ;;
  }


  dimension: context_traits_114 {
    label: "Context Traits 114"
    description: "The Context Traits 114 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_114 ;;
  }


  dimension: context_traits_89 {
    label: "Context Traits 89"
    description: "The Context Traits 89 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_89 ;;
  }


  dimension: context_traits_59 {
    label: "Context Traits 59"
    description: "The Context Traits 59 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_59 ;;
  }


  dimension: context_traits_116 {
    label: "Context Traits 116"
    description: "The Context Traits 116 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_116 ;;
  }


  dimension: context_traits_71 {
    label: "Context Traits 71"
    description: "The Context Traits 71 of the instance (or user)."
    type: string
    sql: ${TABLE}.context_traits_71 ;;
  }


  dimension: app_id {
    label: "App Id"
    description: "The App Id of the instance (or user)."
    type: string
    sql: ${TABLE}.app_id ;;
  }


  dimension: context_campaign_term {
    label: "Context Campaign Term"
    description: "The Context Campaign Term of the instance (or user)."
    type: string
    sql: ${TABLE}.context_campaign_term ;;
  }


  dimension: context_screen_width {
    label: "Context Screen Width"
    description: "The Context Screen Width of the instance."
    type: string
    sql: ${TABLE}.context_screen_width ;;
  }



  dimension: context_screen_height {
    label: "Context Screen Height"
    description: "The Context Screen Height of the instance."
    type: string
    sql: ${TABLE}.context_screen_height ;;
  }



  dimension: context_screen_inner_width {
    label: "Context Screen Inner Width"
    description: "The Context Screen Inner Width of the instance."
    type: string
    sql: ${TABLE}.context_screen_inner_width ;;
  }



  dimension: context_screen_inner_height {
    label: "Context Screen Inner Height"
    description: "The Context Screen Inner Height of the instance."
    type: string
    sql: ${TABLE}.context_screen_inner_height ;;
  }



  dimension: context_campaign_referrer {
    label: "Context Campaign Referrer"
    description: "The Context Campaign Referrer of the instance (or user)."
    type: string
    sql: ${TABLE}.context_campaign_referrer ;;
  }


  dimension: context_scregn_density {
    label: "Context Scregn Density"
    description: "The Context Scregn Density of the instance."
    type: string
    sql: ${TABLE}.context_scregn_density ;;
  }



  dimension: context_destination_id {
    label: "Context Destination Id"
    description: "The Context Destination Id of the instance (or user)."
    type: string
    sql: ${TABLE}.context_destination_id ;;
  }


  dimension: context_source_type {
    label: "Context Source Type"
    description: "The Context Source Type of the instance (or user)."
    type: string
    sql: ${TABLE}.context_source_type ;;
  }


  dimension: context_source_id {
    label: "Context Source Id"
    description: "The Context Source Id of the instance (or user)."
    type: string
    sql: ${TABLE}.context_source_id ;;
  }


  dimension: context_destination_type {
    label: "Context Destination Type"
    description: "The Context Destination Type of the instance (or user)."
    type: string
    sql: ${TABLE}.context_destination_type ;;
  }


### DATES & TIMESTAMPS



  dimension_group: original_timestamp {
    label: "Original Timestamp"
    type: time
    timeframes: [time, hour_of_day, hour6, date, week, month, year, fiscal_quarter, fiscal_year, day_of_week, fiscal_month_num,
    week_of_year, day_of_year, day_of_week_index, month_name, day_of_month, fiscal_quarter_of_year]
    sql: ${TABLE}.original_timestamp::date ;;
    
    hidden: yes
  } 



  dimension_group: sent_at {
    label: "Sent At"
    type: time
    timeframes: [time, hour_of_day, hour6, date, week, month, year, fiscal_quarter, fiscal_year, day_of_week, fiscal_month_num,
    week_of_year, day_of_year, day_of_week_index, month_name, day_of_month, fiscal_quarter_of_year]
    sql: ${TABLE}.sent_at::date ;;
    
    hidden: yes
  } 



  dimension_group: uuid_ts {
    label: "Uuid Ts"
    type: time
    timeframes: [time, hour_of_day, hour6, date, week, month, year, fiscal_quarter, fiscal_year, day_of_week, fiscal_month_num,
    week_of_year, day_of_year, day_of_week_index, month_name, day_of_month, fiscal_quarter_of_year]
    sql: ${TABLE}.uuid_ts::date ;;
    
    hidden: yes
  } 



  dimension_group: timestamp {
    label: "Timestamp"
    type: time
    timeframes: [time, hour_of_day, hour6, date, week, month, year, fiscal_quarter, fiscal_year, day_of_week, fiscal_month_num,
    week_of_year, day_of_year, day_of_week_index, month_name, day_of_month, fiscal_quarter_of_year]
    sql: ${TABLE}.timestamp::date ;;
    
  } 



  dimension_group: received_at {
    label: "Received At"
    type: time
    timeframes: [time, hour_of_day, hour6, date, week, month, year, fiscal_quarter, fiscal_year, day_of_week, fiscal_month_num,
    week_of_year, day_of_year, day_of_week_index, month_name, day_of_month, fiscal_quarter_of_year]
    sql: ${TABLE}.received_at::date ;;
    
    hidden: yes
  } 



### MEASURES



  measure: user_actual_id_count {
    group_label: "User_Actual Counts"
    label: "User Actual Id Count"
    description: "The distinct count of User Actual Id's within the grouping."
    type: count_distinct
    sql: ${user_actual_id} ;;
  }



  measure: channel_id_count {
    group_label: "Channel Counts"
    label: "Channel Id Count"
    description: "The distinct count of Channel Id's within the grouping."
    type: count_distinct
    sql: ${channel_id} ;;
  }



  measure: context_screen_density_sum {
    group_label: "Context Screen Density Measures"
    label: "Context Screen Density (Sum)"
    description: "The sum of Context Screen Density across all instances within the grouping."
    type: sum
    sql: ${context_screen_density} ;;
  }

  measure: context_screen_density_avg {
    group_label: "Context Screen Density Measures"
    label: "Context Screen Density (Avg)"
    description: "The average Context Screen Density across all instances within the grouping."
    type: average
    sql: ${context_screen_density} ;;
  }

  measure: context_screen_density_median {
    group_label: "Context Screen Density Measures"
    label: "Context Screen Density (Med)"
    description: "The median Context Screen Density across all instances within the grouping."
    type: median
    sql: ${context_screen_density} ;;
  }



  measure: duration_sum {
    group_label: "Duration Measures"
    label: "Duration (Sum)"
    description: "The sum of Duration across all instances within the grouping."
    type: sum
    sql: ${duration} ;;
  }

  measure: duration_avg {
    group_label: "Duration Measures"
    label: "Duration (Avg)"
    description: "The average Duration across all instances within the grouping."
    type: average
    sql: ${duration} ;;
  }

  measure: duration_median {
    group_label: "Duration Measures"
    label: "Duration (Med)"
    description: "The median Duration across all instances within the grouping."
    type: median
    sql: ${duration} ;;
  }



  measure: user_id_count {
    group_label: "Instance Counts"
    label: "User Id Count"
    description: "The distinct count of User Id's within the grouping."
    type: count_distinct
    sql: ${user_id} ;;
  }



  measure: root_id_count {
    group_label: "Root Counts"
    label: "Root Id Count"
    description: "The distinct count of Root Id's within the grouping."
    type: count_distinct
    sql: ${root_id} ;;
  }



  measure: post_id_count {
    group_label: "Post Counts"
    label: "Post Id Count"
    description: "The distinct count of Post Id's within the grouping."
    type: count_distinct
    sql: ${post_id} ;;
  }



  measure: team_id_count {
    group_label: "Team Counts"
    label: "Team Id Count"
    description: "The distinct count of Team Id's within the grouping."
    type: count_distinct
    sql: ${team_id} ;;
  }



  measure: userid_count {
    group_label: "Instance Counts"
    label: "Userid Count"
    description: "The distinct count of Userid's within the grouping."
    type: count_distinct
    sql: ${userid} ;;
  }



  measure: count_sum {
    group_label: "Count Measures"
    label: "Count (Sum)"
    description: "The sum of Count across all instances within the grouping."
    type: sum
    sql: ${count} ;;
  }

  measure: count_avg {
    group_label: "Count Measures"
    label: "Count (Avg)"
    description: "The average Count across all instances within the grouping."
    type: average
    sql: ${count} ;;
  }

  measure: count_median {
    group_label: "Count Measures"
    label: "Count (Med)"
    description: "The median Count across all instances within the grouping."
    type: median
    sql: ${count} ;;
  }



  measure: plugin_id_count {
    group_label: "Plugin Counts"
    label: "Plugin Id Count"
    description: "The distinct count of Plugin Id's within the grouping."
    type: count_distinct
    sql: ${plugin_id} ;;
  }



  measure: channel_ids_0_count {
    group_label: "Channel Countss_0"
    label: "Channel Ids 0 Count"
    description: "The distinct count of Channel Ids 0's within the grouping."
    type: count_distinct
    sql: ${channel_ids_0} ;;
  }



  measure: channel_ids_1_count {
    group_label: "Channel Countss_1"
    label: "Channel Ids 1 Count"
    description: "The distinct count of Channel Ids 1's within the grouping."
    type: count_distinct
    sql: ${channel_ids_1} ;;
  }



  measure: scheme_id_count {
    group_label: "Scheme Counts"
    label: "Scheme Id Count"
    description: "The distinct count of Scheme Id's within the grouping."
    type: count_distinct
    sql: ${scheme_id} ;;
  }



  measure: channel_ids_2_count {
    group_label: "Channel Countss_2"
    label: "Channel Ids 2 Count"
    description: "The distinct count of Channel Ids 2's within the grouping."
    type: count_distinct
    sql: ${channel_ids_2} ;;
  }



  measure: channel_ids_count {
    group_label: "Channel Countss"
    label: "Channel Ids Count"
    description: "The distinct count of Channel Ids's within the grouping."
    type: count_distinct
    sql: ${channel_ids} ;;
  }



  measure: context_terminators_lastindex_sum {
    group_label: "Context Terminators Lastindex Measures"
    label: "Context Terminators Lastindex (Sum)"
    description: "The sum of Context Terminators Lastindex across all instances within the grouping."
    type: sum
    sql: ${context_terminators_lastindex} ;;
  }

  measure: context_terminators_lastindex_avg {
    group_label: "Context Terminators Lastindex Measures"
    label: "Context Terminators Lastindex (Avg)"
    description: "The average Context Terminators Lastindex across all instances within the grouping."
    type: average
    sql: ${context_terminators_lastindex} ;;
  }

  measure: context_terminators_lastindex_median {
    group_label: "Context Terminators Lastindex Measures"
    label: "Context Terminators Lastindex (Med)"
    description: "The median Context Terminators Lastindex across all instances within the grouping."
    type: median
    sql: ${context_terminators_lastindex} ;;
  }



  measure: context_relevance_sum {
    group_label: "Context Relevance Measures"
    label: "Context Relevance (Sum)"
    description: "The sum of Context Relevance across all instances within the grouping."
    type: sum
    sql: ${context_relevance} ;;
  }

  measure: context_relevance_avg {
    group_label: "Context Relevance Measures"
    label: "Context Relevance (Avg)"
    description: "The average Context Relevance across all instances within the grouping."
    type: average
    sql: ${context_relevance} ;;
  }

  measure: context_relevance_median {
    group_label: "Context Relevance Measures"
    label: "Context Relevance (Med)"
    description: "The median Context Relevance across all instances within the grouping."
    type: median
    sql: ${context_relevance} ;;
  }



  measure: num_invitations_sum {
    group_label: "Num Invitations Measures"
    label: "Num Invitations (Sum)"
    description: "The sum of Num Invitations across all instances within the grouping."
    type: sum
    sql: ${num_invitations} ;;
  }

  measure: num_invitations_avg {
    group_label: "Num Invitations Measures"
    label: "Num Invitations (Avg)"
    description: "The average Num Invitations across all instances within the grouping."
    type: average
    sql: ${num_invitations} ;;
  }

  measure: num_invitations_median {
    group_label: "Num Invitations Measures"
    label: "Num Invitations (Med)"
    description: "The median Num Invitations across all instances within the grouping."
    type: median
    sql: ${num_invitations} ;;
  }



  measure: remaining_sum {
    group_label: "Remaining Measures"
    label: "Remaining (Sum)"
    description: "The sum of Remaining across all instances within the grouping."
    type: sum
    sql: ${remaining} ;;
  }

  measure: remaining_avg {
    group_label: "Remaining Measures"
    label: "Remaining (Avg)"
    description: "The average Remaining across all instances within the grouping."
    type: average
    sql: ${remaining} ;;
  }

  measure: remaining_median {
    group_label: "Remaining Measures"
    label: "Remaining (Med)"
    description: "The median Remaining across all instances within the grouping."
    type: median
    sql: ${remaining} ;;
  }



  measure: channels_ids_count {
    group_label: "Channels Countss"
    label: "Channels Ids Count"
    description: "The distinct count of Channels Ids's within the grouping."
    type: count_distinct
    sql: ${channels_ids} ;;
  }



  measure: warn_metric_id_count {
    group_label: "Warn_Metric Counts"
    label: "Warn Metric Id Count"
    description: "The distinct count of Warn Metric Id's within the grouping."
    type: count_distinct
    sql: ${warn_metric_id} ;;
  }



  measure: app_id_count {
    group_label: "App Counts"
    label: "App Id Count"
    description: "The distinct count of App Id's within the grouping."
    type: count_distinct
    sql: ${app_id} ;;
  }



  measure: context_screen_width_sum {
    group_label: "Context Screen Width Measures"
    label: "Context Screen Width (Sum)"
    description: "The sum of Context Screen Width across all instances within the grouping."
    type: sum
    sql: ${context_screen_width} ;;
  }

  measure: context_screen_width_avg {
    group_label: "Context Screen Width Measures"
    label: "Context Screen Width (Avg)"
    description: "The average Context Screen Width across all instances within the grouping."
    type: average
    sql: ${context_screen_width} ;;
  }

  measure: context_screen_width_median {
    group_label: "Context Screen Width Measures"
    label: "Context Screen Width (Med)"
    description: "The median Context Screen Width across all instances within the grouping."
    type: median
    sql: ${context_screen_width} ;;
  }



  measure: context_screen_height_sum {
    group_label: "Context Screen Height Measures"
    label: "Context Screen Height (Sum)"
    description: "The sum of Context Screen Height across all instances within the grouping."
    type: sum
    sql: ${context_screen_height} ;;
  }

  measure: context_screen_height_avg {
    group_label: "Context Screen Height Measures"
    label: "Context Screen Height (Avg)"
    description: "The average Context Screen Height across all instances within the grouping."
    type: average
    sql: ${context_screen_height} ;;
  }

  measure: context_screen_height_median {
    group_label: "Context Screen Height Measures"
    label: "Context Screen Height (Med)"
    description: "The median Context Screen Height across all instances within the grouping."
    type: median
    sql: ${context_screen_height} ;;
  }



  measure: context_screen_inner_width_sum {
    group_label: "Context Screen Inner Width Measures"
    label: "Context Screen Inner Width (Sum)"
    description: "The sum of Context Screen Inner Width across all instances within the grouping."
    type: sum
    sql: ${context_screen_inner_width} ;;
  }

  measure: context_screen_inner_width_avg {
    group_label: "Context Screen Inner Width Measures"
    label: "Context Screen Inner Width (Avg)"
    description: "The average Context Screen Inner Width across all instances within the grouping."
    type: average
    sql: ${context_screen_inner_width} ;;
  }

  measure: context_screen_inner_width_median {
    group_label: "Context Screen Inner Width Measures"
    label: "Context Screen Inner Width (Med)"
    description: "The median Context Screen Inner Width across all instances within the grouping."
    type: median
    sql: ${context_screen_inner_width} ;;
  }



  measure: context_screen_inner_height_sum {
    group_label: "Context Screen Inner Height Measures"
    label: "Context Screen Inner Height (Sum)"
    description: "The sum of Context Screen Inner Height across all instances within the grouping."
    type: sum
    sql: ${context_screen_inner_height} ;;
  }

  measure: context_screen_inner_height_avg {
    group_label: "Context Screen Inner Height Measures"
    label: "Context Screen Inner Height (Avg)"
    description: "The average Context Screen Inner Height across all instances within the grouping."
    type: average
    sql: ${context_screen_inner_height} ;;
  }

  measure: context_screen_inner_height_median {
    group_label: "Context Screen Inner Height Measures"
    label: "Context Screen Inner Height (Med)"
    description: "The median Context Screen Inner Height across all instances within the grouping."
    type: median
    sql: ${context_screen_inner_height} ;;
  }



  measure: context_scregn_density_sum {
    group_label: "Context Scregn Density Measures"
    label: "Context Scregn Density (Sum)"
    description: "The sum of Context Scregn Density across all instances within the grouping."
    type: sum
    sql: ${context_scregn_density} ;;
  }

  measure: context_scregn_density_avg {
    group_label: "Context Scregn Density Measures"
    label: "Context Scregn Density (Avg)"
    description: "The average Context Scregn Density across all instances within the grouping."
    type: average
    sql: ${context_scregn_density} ;;
  }

  measure: context_scregn_density_median {
    group_label: "Context Scregn Density Measures"
    label: "Context Scregn Density (Med)"
    description: "The median Context Scregn Density across all instances within the grouping."
    type: median
    sql: ${context_scregn_density} ;;
  }



  measure: context_destination_id_count {
    group_label: "Context_Destination Counts"
    label: "Context Destination Id Count"
    description: "The distinct count of Context Destination Id's within the grouping."
    type: count_distinct
    sql: ${context_destination_id} ;;
  }



  measure: context_source_id_count {
    group_label: "Context_Source Counts"
    label: "Context Source Id Count"
    description: "The distinct count of Context Source Id's within the grouping."
    type: count_distinct
    sql: ${context_source_id} ;;
  }



    
    }
    