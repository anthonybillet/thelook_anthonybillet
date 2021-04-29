view: products {
  sql_table_name: looker-private-demo.ecomm.products ;;
  drill_fields: [brand,category,department]
  dimension: id {
    primary_key: yes
    type:  number
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    type:  string
    sql: ${TABLE}.brand ;;
  }

  dimension: category {
    type:  string
    sql: ${TABLE}.category ;;
  }

  dimension: cost {
    type:  number
    sql: ${TABLE}.cost;;
  }

  dimension: department {
    type:  string
    sql: ${TABLE}.department ;;
  }

  dimension: distribution_center_id {
    type:  number
    sql: ${TABLE}.distribution_center_id ;;
  }

  dimension: name {
    type:  string
    sql: ${TABLE}.name ;;
  }

  dimension: retail_price {
    type:  number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: sku {
    type:  string
    sql: ${TABLE}.sku ;;
  }

  measure: count {
    type: count
  }

  set: detail {
    fields: [
      id,
      users.id,
      users.first_name,
      users.last_name,
      inventory_items.id,
      inventory_items.product_name
    ]
  }

}
