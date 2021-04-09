view: user_facts {
  derived_table: {
    sql: SELECT
        users.id  AS "users.id",
        SUM(order_items.sale_price)  AS "order_items.total_revenue"
      FROM public.order_items  AS order_items
      LEFT JOIN public.users  AS users ON order_items.user_id = users.id

      WHERE
     -- state = something
      {% condition state_dynamic_input %} state {% endcondition %}
      AND state = {% parameter state_dynamic_input_2 %}
      GROUP BY 1
       ;;
  }

 filter: state_dynamic_input {
  type: string
 }

  parameter: state_dynamic_input_2 {
    type: string
  }

  measure: average_revenue_by_user {
    type: average
    sql: ${order_items_total_revenue} ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: users_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."users.id" ;;
  }

  dimension: order_items_total_revenue {
    type: number
    sql: ${TABLE}."order_items.total_revenue" ;;
  }

  set: detail {
    fields: [users_id, order_items_total_revenue]
  }
}
