connection: "thelook_events"

# include all the views
include: "/views/**/*.view"

datagroup: the_look_anthonybillet_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: the_look_anthonybillet_default_datagroup

explore: order_items {

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
