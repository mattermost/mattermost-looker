connection: "snowflake"

include: "homepage.dashboard"

explore: _homepage {
  hidden: yes
}

explore: _return_to_homepage {
  hidden: yes
}

# Based on comments found in https://discourse.looker.com/t/custom-looker-home-page-labs-feature/2821/17
view: _homepage {
  # This table does not matter, just need to be valid
  sql_table_name: util.dates ;;

  measure: _html {
    sql: 1 ;;
    html:
    {% if {{_user_attributes['is_group_mlt']}} %}
    <center>
      <table><tr><td style="color:rgb(58,66,69,0.65);">
        <div style="font-size: 30px">MLT Looker Homepage</div>
        <div style="font-size: 12px">BizOps created this MLT Only homepage to get you started on your MLT Metrics journey.</div>
        <div style="font-size: 12px">There are many other ways to use Looker, but we wanted to make it super easy to get started.</div>
        <div style="font-size: 13px; text-align: left;">
          <div ng-bind-html="element.body_text_as_html">
            <br>
            <div style="font-size: 15px">Handbook & Documentation Links</div>
              <ul>
                <li>
                  <a href="https://handbook.mattermost.com/operations/business-operations/analytics/metrics-definitions" style="@{css_link_style};">Metrics Definitions</a>
                </li>
                <li>
                  <a href="https://handbook.mattermost.com/operations/business-operations/analytics#automating-metrics" style="@{css_link_style};">Automating Metrics Timeline</a>
                </li>
                <li>
                  <a href="https://handbook.mattermost.com/operations/business-operations/analytics/looker" style="@{css_link_style}">Looker at Mattermost</a>
                </li>
                <li>
                  <a href="https://docs.google.com/document/d/14PxD7onptAyE5FcPAZXeR8IjUAg1lq7R-4YfXCv8IF8/edit?usp=sharing" style="@{css_link_style}">Provide Feedback on Looker Dashboards</a>
                </li>
              </ul>
            <div style="font-size: 15px">Content in Looker</div>
            <ul>
              <li>
                Community
                <ul>
                  <li><a href="https://mattermost.looker.com/dashboards/15" style="@{css_link_style}">GitHub Contributors Dashboard</a></li>
                </ul>
              </li>
              <li>
                <div>Customer Success</div>
                <ul>
                  <li><a href="https://mattermost.looker.com/dashboards/49" style="@{css_link_style}">Customer Success Overview</a></li>
                </ul>
                <ul>
                  <li><a href="https://mattermost.looker.com/dashboards/36" style="@{css_link_style}">Customer Success Account Health Score</a></li>
                </ul>
              </li>
              <li>
                <div>Finance</div>
                <ul>
                  <li><a href="https://mattermost.looker.com/dashboards/14" style="@{css_link_style}">ARR Overview Dashboard</a></li>
                </ul>
              </li>
              <li>
                <div>Product</div>
                <ul>
                  <li><a href="https://mattermost.looker.com/dashboards/41" style="@{css_link_style}">NPS Dashboard</a></li>
                  <li><a href="https://mattermost.looker.com/dashboards/29" style="@{css_link_style}">TEDAU Overview Dashboard</a></li>
                  <li><a href="https://mattermost.looker.com/dashboards/28" style="@{css_link_style}">TEDAS Overview Dashboard</a></li>
                </ul>
              </li>
              <li>
                <div>Customer Journey Lifecycle</div>
                <ul>
                  <li><a href="https://mattermost.looker.com/dashboards/5" style="@{css_link_style}">Traffic &amp; Organic Google Search Dashboard</a></li>
                  <li><a href="https://mattermost.looker.com/dashboards/11" style="@{css_link_style}">Downloads Dashboard</a></li>
                  <li><a href="https://mattermost.looker.com/dashboards/25" style="@{css_link_style}">Contact Us Requests Dashboard</li>
                  <li><a href="https://mattermost.looker.com/dashboards/23" style="@{css_link_style}">Trial Requests Dashboard</a></li>
                  <li>MQL Dashboard - Coming Soon!</li>
                </ul>
              </li>
            </ul>
            <div style="font-size: 20px;" >Looker Quick Links</div>
            <div>
            <a href="https://mattermost.looker.com/browse/favorites" style="@{css_link_style}">My Favorites</a>
            - <a href="https://mattermost.looker.com/browse/recent" style="@{css_link_style}">Recently Viewed</a>
            - <a href="https://mattermost.looker.com/browse/top" style="@{css_link_style}">Popular Content</a>
            - <a href="https://mattermost.looker.com/folders/home" style="@{css_link_style}">Shared Folders</a></div>
            <br>
            <div style="font-size: 20px;"><a href="https://community.mattermost.com/private-core/channels/bizops" style="@{css_link_style}">Ask BizOps Questions</a></div>
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
                <div style="font-size: 25px;" >Looker is not yet GA at Mattermost.</div>
                <div><strong>We are in the process of a slow roll out with only a few early adopters.</strong></div>
                <br>
                <div>While someone may have sent you a link or you are able to successfully log in, you have been placed in holding group with no access.
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
    <div style="font-size: 15px;">
      {% if _user_attributes['is_group_mlt'] %}
      <a href="/" style="@{css_link_style}">
        Return to MLT Homepage
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
