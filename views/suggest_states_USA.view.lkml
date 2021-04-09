view: suggest_states_USA {
  derived_table: {
    sql: SELECT DISTINCT state
      FROM public.users
      WHERE country = 'USA'
      ORDER BY 1
       ;;
  }

  dimension: state {
    hidden: yes
    type: string
    sql: ${TABLE}.state ;;
  }

}
