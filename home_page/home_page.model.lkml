connection: "snowflake"

include: "home_page.dashboard"

explore: _home_page {}

view: _home_page {
  # This table does not matter, just need to be valid
  sql_table_name: orgm.account ;;

  measure: _html {
    sql: 1 ;;
    html:
    {% if _user_attributes['is_group_mlt'] %}
      <div class="body-text text-muted" ng-if="element.body_text_as_html" ng-style="bodyTextIsParagraph() ? {'text-align': 'left'} : {'text-align': 'center'}" style="text-align: left;">
        <div ng-bind-html="element.body_text_as_html">
          <p><strong><a href="https://handbook.mattermost.com/operations/business-operations/analytics/metrics-definitions">Metrics Definitions</a></strong></p>
          <p><strong>Content in Looker</strong></p>
          <ul>
            <li>
              Community
              <ul>
                <li><a href="https://mattermost.looker.com/dashboards/15">GitHub Contributors Dashboard</a></li>
              </ul>
            </li>
            <li>
              <p>Finance</p>
              <ul>
                <li><a href="https://mattermost.looker.com/dashboards/14">ARR Overview Dashboard</a></li>
                <li><a href="https://mattermost.looker.com/dashboards/2">Current FY Closed Won Opportunities TCV &amp; ARR</a></li>
                <li><a href="https://mattermost.looker.com/dashboards/9">FY21 Renewal ARR Overview</a></li>
              </ul>
            </li>
            <li>
              <p>Product</p>
              <ul>
                <li><a href="https://mattermost.looker.com/dashboards/16">NPS Dashboard</a></li>
                <li>TEDAU</li>
                <li>TEDAS</li>
              </ul>
            </li>
            <li>
              <p>Top of Funnel</p>
              <ul>
                <li><a href="https://mattermost.looker.com/dashboards/5">Traffic &amp; Organic Google Search</a></li>
                <li><a href="https://mattermost.looker.com/dashboards/11">Downloads Dashboard</a></li>
                <li>Contact Us</li>
                <li><a href="https://mattermost.looker.com/dashboards/23">Trials Dashboard</a></li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    {% else %}
      <script type="text/javascript">
        window.location.href = "/";
      </script>asdf
    {% endif %} ;;
  }
}
