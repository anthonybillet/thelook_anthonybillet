connection: "looker-private-demo"

# include all the views
include: "/**/**/*.view"
include: "/*.dashboard"

explore: users {}

datagroup: the_look_anthonybillet_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

datagroup: the_look_anthonybillet_4hr_cahce {
  sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "4 hour"
}

persist_with: the_look_anthonybillet_default_datagroup

# access_grant: banana {
#   allowed_values: ["banana"]
#   user_attribute: allowed_fruits
# }

explore: order_items {
  # persist_with: the_look_anthonybillet_4hr_cahce
  access_filter: {
    field: products.brand
    user_attribute: brand
  }

  join: users {
#     required_access_grants: [banana]
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

  join: products_sale_price_same_as_retail  {
    from: products
    type: inner
    relationship: many_to_one
    sql_on: ${order_items.sale_price} = ${products.retail_price} ;;
  }

  join: suggest_states_USA {
    sql_on: ${suggest_states_USA.state} = ${users.state} ;;
    relationship: many_to_one
    type: left_outer
  }

  join: user_facts {
    sql_on: ${order_items.user_id} = ${user_facts.users_id} ;;
    relationship: many_to_one
    type: left_outer
  }


}

explore: inventory_items {
  persist_with: the_look_anthonybillet_4hr_cahce
  label: "Levi's Inventory, Products, and Distribution"
  view_label: "Levi's Inventory"
  sql_always_where: ${product_brand} = 'Levi''s';;
  fields: [ALL_FIELDS*, -products.brand, -inventory_items.product_brand]

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
