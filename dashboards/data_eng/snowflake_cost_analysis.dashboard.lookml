---
- dashboard: snowflake_warehouse_cost_analysis
  title: Snowflake Warehouse Cost Analysis
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: YckWu0Uw4GkeblJlgAoKck
  elements:
  - title: Cost Per Warehouse
    name: Cost Per Warehouse
    model: snowflake_usage_block
    explore: query_history
    type: looker_column
    fields: [query_history.start_date, total_query_cost, query_history.warehouse_name]
    pivots: [query_history.warehouse_name]
    sorts: [query_history.start_date desc, query_history.warehouse_name]
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
    show_totals_labels: true
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
    row: 0
    col: 0
    width: 24
    height: 12
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |
      ---

      # Cost Per Warehouse And User

      ---
    row: 24
    col: 0
    width: 24
    height: 3
  - title: TRANSFORM_XS
    name: TRANSFORM_XS
    model: snowflake_usage_block
    explore: query_history
    type: looker_column
    fields: [query_history.start_date, total_query_cost, query_history.user_name]
    pivots: [query_history.user_name]
    filters:
      query_history.warehouse_name: '"TRANSFORM_XS"'
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
    row: 27
    col: 0
    width: 12
    height: 7
  - title: TRANSFORM_L
    name: TRANSFORM_L
    model: snowflake_usage_block
    explore: query_history
    type: looker_column
    fields: [query_history.start_date, total_query_cost, query_history.user_name]
    pivots: [query_history.user_name]
    filters:
      query_history.warehouse_name: '"TRANSFORM_L"'
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
    row: 34
    col: 0
    width: 12
    height: 7
  - title: STITCH
    name: STITCH
    model: snowflake_usage_block
    explore: query_history
    type: looker_column
    fields: [query_history.start_date, total_query_cost, query_history.user_name]
    pivots: [query_history.user_name]
    filters:
      query_history.warehouse_name: STITCH
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
    row: 34
    col: 12
    width: 12
    height: 7
  - title: RUDDERSTACK_M
    name: RUDDERSTACK_M
    model: snowflake_usage_block
    explore: query_history
    type: looker_column
    fields: [query_history.start_date, total_query_cost, query_history.user_name]
    pivots: [query_history.user_name]
    filters:
      query_history.warehouse_name: '"RUDDERSTACK_M"'
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
    row: 41
    col: 12
    width: 12
    height: 7
  - title: ANALYST_XS
    name: ANALYST_XS
    model: snowflake_usage_block
    explore: query_history
    type: looker_column
    fields: [query_history.start_date, total_query_cost, query_history.user_name]
    pivots: [query_history.user_name]
    filters:
      query_history.warehouse_name: '"ANALYST_XS"'
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
    row: 41
    col: 0
    width: 12
    height: 7
  - title: REPORTING_M
    name: REPORTING_M
    model: snowflake_usage_block
    explore: query_history
    type: looker_column
    fields: [query_history.start_date, total_query_cost, query_history.user_name]
    pivots: [query_history.user_name]
    filters:
      query_history.warehouse_name: '"REPORTING_M"'
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
    row: 48
    col: 12
    width: 12
    height: 7
  - title: TRANSFORM_M
    name: TRANSFORM_M
    model: snowflake_usage_block
    explore: query_history
    type: looker_column
    fields: [query_history.start_date, total_query_cost, query_history.user_name]
    pivots: [query_history.user_name]
    filters:
      query_history.warehouse_name: '"TRANSFORM_M"'
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
    row: 27
    col: 12
    width: 12
    height: 7
  - title: REPORTING_S
    name: REPORTING_S
    model: snowflake_usage_block
    explore: query_history
    type: looker_column
    fields: [query_history.start_date, total_query_cost, query_history.user_name]
    pivots: [query_history.user_name]
    filters:
      query_history.warehouse_name: '"REPORTING_S"'
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
    row: 48
    col: 0
    width: 12
    height: 7
  - title: COMPUTE_WH
    name: COMPUTE_WH
    model: snowflake_usage_block
    explore: query_history
    type: looker_column
    fields: [query_history.start_date, total_query_cost, query_history.user_name]
    pivots: [query_history.user_name]
    filters:
      query_history.warehouse_name: '"COMPUTE_WH"'
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
    row: 55
    col: 0
    width: 12
    height: 7
  - title: FIVETRAN_WH
    name: FIVETRAN_WH
    model: snowflake_usage_block
    explore: query_history
    type: looker_column
    fields: [query_history.start_date, total_query_cost, query_history.user_name]
    pivots: [query_history.user_name]
    filters:
      query_history.warehouse_name: '"FIVETRAN_WH"'
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
    row: 55
    col: 12
    width: 12
    height: 7
  - title: Cost Per User
    name: Cost Per User
    model: snowflake_usage_block
    explore: query_history
    type: looker_column
    fields: [query_history.start_date, total_query_cost, query_history.user_name]
    pivots: [query_history.user_name]
    sorts: [query_history.start_date desc]
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
    row: 12
    col: 0
    width: 15
    height: 12
  - title: Cost Per User (%)
    name: Cost Per User (%)
    model: snowflake_usage_block
    explore: query_history
    type: looker_column
    fields: [query_history.start_date, total_query_cost, query_history.user_name]
    pivots: [query_history.user_name]
    sorts: [query_history.start_date desc]
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
    stacking: percent
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
    row: 12
    col: 15
    width: 9
    height: 12
  filters:
  - name: Start Date
    title: Start Date
    type: field_filter
    default_value: 90 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: snowflake_usage_block
    explore: query_history
    listens_to_filters: []
    field: query_history.start_date
