view: completed_time_block_filter {

  extension: required

  dimension: current_date {
    view_label: "Timeline Comparison Fields"
    description: "This field exists because of the way Looker handles timezone conversions. If the conversion occurs after dateadd things get wonky and you get extra days."
    # type:
    hidden:  yes
    # Important note. This must be get_date, not current_date. current_date can't be timezone converted as it has no time. The system will assume midnight for the
    # conversion leading to bad results.
    sql: date({% case filter_to_last_completed._parameter_value %}
            {% when "last_data" %}
              (select max(${event_date}) from ${origin_table_name})
            {% else %}
              current_date
            {% endcase %});;
    # convert_tz: no
  }


  parameter: filter_to_last_completed {
    label: "1. Filter to Last Completed"
    view_label: "Special Filters"
    type: unquoted
    allowed_value: {
      label: "No Filter"
      value: "no_filter"
    }
    allowed_value: {
      label: "Day - Last Data"
      value: "last_data"
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

  # Filter to the last point where you found data.
  dimension: filter_to_the_last_value_dim {
    type: number
    sql: {% parameter filter_to_the_last_value %} ;;
    hidden: yes
  }

  # Filter to the last completed day, week, month, year
  dimension: filter_to_last_completed_dim {
    type: string
    sql: {% parameter filter_to_last_completed %} ;;
    hidden: yes
  }

}
