connection: "snowflake"
include: "/views/marts/dbt_project_evaluator/*.view.lkml"                # include all views in the views/ folder in this project

# Modeling

explore: fct_direct_join_to_source {
  label: "Direct Join to Source"
  view_label: "Direct Join to Source"
  group_label: "DBT Modeling"
}

explore: fct_marts_or_intermediate_dependent_on_source {
  label: "Downstream Models Dependent on Source"
  view_label: "Downstream Models Dependent on Source"
  group_label: "DBT Modeling"
}

explore: fct_hard_coded_references {
  label: "Hard Coded References"
  view_label: "Hard Coded References"
  group_label: "DBT Modeling"
}

explore: fct_model_fanout {
  label: "Model Fanout"
  view_label: "Model Fanout"
  group_label: "DBT Modeling"
}

explore: fct_multiple_sources_joined {
  label: "Multiple Sources Joined"
  view_label: "Multiple Sources Joined"
  group_label: "DBT Modeling"
}

explore: fct_rejoining_of_upstream_concepts {
  label: "Rejoining of Upstream Concepts"
  view_label: "Rejoining of Upstream Concepts"
  group_label: "DBT Modeling"
}

explore: fct_root_models {
  label: "Root models"
  view_label: "Root models"
  group_label: "DBT Modeling"
}

explore: fct_source_fanout {
  label: "Source Fanout"
  view_label: "Source Fanout"
  group_label: "DBT Modeling"
}

explore: fct_staging_dependent_on_marts_or_intermediate {
  label: "Staging Models Dependent on Downstream Models"
  view_label: "Staging Models Dependent on Downstream Models"
  group_label: "DBT Modeling"
}

explore: fct_staging_dependent_on_staging {
  label: "Staging Models Dependent on Other Staging Models"
  view_label: "Staging Models Dependent on Other Staging Models"
  group_label: "DBT Modeling"
}

explore: fct_unused_sources {
  label: "Unused Sources"
  view_label: "Unused Sources"
  group_label: "DBT Modeling"
}

# Testing

explore: fct_missing_primary_key_tests {
  label: "Missing Primary Key Tests"
  view_label: "Missing Primary Key Tests"
  group_label: "DBT Testing"
}

explore: fct_test_coverage {
  label: "Test Coverage"
  view_label: "Test Coverage"
  group_label: "DBT Testing"
}

# Documentation

explore: fct_documentation_coverage {
  label: "Documentation Coverage"
  view_label: "Documentation Coverage"
  group_label: "DBT Documentation"
}

explore: fct_undocumented_models {
  label: "Undocumented Models"
  view_label: "Undocumented Models"
  group_label: "DBT Documentation"
}

# Structure

explore: fct_model_naming_conventions {
  label: "Model Naming Conventions"
  view_label: "Model Naming Conventions"
  group_label: "DBT Structure"
}

explore: fct_model_directories {
  label: "Model Directories"
  view_label: "Model Directories"
  group_label: "DBT Structure"
}

explore: fct_source_directories {
  label: "Source Directories"
  view_label: "Source Directories"
  group_label: "DBT Structure"
}

explore: fct_test_directories {
  label: "Test Directories"
  view_label: "Test Directories"
  group_label: "DBT Structure"
}

# Performance

explore: fct_chained_views_dependencies {
  label: "Chained View Dependencies"
  view_label: "Chained View Dependencies"
  group_label: "DBT Performance"
}

explore: fct_exposure_parents_materializations {
  label: "Exposure Parents Materializations"
  view_label: "Exposure Parents Materializations"
  group_label: "DBT Performance"
}
