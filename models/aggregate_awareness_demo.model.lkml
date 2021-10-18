connection: "looker-private-demo"

include: "/views/*.view.lkml"

datagroup: ecommerce_etl {
  sql_trigger: SELECT max(created_at) FROM ecomm.events ;;
  max_cache_age: "24 hours"
}

persist_with: ecommerce_etl

explore: order_items {
  label: "Order Items (No Agg Awareness)"
  view_name: order_items

  join: order_facts {
    type: left_outer
    view_label: "Orders"
    relationship: many_to_one
    sql_on: ${order_facts.order_id} = ${order_items.order_id} ;;
  }

  join: inventory_items {
    #Left Join only brings in items that have been sold as order_item
    type: full_outer
    relationship: one_to_one
    sql_on: ${inventory_items.id} = ${order_items.inventory_item_id} ;;
  }

  join: users {
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.user_id} = ${users.id} ;;
  }

  join: user_order_facts {
    view_label: "Users"
    type: left_outer
    relationship: many_to_one
    sql_on: ${user_order_facts.user_id} = ${order_items.user_id} ;;
  }

  join: products {
    type: left_outer
    relationship: many_to_one
    sql_on: ${products.id} = ${inventory_items.product_id} ;;
  }

  join: repeat_purchase_facts {
    relationship: many_to_one
    type: full_outer
    sql_on: ${order_items.order_id} = ${repeat_purchase_facts.order_id} ;;
  }

  join: distribution_centers {
    type: left_outer
    sql_on: ${distribution_centers.id} = ${inventory_items.product_distribution_center_id} ;;
    relationship: many_to_one
  }
}

explore: order_items_2 {
  label: "Order Items (W/ Agg Awareness)"
  extends: [order_items]
}

# Place in `aggregate_awareness_demo` model
explore: +order_items_2 {
  aggregate_table: rollup__users_count__0 {
    query: {
      measures: [users.count]
      filters: [
        # "order_items.created_date" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        order_items.created_date: "90 day",
        users.created_date: "7 days"
      ]
      timezone: "America/Los_Angeles"
    }

    materialization: {
      datagroup_trigger: ecommerce_etl
    }
  }

  aggregate_table: rollup__order_items_created_date__users_city__users_country__users_gender__users_state__users_traffic_source__1 {
    query: {
      dimensions: [
        order_items.created_date,
        users.city,
        users.country,
        users.gender,
        users.state,
        users.traffic_source
      ]
      measures: [order_items.average_sale_price]
      timezone: "America/Los_Angeles"
    }

    materialization: {
      datagroup_trigger: ecommerce_etl
    }
  }

  aggregate_table: rollup__order_items_created_date__products_category__users_city__users_country__users_gender__users_state__users_traffic_source__2 {
    query: {
      dimensions: [
        order_items.created_date,
        products.category,
        users.city,
        users.country,
        users.gender,
        users.state,
        users.traffic_source
      ]
      measures: [order_items.count]
      filters: [products.category: "Blazers & Jackets,Sweaters,Pants,Shorts,Fashion Hoodies & Sweatshirts,Accessories"]
      timezone: "America/Los_Angeles"
    }

    materialization: {
      datagroup_trigger: ecommerce_etl
    }
  }

  aggregate_table: rollup__users_state__3 {
    query: {
      dimensions: [users.state]
      measures: [order_items.average_spend_per_user, order_items.order_count, order_items.total_sale_price, users.count]
      filters: [
        # "order_items.created_date" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        order_items.created_date: "90 day"
      ]
      timezone: "America/Los_Angeles"
    }

    materialization: {
      datagroup_trigger: ecommerce_etl
    }
  }

  aggregate_table: rollup__users_traffic_source__4 {
    query: {
      dimensions: [users.traffic_source]
      measures: [order_items.average_sale_price, user_order_facts.average_lifetime_orders]
      filters: [
        # "order_items.created_date" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        order_items.created_date: "90 day"
      ]
      timezone: "America/Los_Angeles"
    }

    materialization: {
      datagroup_trigger: ecommerce_etl
    }
  }

  aggregate_table: rollup__order_items_created_date__users_city__users_country__users_gender__users_state__users_traffic_source__5 {
    query: {
      dimensions: [
        order_items.created_date,
        users.city,
        users.country,
        users.gender,
        users.state,
        users.traffic_source
      ]
      measures: [order_items.count]
      timezone: "America/Los_Angeles"
    }

    materialization: {
      datagroup_trigger: ecommerce_etl
    }
  }
}
