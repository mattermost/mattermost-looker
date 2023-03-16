connection: "snowflake"
include: "/views/marts/dbt_project_evaluator/*.view.lkml"

# include all views in the views/ folder in this project

# Modeling

explore: fct_direct_join_to_source {
  label: "[Modeling] Direct Join to Source"
  view_label: "[Modeling] Direct Join to Source"
  group_label: "DBT Project Health"
}


explore: fct_marts_or_intermediate_dependent_on_source {
  label: "[Modeling] Downstream Models Dependent on Source"
  view_label: "[Modeling] Downstream Models Dependent on Source"
  group_label: "DBT Project Health"
}

explore: fct_hard_coded_references {
  label: "[Modeling] Hard Coded References"
  view_label: "[Modeling] Hard Coded References"
  group_label: "DBT Project Health"
}

explore: fct_model_fanout {
  label: "[Modeling] Model Fanout"
  view_label: "[Modeling] Model Fanout"
  group_label: "DBT Project Health"
}

explore: fct_multiple_sources_joined {
  label: "[Modeling] Multiple Sources Joined"
  view_label: "[Modeling] Multiple Sources Joined"
  group_label: "DBT Project Health"
}

explore: fct_rejoining_of_upstream_concepts {
  label: "[Modeling] Rejoining of Upstream Concepts"
  view_label: "[Modeling] Rejoining of Upstream Concepts"
  group_label: "DBT Project Health"
}

explore: fct_root_models {
  label: "[Modeling] Root models"
  view_label: "[Modeling] Root models"
  group_label: "DBT Project Health"
}

explore: fct_source_fanout {
  label: "[Modeling] Source Fanout"
   view_label: "[Modeling] Source Fanout"
  group_label: "DBT Project Health"
}

explore: fct_staging_dependent_on_marts_or_intermediate {
  label: "[Modeling] Staging Models Dependent on Downstream Models"
  view_label: "[Modeling] Staging Models Dependent on Downstream Models"
  group_label: "DBT Project Health"
}

explore: fct_staging_dependent_on_staging {
  label: "[Modeling] Staging Models Dependent on Other Staging Models"
  view_label: "[Modeling] Staging Models Dependent on Other Staging Models"
  group_label: "DBT Project Health"
}

explore: fct_unused_sources {
  label: "[Modeling] Unused Sources"
  view_label: "[Modeling] Unused Sources"
  group_label: "DBT Project Health"
}

# Testing

explore: fct_missing_primary_key_tests {
  label: "[Test] Missing Primary Key Tests"
  view_label: "[Test] Missing Primary Key Tests"
  group_label: "DBT Project Health"
}

explore: fct_test_coverage {
  label: "[Test] Test Coverage"
  view_label: "[Test] Test Coverage"
  group_label: "DBT Project Health"
}

# Documentation

explore: fct_documentation_coverage {
  label: "[Documentation] Documentation Coverage"
  view_label: "[Documentation] Documentation Coverage"
  group_label: "DBT Project Health"
}

explore: fct_undocumented_models {
  label: "[Documentation] Undocumented Models"
  view_label: "[Documentation] Undocumented Models"
  group_label: "DBT Project Health"
}

# Structure

explore: fct_model_naming_conventions {
  label: "[Structure] Model Naming Conventions"
  view_label: "[Structure] Model Naming Conventions"
  group_label: "DBT Project Health"
}

explore: fct_model_directories {
  label: "[Structure] Model Directories"
  view_label: "[Structure] Model Directories"
  group_label: "DBT Project Health"
}

explore: fct_source_directories {
  label: "[Structure] Source Directories"
  view_label: "[Structure] Source Directories"
  group_label: "DBT Project Health"
}

explore: fct_test_directories {
  label: "[Structure] Test Directories"
  view_label: "[Structure] Test Directories"
  group_label: "DBT Project Health"
}

# Performance

explore: fct_chained_views_dependencies {
  label: "[Performance] Chained View Dependencies"
  view_label: "[Performance] Chained View Dependencies"
  group_label: "DBT Project Health"
}

explore: fct_exposure_parents_materializations {
  label: "[Performance] Exposure Parents Materializations"
  view_label: "[Performance] Exposure Parents Materializations"
  group_label: "DBT Project Health"
}
