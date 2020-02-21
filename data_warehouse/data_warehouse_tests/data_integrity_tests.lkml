test: arr_for_fy2019 {
  explore_source: arr {
    column: date_fiscal_year { field: dates.date_fiscal_year }
    column: count { field: account.count }
    column: total_arr { field: opportunitylineitem.total_arr }

    filters: {
      field: dates.date_fiscal_year
      value: "FY2019"
    }
  }

  assert: count_expected_value {
    expression: ${account.count} = 615 ;;
  }

  assert: total_arr_expected_value {
    # Using the floor function here to just compare dollars, and ignore cents
    expression: ${opportunitylineitem.total_arr} BETWEEN 12100000 AND 12200000;;
  }
}

test: downloads_have_data {
  explore_source: downloads {
    column: download_count {}
  }

  assert: download_count_expected_value {
    expression: ${downloads.download_count} > 0 ;;
  }
}
