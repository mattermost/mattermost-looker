---
- dashboard: ingestion_cost_analysis
  title: Ingestion Cost Analysis
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: vaoLnxA3psBCOga7y5erPB
  elements:
  - title: TRANSFORM_XS
    name: TRANSFORM_XS
    model: snowflake_usage_block
    explore: query_history
    type: looker_column
    fields: [query_history.start_date, total_query_cost, query_history.query_type]
    pivots: [query_history.query_type]
    filters:
      query_history.warehouse_name: '"TRANSFORM_XS"'
      query_history.user_name: RUDDERSTACK,"RUDDERSTACK_BOT"
    sorts: [query_history.start_date desc, query_history.query_type]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      expression: |-
        case(
          when(${query_history.warehouse_size} = "X-Small", 1),
        when(${query_history.warehouse_size} = "Small", 2),
        when(${query_history.warehouse_size} = "Medium", 4),
        when(${query_history.warehouse_size} = "Large", 8),
        when(${query_history.warehouse_size} = "X-Large", 16),
        when(${query_history.warehouse_size} = "2X-Large", 32),
        when(${query_history.warehouse_size} = "3X-Large", 64),
        when(${query_history.warehouse_size} = "4X-Large", 128),
        null
        )
      label: Warehouse Credits
      value_format:
      value_format_name:
      dimension: warehouse_credits
      _kind_hint: dimension
      _type_hint: number
    - category: dimension
      expression: "(${query_history.execution_time} / (1000*60*60))*${warehouse_credits}"
      label: Query cost
      value_format:
      value_format_name:
      dimension: query_cost
      _kind_hint: dimension
      _type_hint: number
    - category: measure
      expression:
      label: Total Query Cost
      value_format:
      value_format_name:
      based_on: query_cost
      _kind_hint: measure
      measure: total_query_cost
      type: sum
      _type_hint: number
    - category: dimension
      expression: |-
        case(
          when(contains(lower(${query_history.query_text}), "dbt_cloud_pr_"), "pull-request"),
        when(contains(lower(${query_history.query_text}), "stg_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), ".stg_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), "int_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), ".int_" ), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), "fct_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), ".fct_" ), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), "rpt_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), ".rpt_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), "bdg_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), ".bdg_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), "grp_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), ".grp_"), "mattermost-analytics"),
        "snowflake-dbt"
        )
      label: DBT Project
      value_format:
      value_format_name:
      dimension: dbt_project
      _kind_hint: dimension
      _type_hint: string
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Start Date: query_history.start_date
    row: 3
    col: 0
    width: 12
    height: 6
  - title: STITCH
    name: STITCH
    model: snowflake_usage_block
    explore: query_history
    type: looker_column
    fields: [query_history.start_date, total_query_cost, query_history.query_type]
    pivots: [query_history.query_type]
    filters:
      query_history.warehouse_name: STITCH
      query_history.user_name: RUDDERSTACK,"RUDDERSTACK_BOT"
    sorts: [query_history.start_date desc, query_history.query_type]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      expression: |-
        case(
          when(${query_history.warehouse_size} = "X-Small", 1),
        when(${query_history.warehouse_size} = "Small", 2),
        when(${query_history.warehouse_size} = "Medium", 4),
        when(${query_history.warehouse_size} = "Large", 8),
        when(${query_history.warehouse_size} = "X-Large", 16),
        when(${query_history.warehouse_size} = "2X-Large", 32),
        when(${query_history.warehouse_size} = "3X-Large", 64),
        when(${query_history.warehouse_size} = "4X-Large", 128),
        null
        )
      label: Warehouse Credits
      value_format:
      value_format_name:
      dimension: warehouse_credits
      _kind_hint: dimension
      _type_hint: number
    - category: dimension
      expression: "(${query_history.execution_time} / (1000*60*60))*${warehouse_credits}"
      label: Query cost
      value_format:
      value_format_name:
      dimension: query_cost
      _kind_hint: dimension
      _type_hint: number
    - category: measure
      expression:
      label: Total Query Cost
      value_format:
      value_format_name:
      based_on: query_cost
      _kind_hint: measure
      measure: total_query_cost
      type: sum
      _type_hint: number
    - category: dimension
      expression: |-
        case(
          when(contains(lower(${query_history.query_text}), "dbt_cloud_pr_"), "pull-request"),
        when(contains(lower(${query_history.query_text}), "stg_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), ".stg_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), "int_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), ".int_" ), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), "fct_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), ".fct_" ), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), "rpt_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), ".rpt_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), "bdg_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), ".bdg_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), "grp_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), ".grp_"), "mattermost-analytics"),
        "snowflake-dbt"
        )
      label: DBT Project
      value_format:
      value_format_name:
      dimension: dbt_project
      _kind_hint: dimension
      _type_hint: string
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Start Date: query_history.start_date
    row: 3
    col: 12
    width: 12
    height: 6
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      ---

      # Rudderstack

      ---

      Rudderstack total query cost per warehouse.
    row: 0
    col: 0
    width: 24
    height: 3
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      ---

      # Stitch

      ---

      Total query cost per warehouse for ingestion driven by Stitch.
    row: 17
    col: 0
    width: 24
    height: 3
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      ---

      # Custom Ingestion

      ---

      Total query cost per warehouse for custom ingestion scripts triggered via airflow.
    row: 26
    col: 0
    width: 24
    height: 3
  - title: STITCH
    name: STITCH (2)
    model: snowflake_usage_block
    explore: query_history
    type: looker_column
    fields: [query_history.start_date, total_query_cost, query_history.user_name]
    pivots: [query_history.user_name]
    filters:
      query_history.warehouse_name: STITCH
      query_history.user_name: STITCH,"STITCH_RAW"
    sorts: [query_history.start_date desc, query_history.user_name]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      expression: |-
        case(
          when(${query_history.warehouse_size} = "X-Small", 1),
        when(${query_history.warehouse_size} = "Small", 2),
        when(${query_history.warehouse_size} = "Medium", 4),
        when(${query_history.warehouse_size} = "Large", 8),
        when(${query_history.warehouse_size} = "X-Large", 16),
        when(${query_history.warehouse_size} = "2X-Large", 32),
        when(${query_history.warehouse_size} = "3X-Large", 64),
        when(${query_history.warehouse_size} = "4X-Large", 128),
        null
        )
      label: Warehouse Credits
      value_format:
      value_format_name:
      dimension: warehouse_credits
      _kind_hint: dimension
      _type_hint: number
    - category: dimension
      expression: "(${query_history.execution_time} / (1000*60*60))*${warehouse_credits}"
      label: Query cost
      value_format:
      value_format_name:
      dimension: query_cost
      _kind_hint: dimension
      _type_hint: number
    - category: measure
      expression:
      label: Total Query Cost
      value_format:
      value_format_name:
      based_on: query_cost
      _kind_hint: measure
      measure: total_query_cost
      type: sum
      _type_hint: number
    - category: dimension
      expression: |-
        case(
          when(contains(lower(${query_history.query_text}), "dbt_cloud_pr_"), "pull-request"),
        when(contains(lower(${query_history.query_text}), "stg_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), ".stg_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), "int_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), ".int_" ), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), "fct_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), ".fct_" ), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), "rpt_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), ".rpt_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), "bdg_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), ".bdg_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), "grp_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), ".grp_"), "mattermost-analytics"),
        "snowflake-dbt"
        )
      label: DBT Project
      value_format:
      value_format_name:
      dimension: dbt_project
      _kind_hint: dimension
      _type_hint: string
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Start Date: query_history.start_date
    row: 20
    col: 0
    width: 12
    height: 6
  - title: ANALYST_XS
    name: ANALYST_XS
    model: snowflake_usage_block
    explore: query_history
    type: looker_column
    fields: [query_history.start_date, total_query_cost, query_history.user_name]
    pivots: [query_history.user_name]
    filters:
      query_history.warehouse_name: '"ANALYST_XS"'
      query_history.user_name: LOADER
    sorts: [query_history.start_date desc, query_history.user_name]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      expression: |-
        case(
          when(${query_history.warehouse_size} = "X-Small", 1),
        when(${query_history.warehouse_size} = "Small", 2),
        when(${query_history.warehouse_size} = "Medium", 4),
        when(${query_history.warehouse_size} = "Large", 8),
        when(${query_history.warehouse_size} = "X-Large", 16),
        when(${query_history.warehouse_size} = "2X-Large", 32),
        when(${query_history.warehouse_size} = "3X-Large", 64),
        when(${query_history.warehouse_size} = "4X-Large", 128),
        null
        )
      label: Warehouse Credits
      value_format:
      value_format_name:
      dimension: warehouse_credits
      _kind_hint: dimension
      _type_hint: number
    - category: dimension
      expression: "(${query_history.execution_time} / (1000*60*60))*${warehouse_credits}"
      label: Query cost
      value_format:
      value_format_name:
      dimension: query_cost
      _kind_hint: dimension
      _type_hint: number
    - category: measure
      expression:
      label: Total Query Cost
      value_format:
      value_format_name:
      based_on: query_cost
      _kind_hint: measure
      measure: total_query_cost
      type: sum
      _type_hint: number
    - category: dimension
      expression: |-
        case(
          when(contains(lower(${query_history.query_text}), "dbt_cloud_pr_"), "pull-request"),
        when(contains(lower(${query_history.query_text}), "stg_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), ".stg_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), "int_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), ".int_" ), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), "fct_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), ".fct_" ), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), "rpt_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), ".rpt_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), "bdg_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), ".bdg_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), "grp_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), ".grp_"), "mattermost-analytics"),
        "snowflake-dbt"
        )
      label: DBT Project
      value_format:
      value_format_name:
      dimension: dbt_project
      _kind_hint: dimension
      _type_hint: string
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Start Date: query_history.start_date
    row: 29
    col: 0
    width: 12
    height: 6
  - title: TRANSFORM_XS - merge cost
    name: TRANSFORM_XS - merge cost
    model: snowflake_usage_block
    explore: query_history
    type: looker_column
    fields: [query_history.start_date, total_query_cost, query_history.merge_table]
    pivots: [query_history.merge_table]
    filters:
      query_history.warehouse_name: '"TRANSFORM_XS"'
      query_history.user_name: RUDDERSTACK,"RUDDERSTACK_BOT"
      query_history.query_type: MERGE
      total_query_cost: ">=1"
    sorts: [query_history.start_date desc, query_history.merge_table]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      expression: |-
        case(
          when(${query_history.warehouse_size} = "X-Small", 1),
        when(${query_history.warehouse_size} = "Small", 2),
        when(${query_history.warehouse_size} = "Medium", 4),
        when(${query_history.warehouse_size} = "Large", 8),
        when(${query_history.warehouse_size} = "X-Large", 16),
        when(${query_history.warehouse_size} = "2X-Large", 32),
        when(${query_history.warehouse_size} = "3X-Large", 64),
        when(${query_history.warehouse_size} = "4X-Large", 128),
        null
        )
      label: Warehouse Credits
      value_format:
      value_format_name:
      dimension: warehouse_credits
      _kind_hint: dimension
      _type_hint: number
    - category: dimension
      expression: "(${query_history.execution_time} / (1000*60*60))*${warehouse_credits}"
      label: Query cost
      value_format:
      value_format_name:
      dimension: query_cost
      _kind_hint: dimension
      _type_hint: number
    - category: measure
      expression:
      label: Total Query Cost
      value_format:
      value_format_name:
      based_on: query_cost
      _kind_hint: measure
      measure: total_query_cost
      type: sum
      _type_hint: number
    - category: dimension
      expression: |-
        case(
          when(contains(lower(${query_history.query_text}), "dbt_cloud_pr_"), "pull-request"),
        when(contains(lower(${query_history.query_text}), "stg_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), ".stg_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), "int_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), ".int_" ), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), "fct_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), ".fct_" ), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), "rpt_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), ".rpt_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), "bdg_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), ".bdg_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), "grp_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), ".grp_"), "mattermost-analytics"),
        "snowflake-dbt"
        )
      label: DBT Project
      value_format:
      value_format_name:
      dimension: dbt_project
      _kind_hint: dimension
      _type_hint: string
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Start Date: query_history.start_date
    row: 11
    col: 0
    width: 12
    height: 6
  - title: STITCH - merge cost
    name: STITCH - merge cost
    model: snowflake_usage_block
    explore: query_history
    type: looker_column
    fields: [query_history.start_date, total_query_cost, query_history.merge_table]
    pivots: [query_history.merge_table]
    filters:
      query_history.warehouse_name: STITCH
      query_history.user_name: RUDDERSTACK
      query_history.query_type: MERGE
      total_query_cost: ">=1"
    sorts: [query_history.start_date desc, query_history.merge_table]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      expression: |-
        case(
          when(${query_history.warehouse_size} = "X-Small", 1),
        when(${query_history.warehouse_size} = "Small", 2),
        when(${query_history.warehouse_size} = "Medium", 4),
        when(${query_history.warehouse_size} = "Large", 8),
        when(${query_history.warehouse_size} = "X-Large", 16),
        when(${query_history.warehouse_size} = "2X-Large", 32),
        when(${query_history.warehouse_size} = "3X-Large", 64),
        when(${query_history.warehouse_size} = "4X-Large", 128),
        null
        )
      label: Warehouse Credits
      value_format:
      value_format_name:
      dimension: warehouse_credits
      _kind_hint: dimension
      _type_hint: number
    - category: dimension
      expression: "(${query_history.execution_time} / (1000*60*60))*${warehouse_credits}"
      label: Query cost
      value_format:
      value_format_name:
      dimension: query_cost
      _kind_hint: dimension
      _type_hint: number
    - category: measure
      expression:
      label: Total Query Cost
      value_format:
      value_format_name:
      based_on: query_cost
      _kind_hint: measure
      measure: total_query_cost
      type: sum
      _type_hint: number
    - category: dimension
      expression: |-
        case(
          when(contains(lower(${query_history.query_text}), "dbt_cloud_pr_"), "pull-request"),
        when(contains(lower(${query_history.query_text}), "stg_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), ".stg_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), "int_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), ".int_" ), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), "fct_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), ".fct_" ), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), "rpt_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), ".rpt_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), "bdg_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), ".bdg_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), "grp_"), "mattermost-analytics"),
        when(contains(lower(${query_history.query_text}), ".grp_"), "mattermost-analytics"),
        "snowflake-dbt"
        )
      label: DBT Project
      value_format:
      value_format_name:
      dimension: dbt_project
      _kind_hint: dimension
      _type_hint: string
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Start Date: query_history.start_date
    row: 11
    col: 12
    width: 12
    height: 6
  - name: " (4)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h3","children":[{"text":"Expensive merge queries (cost ≥
      1 credit per day)"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 9
    col: 0
    width: 24
    height: 2
  filters:
  - name: Start Date
    title: Start Date
    type: field_filter
    default_value: 90 days
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
    model: snowflake_usage_block
    explore: query_history
    listens_to_filters: []
    field: query_history.start_date
