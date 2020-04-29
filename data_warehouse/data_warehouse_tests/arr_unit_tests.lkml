# If necessary, uncomment the line below to include explore_source.
# include: "data_warehouse.model.lkml"

test: BEGIN_ARR_FY18 {
  explore_source: arr {
    column: next_fiscal_year { field: dates.next_fiscal_year }
    column: total_arr { field: opportunitylineitem.total_arr }
    column: count { field: account.count }
    filters: {
      field: dates.last_day_of_fiscal_year
      value: "Yes"
    }
    filters: {
      field: dates.next_fiscal_year
      value: "2017/02/01"
    }
  }

  assert: count_expected_value {
    expression: ${account.count} = 144 ;;
  }

  assert: total_arr_expected_value {
    expression: ${opportunitylineitem.total_arr} > 1030000 AND ${opportunitylineitem.total_arr} < 1040000;;
  }

}

test: END_ARR_FY18 {
  explore_source: arr {
    column: next_fiscal_year { field: dates.next_fiscal_year }
    column: total_arr { field: opportunitylineitem.total_arr }
    column: count { field: account.count }
    filters: {
      field: dates.last_day_of_fiscal_year
      value: "Yes"
    }
    filters: {
      field: dates.date_fiscal_year
      value: "2018/01/31"
    }
  }

  assert: count_expected_value {
    expression: ${account.count} = 362 ;;
  }

  assert: total_arr_expected_value {
    expression: ${opportunitylineitem.total_arr} > 3870000   AND ${opportunitylineitem.total_arr} < 3900000;;
  }

}

test: BEGIN_ARR_FY19 {
  explore_source: arr {
    column: next_fiscal_year { field: dates.next_fiscal_year }
    column: total_arr { field: opportunitylineitem.total_arr }
    column: count { field: account.count }
    filters: {
      field: dates.last_day_of_fiscal_year
      value: "Yes"
    }
    filters: {
      field: dates.next_fiscal_year
      value: "2018/02/01"
    }
  }

  assert: count_expected_value {
    expression: ${account.count} = 362 ;;
  }

  assert: total_arr_expected_value {
    expression: ${opportunitylineitem.total_arr} > 3870000   AND ${opportunitylineitem.total_arr} < 3900000;;
  }

}

test: END_ARR_FY19 {
  explore_source: arr {
    column: next_fiscal_year { field: dates.next_fiscal_year }
    column: total_arr { field: opportunitylineitem.total_arr }
    column: count { field: account.count }
    filters: {
      field: dates.last_day_of_fiscal_year
      value: "Yes"
    }
    filters: {
      field: dates.date_fiscal_year
      value: "2019/01/31"
    }
  }

  assert: count_expected_value {
    expression: ${account.count} = 529 ;;
  }

  assert: total_arr_expected_value {
    expression: ${opportunitylineitem.total_arr} > 8200000 AND ${opportunitylineitem.total_arr} < 8210000;;
  }

}

test: BEGIN_ARR_FY20 {
  explore_source: arr {
    column: next_fiscal_year { field: dates.next_fiscal_year }
    column: total_arr { field: opportunitylineitem.total_arr }
    column: count { field: account.count }
    filters: {
      field: dates.last_day_of_fiscal_year
      value: "Yes"
    }
    filters: {
      field: dates.next_fiscal_year
      value: "2019/02/01"
    }
  }

  assert: count_expected_value {
    expression: ${account.count} = 529 ;;
  }

  assert: total_arr_expected_value {
    # Using the floor function here to just compare dollars, and ignore cents
    expression: ${opportunitylineitem.total_arr} > 8200000 AND ${opportunitylineitem.total_arr} < 8210000;;
  }

}

test: END_ARR_FY20 {
  explore_source: arr {
    column: next_fiscal_year { field: dates.next_fiscal_year }
    column: total_arr { field: opportunitylineitem.total_arr }
    column: count { field: account.count }
    filters: {
      field: dates.last_day_of_fiscal_year
      value: "Yes"
    }
    filters: {
      field: dates.date_fiscal_year
      value: "2020/01/31"
    }
  }

  assert: count_expected_value {
    expression: ${account.count} = 705 ;;
    # updated from 702 -> 703 2020/03/02
    # updated from 703 -> 704 2020/03/18
  }

  assert: total_arr_expected_value {
    expression: ${opportunitylineitem.total_arr} > 15600000  AND ${opportunitylineitem.total_arr} < 15700000  ;;
  }

}

test: BEGIN_ARR_FY21 {
  explore_source: arr {
    column: next_fiscal_year { field: dates.next_fiscal_year }
    column: total_arr { field: opportunitylineitem.total_arr }
    column: count { field: account.count }
    filters: {
      field: dates.last_day_of_fiscal_year
      value: "Yes"
    }
    filters: {
      field: dates.next_fiscal_year
      value: "2020/02/01"
    }
  }

  assert: count_expected_value {
    expression: ${account.count} = 705 ;;
    # updated from 702 -> 703 2020/03/02
    # updated from 703 -> 704 2020/03/18
  }

  assert: total_arr_expected_value {
    expression: ${opportunitylineitem.total_arr} > 15600000  AND ${opportunitylineitem.total_arr} < 15700000  ;;
  }

}
