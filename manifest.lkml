# project_name: "data_warehouse"

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }

# BP: Leverage reuse with URLs when applicable
constant: salesforce_link {
  value: "https://mattermost.lightning.force.com/"
}

constant: zendesk_link {
  value: "https://mattermost.zendesk.com/agent/"
}

constant: percent {
  value: "0.0\%"
}

constant: decimal {
  value: "0.0"
}

constant: css_link_style {
  value: "color: #49719a;"
}

# # BP: Leverage reuse with formatting when applicable
# constant: colored_tiered_percent {
#   value: "{% if value <= 25 %}<p style=\"color:red; \">Low</p>{% elsif value > 25 and value <= 75  %}<p style=\"color:#FFBF00; \">Medium</p>{% else %}<p style=\"color:green; \">High</p>{% endif %}"
# }

# constant: cond_style_attain {
#   value: "{% if value < 70 %}
#     <p style=\"color:#A00706; \">{{ rendered_value }}</p>
#     {% elsif value >= 70 and value < 100  %}<p style=\"color:#F1A40A;\">{{ rendered_value }}</p>
#     {% else %}<p style=\"color:#306843;\">{{ rendered_value }}</p>
#     {% endif %}"
# }
