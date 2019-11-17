- dashboard: levis_inventory_products_distribution_lookML
  title: Levi's Inventory, Products, Distribution
  layout: newspaper
  elements:
  - title: Stock By Category
    name: Stock By Category
    model: the_look_anthonybillet
    explore: inventory_items
    type: looker_scatter
    fields: [inventory_items.stock_tier, inventory_items.product_category]
    sorts: [inventory_items.stock_tier desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: inventory_items.stock_tier,
            id: inventory_items.stock_tier, name: Stock Tier}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: custom, tickDensityCustom: 37,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: true
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    listen:
      Time: inventory_items.created_date
      Retail Margin: inventory_items.retail_margin
    row: 0
    col: 0
    width: 13
    height: 6
  - title: Levi's Products by Category
    name: Levi's Products by Category
    model: the_look_anthonybillet
    explore: inventory_items
    type: looker_bar
    fields: [products.count, products.category]
    sorts: [products.count desc]
    limit: 500
    column_limit: 50
    series_types: {}
    listen:
      Time: inventory_items.created_date
      Retail Margin: inventory_items.retail_margin
    row: 6
    col: 0
    width: 13
    height: 6
  - title: Distribution Center Map
    name: Distribution Center Map
    model: the_look_anthonybillet
    explore: inventory_items
    type: looker_map
    fields: [distribution_centers.latlong]
    sorts: [distribution_centers.latlong]
    limit: 500
    column_limit: 50
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_latitude: 34.05297109453645
    map_longitude: -118.24836116284133
    map_zoom: 14
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: icon
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    series_types: {}
    row: 12
    col: 0
    width: 24
    height: 9
  - title: Top Products By Margin
    name: Top Products By Margin
    model: the_look_anthonybillet
    explore: inventory_items
    type: looker_grid
    fields: [products.name, inventory_items.retail_margin]
    sorts: [inventory_items.retail_margin desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    series_column_widths:
      products.name: 470
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_latitude: 34.05297109453645
    map_longitude: -118.24836116284133
    map_zoom: 14
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: icon
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    series_types: {}
    listen:
      Time: inventory_items.created_date
      Retail Margin: inventory_items.retail_margin
    row: 0
    col: 13
    width: 11
    height: 12
  filters:
  - name: Time
    title: Time
    type: field_filter
    default_value: 7 days
    allow_multiple_values: true
    required: false
    model: the_look_anthonybillet
    explore: inventory_items
    listens_to_filters: []
    field: inventory_items.created_date
  - name: Retail Margin
    title: Retail Margin
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: the_look_anthonybillet
    explore: inventory_items
    listens_to_filters: []
    field: inventory_items.retail_margin
