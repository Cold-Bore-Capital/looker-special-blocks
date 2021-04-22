view: completed_time_block_filter {

  parameter: filter_to_last_completed {
    label: "1. Filter to Last Completed"
    view_label: "Special Filters"
    type: unquoted
    allowed_value: {
      label: "No Filter"
      value: "no_filter"
    }
    allowed_value: {
      label: "Day"
      value: "day"
    }
    allowed_value: {
      label: "Week"
      value: "week"
    }
    allowed_value: {
      label: "Month"
      value: "month"
    }
    allowed_value: {
      label: "Quarter"
      value: "quarter"
    }
    allowed_value: {
      label: "Year"
      value: "year"
    }
    default_value: "no_filter"
  }

  parameter: filter_to_the_last_value {
    label: "2. Filter the last X"
    description: "Select the number of {% parameter filter_to_last_completed %} to include in the range."
    view_label: "Special Filters"
    type: number
    default_value: "0"
  }

  dimension: filter_to_the_last_value_dim {
    type: number
    sql: {% parameter filter_to_the_last_value %} ;;
    hidden: yes
  }

  dimension: filter_to_last_completed_dim {
    type: string
    sql: {% parameter filter_to_last_completed %} ;;
    hidden: yes
  }

}
