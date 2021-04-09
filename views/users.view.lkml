access_grant: can_see_country {
  user_attribute: can_see_country
  allowed_values: ["Yes"]
}

view: users {
  sql_table_name: looker-private-demo.ecomm.users ;;
  drill_fields: [age,first_name,last_name,city,state,country,email,traffic_source]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: reference_field {
    type: string
    sql: 'Banana' ;;
  }

  dimension: label_test {
    label: "
    {{ users.reference_field._value }}
    "
    type: string
    sql: 'does not matter' ;;
  }

  dimension: age {
    type:  number
    sql: ${TABLE}.age ;;
  }

  dimension: age_group {
    case: {
      when: {
        sql: ${age} > 0 AND  ${age} <= 12;;
        label: "Child"
      }
      when: {
        sql: ${age} > 12 AND  ${age} <= 17 ;;
        label: "Teen"
      }
      when: {
        sql: ${age} > 17 AND  ${age} <= 29 ;;
        label: "Young Adult"
      }
      when: {
        sql: ${age} > 29 AND  ${age} <= 49 ;;
        label: "30's and 40's"
      }
      when: {
        sql: ${age} > 49 AND  ${age} <= 69 ;;
        label: "50's and 60's"
      }
      else: "Senior"
    }
    drill_fields: [age, city, country, name]
  }

  dimension: city {
    type:  string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type:  string
    sql: ${TABLE}.country ;;
    required_access_grants: [can_see_country]
  }

dimension_group: created_at {
  type: time
  timeframes: [
    raw,
    time,
    date,
    year,
    month,
    quarter,
    week
  ]
  sql: ${TABLE}.created_at ;;
}

  dimension: email {
    type:  string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type:  string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type:  string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type:  string
    sql: ${TABLE}.last_name ;;
  }

  dimension: name {
    type: string
    sql: ${first_name} || ' ' ||  ${last_name};;
  }

  dimension: latitude {
    type:  number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type:  number
    sql: ${TABLE}.longitude ;;
  }

  dimension: state {
    type:  string
    sql: ${TABLE}.state ;;
    # suggest_dimension:suggest_states_USA.state
  }

  dimension: traffic_source {
    type:  string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: zip {
    type:  zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: stuff {
    type: count
    drill_fields: [zip,state, stuff_2]
  }

  measure: stuff_2 {
    type: count_distinct
    drill_fields: [city,stuff]
    sql: ${zip} ;;
  }

  measure: count {
    type: count
    drill_fields: [name, age, state, email]
    link: {
      label: "Drill to Users by State"
      url: "{{ link }}&fields=users.count,users.state"
    }
    link: {
      label: "Drill to Users by Country"
      url: "{{ link }}&fields=users.count,users.country"
    }
    link: {
      label: "Drill to Users by Country (Pie Chart)"
      url: "{% assign vis_config = '{\"type\": \"looker_pie\"}' %}
      {{ link }}&fields=users.count,users.country&vis_config={{ vis_config | encode_uri }}&toggle=dat,pik,vis&limit=5000"
    }
    link: {
      label: "Drill to Users by Country (Pie Chart)"
      url: "{% assign vis_config = '{\"type\": \"looker_pie\"}' %}
      {{ link }}&fields=users.count,users.country&vis_config={{ vis_config | encode_uri }}&toggle=dat,pik,vis&limit=5000"
    }
    link: {
      label: "Drill to Users by Country and Traffic Source"
      url: "{{ link }}&fields=users.count,users.country,users.traffic_source&pivots=users.traffic_source"
    }
    link: {
      label: "Drill to Users by Country and Traffic Source (Grouped Bar Graph)"
      url: "{% assign vis_config = '{\"type\": \"looker_bar\"}' %}
      {{ link }}&fields=users.count,users.country,users.traffic_source&pivots=users.traffic_source&vis_config={{ vis_config | encode_uri }}&toggle=dat,pik,vis&limit=5000"
    }
    link: {
      label: "Drill to Users by Country and Traffic Source (Stacked Bar Graph)"
      url: "

      {% assign vis= '{\"x_axis_gridlines\":false,
        \"y_axis_gridlines\":true,
        \"show_view_names\":false,
        \"show_y_axis_labels\":true,
        \"show_y_axis_ticks\":true,
        \"y_axis_tick_density\":\"default\",
        \"y_axis_tick_density_custom\":5,
        \"show_x_axis_label\":true,
        \"show_x_axis_ticks\":true,
        \"y_axis_scale_mode\":\"linear\",
        \"x_axis_reversed\":false,
        \"y_axis_reversed\":false,
        \"plot_size_by_field\":false,
        \"trellis\":\"\",
        \"stacking\":\"normal\",
        \"limit_displayed_rows\":false,
        \"legend_position\":\"center\",
        \"point_style\":\"none\",
        \"show_value_labels\":false,
        \"label_density\":25,
        \"x_axis_scale\":\"auto\",
        \"y_axis_combined\":true,
        \"ordering\":\"none\",
        \"show_null_labels\":false,
        \"show_totals_labels\":true,
        \"show_silhouette\":false,
        \"totals_color\":\"#000000\",
        \"color_application\":{\"collection_id\":\"5591d8d1-6b49-4f8e-bafa-b874d82f8eb7\",
        \"palette_id\":\"18d0c733-1d87-42a9-934f-4ba8ef81d736\",
        \"options\":{\"steps\":5}},
        \"series_types\":{},
        \"series_colors\":{},
        \"type\":\"looker_bar\",
        \"defaults_version\":1}' %}

      {{ link }}&fields=users.count,users.country,users.traffic_source&pivots=users.traffic_source&vis_config={{ vis | encode_uri }}&toggle=dat,pik,vis&limit=5000"
    }
  }


}
