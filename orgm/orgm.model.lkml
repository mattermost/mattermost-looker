connection: "orgm"

include: "/orgm/orgm_views/*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore: account {}
explore: product2 {}
