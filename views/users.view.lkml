view: users {
  sql_table_name: public.users ;;
  drill_fields: [age,first_name,last_name,city,state,country,email,traffic_source]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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
  }

  dimension: city {
    type:  string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type:  string
    sql: ${TABLE}.country ;;
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
    sql: ${TABLE}.firstname ;;
  }

  dimension: gender {
    type:  string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type:  string
    sql: ${TABLE}.last_name ;;
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
  }

  dimension: traffic_source {
    type:  string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: zip {
    type:  zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
  }

}
