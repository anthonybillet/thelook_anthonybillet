connection: "thelook_events"

# include all the views
include: "/views/**/*.view"

datagroup: the_look_anthonybillet_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

datagroup: the_look_anthonybillet_4hr_cahce {
  sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "4 hour"
}

persist_with: the_look_anthonybillet_default_datagroup

explore: order_items {
  persist_with: the_look_anthonybillet_4hr_cahce
  always_filter: {
    filters: {
      field: users.state
      value: "California"
    }
  }

  join: users {
    type: left_outer
    relationship: one_to_many
    sql_on: ${order_items.user_id} = ${users.id};;
  }

  join: inventory_items {
    type: left_outer
    relationship: one_to_one
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id};;
  }

  join: products {
    type: left_outer
    relationship: many_to_one
    sql_on: ${inventory_items.product_id} = ${products.id};;
  }

}

explore: inventory_items {
  label: "Levi's Inventory, Products, and Distribution"
  view_label: "Levi's Inventory"
  sql_always_where: ${product_brand} = 'Levi''s';;
  fields: [ALL_FIELDS*, -products.brand, product_brand]

  join: products {
    view_label: "Levi's Products"
    type: inner
    sql_on: ${inventory_items.product_id} = ${products.id};;
    relationship: many_to_one
  }

  join: distribution_centers  {
    view_label: "Levi's Distribution Centers"
    type: left_outer
    relationship: many_to_one
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
  }
}

explore: pit_stops  {}
