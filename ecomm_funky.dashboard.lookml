- dashboard: ecomm_funky
  title: Ecommerce Pulse Funky
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Profit Over Time
    name: Profit Over Time
    model: the_look_anthonybillet
    explore: order_items
    type: looker_area
    fields: [order_items.total_profit, inventory_items.sold_year]
    fill_fields: [inventory_items.sold_year]
    filters: {}
    sorts: [inventory_items.sold_year desc]
    limit: 500
    query_timezone: America/Los_Angeles
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
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    y_axes: [{label: Profit, orientation: left, series: [{axisId: order_items.total_profit,
            id: order_items.total_profit, name: Total Ecommerce Profit}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 38,
        type: linear}]
    series_types: {}
    series_colors: {}
    label_color: ["#fffff"]
    defaults_version: 1
    listen:
      State: users.state
      Status: order_items.status
      Department: products.department
    row: 10
    col: 0
    width: 24
    height: 8
  - title: Top 5 Brands by Profit
    name: Top 5 Brands by Profit
    model: the_look_anthonybillet
    explore: order_items
    type: looker_column
    fields: [order_items.total_profit, inventory_items.product_brand]
    filters: {}
    sorts: [order_items.total_profit desc]
    limit: 5
    column_limit: 50
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
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_dropoff: false
    defaults_version: 1
    series_types: {}
    listen:
      State: users.state
      Date Range: inventory_items.sold_date
      Status: order_items.status
      Department: products.department
    row: 5
    col: 10
    width: 14
    height: 5
  - title: Age Demographics
    name: Age Demographics
    model: the_look_anthonybillet
    explore: order_items
    type: looker_pie
    fields: [users.count, users.age_group]
    fill_fields: [users.age_group]
    filters: {}
    sorts: [users.count desc]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    series_types: {}
    listen:
      State: users.state
      Status: order_items.status
      Department: products.department
    row: 2
    col: 0
    width: 10
    height: 8
  - title: Top Cities by Users
    name: Top Cities by Users
    model: the_look_anthonybillet
    explore: order_items
    type: looker_grid
    fields: [users.country, users.city, users.count]
    filters:
      users.state: ''
    sorts: [users.count desc]
    limit: 20
    column_limit: 50
    dynamic_fields: [{table_calculation: test_table_calc, label: Test Table calc,
        expression: '1.2*${users.count}', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 9d1da669-a6b4-4a4f-8519-3ea8723b79b5
      palette_id: 0c5264fb-0681-4817-b9a5-d3c81002ce4c
      options:
        steps: 5
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      users.count:
        is_active: true
        palette:
          palette_id: fd0771e8-0cba-4b83-b1a8-0dd8e60925a4
          collection_id: 9d1da669-a6b4-4a4f-8519-3ea8723b79b5
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 9d1da669-a6b4-4a4f-8519-3ea8723b79b5,
          palette_id: 94ff10f1-bc18-49e3-9172-d166ad160bf5}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_latitude: 52.605549599526434
    map_longitude: -100.26397705078126
    map_zoom: 2
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    series_types: {}
    defaults_version: 1
    listen:
      Status: order_items.status
      Department: products.department
    row: 0
    col: 10
    width: 14
    height: 5
  - title: Average Sale
    name: Average Sale
    model: the_look_anthonybillet
    explore: order_items
    type: single_value
    fields: [order_items.average_sale]
    filters: {}
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Average Sale
    value_format: ''
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting: [{type: equal to, value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 9d1da669-a6b4-4a4f-8519-3ea8723b79b5,
          palette_id: 94ff10f1-bc18-49e3-9172-d166ad160bf5}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      State: users.state
      Date Range: inventory_items.sold_date
      Status: order_items.status
      Department: products.department
    row: 0
    col: 0
    width: 5
    height: 2
  - title: Total Revenue
    name: Total Revenue
    model: the_look_anthonybillet
    explore: order_items
    type: single_value
    fields: [order_items.test_missing_field]
    filters: {}
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Total Revenue
    value_format: ''
    conditional_formatting: [{type: equal to, value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 9d1da669-a6b4-4a4f-8519-3ea8723b79b5,
          palette_id: 94ff10f1-bc18-49e3-9172-d166ad160bf5}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      State: users.state
      Date Range: inventory_items.sold_date
      Status: order_items.status
      Department: products.department
    row: 0
    col: 5
    width: 5
    height: 2
  - name: Merged Results Example
    title: Merged Results Example
    merged_queries:
    - model: the_look_anthonybillet
      explore: order_items
      type: looker_line
      fields: [order_items.count, order_items.created_date]
      fill_fields: [order_items.created_date]
      filters:
        order_items.created_date: 30 days
      sorts: [order_items.created_date desc]
      limit: 500
      column_limit: 50
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
      stacking: ''
      limit_displayed_rows: false
      legend_position: center
      point_style: none
      show_value_labels: false
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: true
      show_null_points: true
      interpolation: linear
      defaults_version: 1
    - model: the_look_anthonybillet
      explore: order_items
      type: table
      fields: [order_items.count, order_items.returned_date]
      fill_fields: [order_items.returned_date]
      filters:
        order_items.returned_date: 30 days
      sorts: [order_items.returned_date desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: order_items.returned_date
        source_field_name: order_items.created_date
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
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    series_labels:
      order_items.count: Orders Created
      q1_order_items.count: Orders Returned
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    type: looker_line
    row: 18
    col: 0
    width: 24
    height: 6
  filters:
  - name: Date Range
    title: Time
    type: field_filter
    default_value: 7 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: the_look_anthonybillet
    explore: order_items
    listens_to_filters: []
    field: inventory_items.sold_date
  - name: State
    title: State
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: the_look_anthonybillet
    explore: order_items
    listens_to_filters: []
    field: suggest_states_USA.state
  - name: Status
    title: Status
    type: field_filter
    default_value: Cancelled,Complete,Processing,Returned,Shipped
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: inline
    model: the_look_anthonybillet
    explore: order_items
    listens_to_filters: []
    field: order_items.status
  - name: Department
    title: Department
    type: field_filter
    default_value: Men,Women
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: the_look_anthonybillet
    explore: order_items
    listens_to_filters: []
    field: products.department
