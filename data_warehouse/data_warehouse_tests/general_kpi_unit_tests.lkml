test: downloads_have_data {
  explore_source: downloads {
    column: download_count {}
  }

  assert: download_count_expected_value {
    expression: ${downloads.download_count} > 0 ;;
  }
}
