connection: "snowflake"

include: "homepage.dashboard"

explore: _homepage {
  hidden: yes
}

explore: _return_to_homepage {
  hidden: yes
}

view: _homepage {
  # This table does not matter, just need to be valid
  sql_table_name: orgm.account ;;

  measure: _html {
    sql: 1 ;;
    # {% if _user_attributes['is_group_mlt'] %}
    # display:flex;justify-content:center;flex-direction:column; align-content: center; align-items: center
    html:
    {% if "yes" %}
      <div style="display:flex;justify-content:center;flex-direction:column; align-content: center; align-items: center">
        <div style="font-size: 20px">MLT Metrics Overview</div>
        <div style="font-size: 13px; text-align: left;">
          <div ng-bind-html="element.body_text_as_html">
            <div><strong><a href="https://handbook.mattermost.com/operations/business-operations/analytics/metrics-definitions" style="@{css_link_style}">Metrics Definitions</a></strong></div>
            <div><strong>Content in Looker</strong></div>
            <ul>
              <li>
                Community
                <ul>
                  <li><a href="https://mattermost.looker.com/dashboards/15" style="@{css_link_style}">GitHub Contributors Dashboard</a></li>
                </ul>
              </li>
              <li>
                <div>Finance</div>
                <ul>
                  <li><a href="https://mattermost.looker.com/dashboards/14" style="@{css_link_style}">ARR Overview Dashboard</a></li>
                  <li><a href="https://mattermost.looker.com/dashboards/2" style="@{css_link_style}">Current FY Closed Won Opportunities TCV &amp; ARR</a></li>
                  <li><a href="https://mattermost.looker.com/dashboards/9" style="@{css_link_style}">FY21 Renewal ARR Overview</a></li>
                </ul>
              </li>
              <li>
                <div>Product</div>
                <ul>
                  <li><a href="https://mattermost.looker.com/dashboards/16" style="@{css_link_style}">NPS Dashboard</a></li>
                  <li>TEDAU</li>
                  <li>TEDAS</li>
                </ul>
              </li>
              <li>
                <div>Top of Funnel</div>
                <ul>
                  <li><a href="https://mattermost.looker.com/dashboards/5" style="@{css_link_style}">Traffic &amp; Organic Google Search</a></li>
                  <li><a href="https://mattermost.looker.com/dashboards/11" style="@{css_link_style}">Downloads Dashboard</a></li>
                  <li>Contact Us</li>
                  <li><a href="https://mattermost.looker.com/dashboards/23" style="@{css_link_style}">Trials Dashboard</a></li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </div>
    {% else %}
      <script type="text/javascript">
        window.location.href = "/";
      </script>asdf
    {% endif %} ;;
  }
}

view: _return_to_homepage {
  # This table does not matter, just need to be valid
  sql_table_name: orgm.account ;;

  measure: _html {
    sql: 1 ;;
    html:
    <div style="font-size: 13px">
      {% if _user_attributes['is_group_mlt'] %}
      <a href="/dashboards/24" style="@{css_link_style}">
        Return to MLT Overview
      </a>
      {% else %}
      <a href="/" style="@{css_link_style}">
        Return to Homepage
      </a>
      {% endif %}
    </div>
    ;;
  }
}
