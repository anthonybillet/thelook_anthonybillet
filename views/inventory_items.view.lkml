view: inventory_items {
  sql_table_name: public.inventory_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
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
    sql: ${TABLE}.created_at;;
  }

  dimension: product_brand {
    type: string
    sql: ${TABLE}.product_brand ;;
  }

  dimension: product_category {
    type: string
    sql: ${TABLE}.product_category ;;
  }

  dimension: product_department {
    type: string
    sql: ${TABLE}.product_department ;;
  }

  dimension: product_distribution_center_id {
    type: number
    sql: ${TABLE}.product_distribution_center_id ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }

  dimension: product_retail_price {
    type: number
    sql: ${TABLE}.product_retail_price ;;
  }

  dimension: product_sku {
    type: string
    sql: ${TABLE}.product_sku ;;
  }

  dimension_group: sold {
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
    sql: ${TABLE}.sold_at ;;
  }

  measure: stock_tier{
    description: "Gives a qualitative stock assessment, 'High' for over 10 units, 'Medium' for 5-10 units, 'Low' for under 5 units"
    case: {
      when: {
        sql: ${count} < 5 ;;
        label: "Low"
      }
      when: {
        sql: ${count} >= 5 AND ${count} <= 10 ;;
        label: "Medium"
      }
      else: "High"
    }
    drill_fields: [id, product_name]
  }

  measure: retail_price_one_of_each_item{
    type: sum_distinct
    sql_distinct_key: ${product_id} ;;
    sql: ${product_retail_price} ;;
    drill_fields: [id, product_name]
  }

  measure: retail_price_entire_inventory{
    type: sum
    sql: ${product_retail_price} ;;
    drill_fields: [id, product_name]
  }

  measure: cost_mens_department{
    type: sum
    sql: ${cost} ;;
    filters: {
      field: product_department
      value: "Men"
    }
    drill_fields: [id, product_name, product_department, cost]
  }

  measure: cost_womens_department{
    type: sum
    sql: ${cost} ;;
    filters: {
      field: product_department
      value: "Women"
    }
    drill_fields: [id, product_name, product_department, cost]
  }

  dimension: retail_profit{
    type: number
    sql: ${product_retail_price} - ${cost} ;;
    drill_fields: [id, product_name, product_retail_price, cost]
  }


  measure: total_cost{
    type: sum
    sql: ${cost} ;;
    drill_fields: [id, product_name, cost]
  }

  measure: count {
    type: count
    drill_fields: [id, product_name]
  }
}
