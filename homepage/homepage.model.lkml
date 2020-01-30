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
  sql_table_name: util.dates ;;

  measure: _html {
    sql: 1 ;;
    html:
    {% if {{_user_attributes['is_group_mlt']}} %}
    <center>
      <table><tr><td style="color:rgb(58,66,69,0.65);">
        <div style="font-size: 40px; text-align: center;">Welcome to Looker, {{ _user_attributes['first_name'] }}!</div>
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
      </td></tr></table>
      </center>
    {% elsif _user_attributes['assigned_to_group'] %}
        <center>
          <table><tr><td style="color:rgb(58,66,69,0.65);">
            <div style="font-size: 40px; text-align: center;">Welcome to Looker, {{ _user_attributes['first_name'] }}!</div>
            <div style="font-size: 20px; text-align: center;">
              <br>
              <div ng-bind-html="element.body_text_as_html">
                <div style="font-size: 25px;" >Looker Quick Links</div>
                <div><a href="https://mattermost.looker.com/browse/favorites" style="@{css_link_style}">My Favorites</a></div>
                <div><a href="https://mattermost.looker.com/browse/recent" style="@{css_link_style}">Recently Viewed</a></div>
                <div><a href="https://mattermost.looker.com/browse/top" style="@{css_link_style}">Popular Content</a></div>
                <div><a href="https://mattermost.looker.com/folders/home" style="@{css_link_style}">Shared Folders</a></div>
                <br>
                <div style="font-size: 25px;">Documentation</div>
                <div><a href="https://handbook.mattermost.com/operations/business-operations/analytics/looker" style="@{css_link_style}">Looker at Mattermost</a></div>
                <div><a href="https://handbook.mattermost.com/operations/business-operations/analytics/metrics-definitions" style="@{css_link_style}">Metrics Definitions</a></div>
                <br>
                <div><a href="https://community.mattermost.com/private-core/channels/bizops" style="font-size: 25px; color: #49719a;">Ask Us Questions</a></div>
              </div>
            </div>
          </td></tr></table>
        </center>
    {% else %}
        <center>
          <table><tr><td style="color:rgb(58,66,69,0.65);">
            <div style="font-size: 40px; text-align: center;">Welcome to Looker, {{ _user_attributes['first_name'] }}!</div>
            <div style="font-size: 20px; text-align: center;">
              <br>
              <div ng-bind-html="element.body_text_as_html">
                <div style="font-size: 25px;" >Unfortunately, Looker is currently not GA at Mattermost.</div>
                <div>We are in the process of a slow roll out with only a few early adopters. While someone may have sent you a link or you are able to successfully log in, you are currently in holding group with very limited access.
                <div></div>
                <div>If you feel you are meant to be part of the early adopter group and are unable to access Looker, please reach out to us in <a href="https://community.mattermost.com/private-core/channels/bizops" style="font-size: 25px; color: #49719a;">BizOps</a>.</div>
              </div>
            </div>
          </td></tr></table>
        </center>
    {% endif %} ;;
  }
}

view: _return_to_homepage {
  # This table does not matter, just need to be valid
  sql_table_name: util.dates ;;

  measure: _html {
    sql: 1 ;;
    type: number
    html:
    <div style="font-size: 15px;font-weight: bold;">
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
