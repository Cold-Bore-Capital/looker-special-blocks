include: "completed_time_block_filter.view"

view: dummy_view {
  #----------- START POP BLOCK -----------
  extends: [completed_time_block_filter]

  dimension: event_date {
    sql: ${TABLE}.date ;;
    type: date
    hidden: yes
    # Turn this to no if your table is pulling just a date. Yes if table is pulling a datetime type.
    convert_tz: no
  }

  dimension: table_name {
    type: string
    sql: ${TABLE} ;;
    hidden: yes
  }
}
