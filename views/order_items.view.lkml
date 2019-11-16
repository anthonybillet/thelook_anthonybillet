view: order_items {
  sql_table_name: public.order_items ;;
  drill_fields: [created_date,delivered_date,shipped_date,returned_date,sale_price,status]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: delivered {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.delivered_at ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: returned {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
    drill_fields: [id, delivered_date, sale_price_tier]
  }

  dimension: sale_price_tier {
    type: tier
    tiers: [0, 10, 20, 50, 100]
    style: relational
    sql: ${TABLE}.sale_price;;
    value_format_name: usd
  }

  dimension: luxury_item {
    type: yesno
    sql: ${sale_price} >= 100 ;;
  }

  dimension_group: shipped {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.shipped_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }


  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
  }

  measure: cheapest_sale {
    label: "Lowest Value Sale"
    description: "Finds the cheapest purchase"
    type: min
    sql: ${sale_price} ;;
  }

  measure: most_expensive_sale {
    label: "Highest Value Sale"
    description: "Finds the most expensive purchase"
    type: max
    sql: ${sale_price} ;;
  }

  measure: average_sale {
    label: "Average Sale Value"
    description: "The average dollar amount earned across all sales"
    type: average
    sql: ${sale_price} ;;
  }

  measure: total_revenue {
    label: "Total Sales Revenue"
    description: "Sums up every dollar earned from each sale"
    type: sum
    sql: ${sale_price} ;;
  }

  measure: total_profit {
    label: "Total Ecommerce Profit"
    description: "Calculates company profit as a function of total revenue less total cost"
    type: number
    sql: ${total_revenue} - ${inventory_items.total_cost} ;;
  }
}
