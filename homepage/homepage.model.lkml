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
    {% if _user_attributes['homepage_group'] =='boardmember' %}
    <center>
      <table><tr><td style="color:rgb(58,66,69,0.65);">
        <div style="font-size: 30px">Mattermost Board Homepage</div>
        <div style="font-size: 13px">This Mattermost Board Looker homepage was created to get you started digging into Mattermost Metrics.</div>
        <div style="font-size: 13px; text-align: left;">
          <div ng-bind-html="element.body_text_as_html">
            <br>
            <div style="font-size: 15px">Handbook & Documentation Links</div>
              <ul>
                <li>
                  <a href="https://handbook.mattermost.com/operations/business-operations/analytics/metrics-definitions" target="_blank" style="@{css_link_style};">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Metrics Definitions</a>
                </li>
                <li>
                    <a href="https://handbook.mattermost.com/operations/business-operations/analytics#automating-metrics" target="_blank" style="@{css_link_style};">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Automating Metrics Timeline</a>
                </li>
              </ul>
            <div style="font-size: 15px">Content in Looker</div>
            <ul>
              <li>
                <div>Community</div>
                <ul>
                  <li><a href="https://mattermost.looker.com/dashboards/69" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  GitHub Contributors Dashboard</a></li>
                </ul>
              </li>
              <li>
                <div>Customer Success</div>
                <ul>
                  <li><a href="https://mattermost.looker.com/dashboards/72" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Customer Success Overview</a></li>
                </ul>
              </li>
              <li>
                <div>Finance</div>
                <ul>
                  <li><a href="https://mattermost.looker.com/dashboards/73" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  ARR Overview Dashboard</a></li>
                  <li><a href="https://mattermost.looker.com/dashboards/208" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Financial Statements</a></li>
                </ul>
              </li>
              <li>
                <div>Product</div>
                <ul>
                  <li><a href="https://mattermost.looker.com/dashboards/163" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  NPS Dashboard</a></li>
                  <li><a href="https://mattermost.looker.com/dashboards/76" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  TEDAU Overview Dashboard</a></li>
                  <li><a href="https://mattermost.looker.com/dashboards/75" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  TEDAS Overview Dashboard</a></li>
                  <li><a href="https://mattermost.looker.com/dashboards/83" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Server Download & Activation Funnel</a></li>
                </ul>
              </li>
              <li>
                <div>Customer Journey Lifecycle</div>
                <ul>
                  <li><a href="https://mattermost.looker.com/dashboards/77" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Traffic &amp; Organic Google Search Dashboard</a></li>
                  <li><a href="https://mattermost.looker.com/dashboards/74" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Downloads Dashboard</a></li>
                  <li><a href="https://mattermost.looker.com/dashboards/78" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Trial Requests Dashboard</a></li>
                </ul>
              </li>
            </ul>
            <br>
            <div style="font-size: 15px;">Please reach out to <a href="https://mail.google.com/mail/?view=cm&fs=1&to=aneal@mattermost.com" target="_blank">Aneal Vallurupalli</a> for any questions.</div>
          </div>
        </div>
      </td></tr></table>
      </center>
    {% elsif _user_attributes['homepage_group'] =='mlt' %}
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
                    <a href="https://handbook.mattermost.com/operations/business-operations/analytics/metrics-definitions" target="_blank" style="@{css_link_style};">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Metrics Definitions</a>
                  </li>
                  <li>
                    <a href="https://handbook.mattermost.com/operations/business-operations/analytics#automating-metrics" target="_blank" style="@{css_link_style};">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Automating Metrics Timeline</a>
                  </li>
                  <li>
                    <a href="https://handbook.mattermost.com/operations/business-operations/analytics/looker" target="_blank" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Looker at Mattermost</a>
                  </li>
                  <li>
                    <a href="https://docs.google.com/document/d/14PxD7onptAyE5FcPAZXeR8IjUAg1lq7R-4YfXCv8IF8/edit?usp=sharing" target="_blank" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Provide Feedback on Looker Dashboards</a>
                  </li>
                </ul>
              <div style="font-size: 15px">Content in Looker</div>
              <ul>
                <li><b><a href="https://mattermost.looker.com/dashboards/110" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Weekly Business Review Dashboard</a></b></li>
                <li>
                  Community
                  <ul>
                    <li><a href="https://mattermost.looker.com/dashboards/15" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  GitHub Contributors</a></li>
                  </ul>
                </li>
                <li>
                  <div>Sales</div>
                  <ul>
                    <li><a href="https://mattermost.looker.com/dashboards/86" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Sales (WW)</a></li>
                    <li><a href="https://mattermost.looker.com/dashboards/127" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Sales (Segment)</a></li>
                    <li><a href="https://mattermost.looker.com/dashboards/113" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Sales (Self Service)</a></li>
                  </ul>
                </li>
                <li>
                  <div>Customer Success</div>
                  <ul>
                    <li><a href="https://mattermost.looker.com/dashboards/175" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Customer 360</a></li>
                    <li><a href="https://mattermost.looker.com/dashboards/49" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Customer Success Overview</a></li>
                    <li><a href="https://mattermost.looker.com/dashboards/36" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Customer Success Account Health Score</a></li>
                    <li><a href="https://mattermost.looker.com/dashboards/59" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Support Overview</a></li>
                  </ul>
                </li>
                <li>
                  <div>Finance</div>
                  <ul>
                    <li><a href="https://mattermost.looker.com/dashboards/14" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  ARR Overview</a></li>
                    <li><a href="https://mattermost.looker.com/dashboards/179" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Financial Statements</a></li>
                  </ul>
                </li>
                <li>
                  <div>Product</div>
                  <ul>
                    <li><a href="https://mattermost.looker.com/dashboards/147" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  NPS (Net Promoter Score)</a></li>
                    <li><a href="https://mattermost.looker.com/dashboards/29" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  TEDAU Overview</a></li>
                    <li><a href="https://mattermost.looker.com/dashboards/28" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  TEDAS Overview</a></li>
                    <li><a href="https://mattermost.looker.com/dashboards/68" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Server Download & Activation Funnel</a></li>
                  </ul>
                </li>
                <li>
                  <div>Customer Journey Lifecycle</div>
                  <ul>
                    <li><a href="https://mattermost.looker.com/dashboards/5" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Traffic &amp; Organic Google Search</a></li>
                    <li><a href="https://mattermost.looker.com/dashboards/11" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Downloads</a></li>
                    <li><a href="https://mattermost.looker.com/dashboards/25" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Contact Us Requests</li>
                    <li><a href="https://mattermost.looker.com/dashboards/23" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Trial Requests</a></li>
                    <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  MQL Dashboard - Coming Soon!</li>
                  </ul>
                </li>
              </ul>
              <br>
              <div style="font-size: 20px;" >Looker Quick Links</div>
              <div>
              <a href="https://mattermost.looker.com/browse/favorites" style="@{css_link_style}">My Favorites</a>
              - <a href="https://mattermost.looker.com/browse/recent" style="@{css_link_style}">Recently Viewed</a>
              - <a href="https://mattermost.looker.com/browse/top" style="@{css_link_style}">Popular Content</a>
              - <a href="https://mattermost.looker.com/folders/home" style="@{css_link_style}">Shared Folders</a></div>
              <br>
              <div style="font-size: 15px;"><a href="https://community.mattermost.com/private-core/channels/bizops" target="_blank" style="@{css_link_style}">Ask BizOps Questions</a></div>
            </div>
          </div>
        </td></tr></table>
      </center>
    {% elsif _user_attributes['homepage_group'] =='sales' %}
      <center>
        <table><tr><td style="color:rgb(58,66,69,0.65);">
          <div style="font-size: 30px">Sales Looker Homepage</div>
          <div style="font-size: 13px; text-align: left;">
            <div ng-bind-html="element.body_text_as_html">
              <br>
              <div style="font-size: 15px">Handbook & Documentation Links</div>
                <ul>
                  <li>
                    <a href="https://handbook.mattermost.com/operations/business-operations/analytics/metrics-definitions" target="_blank" style="@{css_link_style};">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Metrics Definitions</a>
                  </li>
                  <li>
                    <a href="https://handbook.mattermost.com/operations/business-operations/analytics#automating-metrics" target="_blank" style="@{css_link_style};">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Automating Metrics Timeline</a>
                  </li>
                  <li>
                    <a href="https://handbook.mattermost.com/operations/business-operations/analytics/looker" target="_blank" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Looker at Mattermost</a>
                  </li>
                  <li>
                    <a href="https://docs.google.com/document/d/14PxD7onptAyE5FcPAZXeR8IjUAg1lq7R-4YfXCv8IF8/edit?usp=sharing" target="_blank" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Provide Feedback on Looker Dashboards</a>
                  </li>
                </ul>
              <div style="font-size: 15px">Sales Content in Looker</div>
              <ul>
                  <li><a href="https://mattermost.looker.com/dashboards/86" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Sales (WW)</a></li>
              </ul>
              <ul>
                  <li><a href="https://mattermost.looker.com/dashboards/127" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Sales (Segment)</a></li>
              </ul>
              <ul>
                  <li><a href="https://mattermost.looker.com/dashboards/113" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Sales (Self Service)</a></li>
              </ul>
              <ul>
                  <li><a href="https://mattermost.looker.com/dashboards/50" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Available Renewals</a></li>
              </ul>
               <ul>
                  <li><a href="https://mattermost.looker.com/dashboards/175" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Customer 360</a></li>
              </ul>
              <br>
              <div style="font-size: 20px;" >Looker Quick Links</div>
              <div>
              <a href="https://mattermost.looker.com/browse/favorites" style="@{css_link_style}">My Favorites</a>
              - <a href="https://mattermost.looker.com/browse/recent" style="@{css_link_style}">Recently Viewed</a>
              - <a href="https://mattermost.looker.com/browse/top" style="@{css_link_style}">Popular Content</a>
              - <a href="https://mattermost.looker.com/folders/home" style="@{css_link_style}">Shared Folders</a></div>
              <br>
              <div style="font-size: 20px;"><a href="https://community.mattermost.com/private-core/channels/bizops" target="_blank" style="@{css_link_style}">Ask BizOps Questions</a></div>
            </div>
          </div>
        </td></tr></table>
      </center>
    {% elsif _user_attributes['homepage_group'] =='default' %}
      <center>
      <table><tr><td style="color:rgb(58,66,69,0.65);">
        <div style="font-size: 30px">Welcome to Looker, {{ _user_attributes['first_name'] }}!</div>
        <div style="font-size: 13px; text-align: left;">
          <div ng-bind-html="element.body_text_as_html">
            <div style="font-size: 15px">
              {% if _user_attributes['role'] == 'Viewer' %}
                You are a {{ _user_attributes['role'] }}.
                Learn more about your {{ _user_attributes['role'] }} role <a href="https://docs.google.com/document/d/1vp3Ce76kOVROy1nj-Us_ZpOAaW0OY-xYbQkoqPqOxi0/edit?usp=sharing#heading=h.ayouhbp6gxq" target="_blank" style="@{css_link_style};">here</a>.
              {% elsif _user_attributes['role'] == 'Explorer' %}
                You are a {{ _user_attributes['role'] }}.
                Learn more about your {{ _user_attributes['role'] }} role <a href="https://docs.google.com/document/d/1vp3Ce76kOVROy1nj-Us_ZpOAaW0OY-xYbQkoqPqOxi0/edit?usp=sharing#heading=h.b3b0e8vgbnrg" target="_blank" style="@{css_link_style};">here</a>.
              {% elsif _user_attributes['role'] == 'Developer' %}
                You are a {{ _user_attributes['role'] }}.
                Learn more about your {{ _user_attributes['role'] }} role <a href="https://docs.google.com/document/d/1vp3Ce76kOVROy1nj-Us_ZpOAaW0OY-xYbQkoqPqOxi0/edit?usp=sharing#heading=h.saf3bubf33za" target="_blank" style="@{css_link_style};">here</a>.
              {% else %}
                You are a {{ _user_attributes['role'] }}.
                Learn more about your {{ _user_attributes['role'] }} role <a href="https://docs.google.com/document/d/1vp3Ce76kOVROy1nj-Us_ZpOAaW0OY-xYbQkoqPqOxi0/edit?usp=sharing#heading=h.dzknxy7m5d24" target="_blank" style="@{css_link_style};">here</a>.
              {% endif %}
            </div>
            <br>
            <div style="font-size: 15px">Handbook & Documentation Links</div>
              <ul>
                <li>
                  <a href="https://handbook.mattermost.com/operations/business-operations/analytics/metrics-definitions" target="_blank" style="@{css_link_style};">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Metrics Definitions</a>
                </li>
                <li>
                  <a href="https://handbook.mattermost.com/operations/business-operations/analytics#automating-metrics" target="_blank" style="@{css_link_style};">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Automating Metrics Timeline</a>
                </li>
                <li>
                  <a href="https://handbook.mattermost.com/operations/business-operations/analytics/looker" target="_blank" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Looker at Mattermost</a>
                </li>
              </ul>
            <div style="font-size: 15px">Content in Looker</div>
            <ul>
              <li>
                Community
                <ul>
                  <li><a href="https://mattermost.looker.com/dashboards/15" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  GitHub Contributors</a></li>
                </ul>
              </li>
              <li>
                  <div>Sales</div>
                  <ul>
                    <li><a href="https://mattermost.looker.com/dashboards/86" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Sales Overview</a></li>
                  </ul>
                </li>
              <li>
                <div>Customer Success</div>
                <ul>
                  <li><a href="https://mattermost.looker.com/dashboards/175" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Customer 360</a></li>
                  <li><a href="https://mattermost.looker.com/dashboards/49" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Customer Success Overview</a></li>
                  <li><a href="https://mattermost.looker.com/dashboards/36" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Customer Success Account Health Score</a></li>
                  <li><a href="https://mattermost.looker.com/dashboards/59" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Support Overview</a></li>
                </ul>
              </li>
              <li>
                <div>Finance</div>
                <ul>
                  <li><a href="https://mattermost.looker.com/dashboards/14" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  ARR Overview</a></li>
                </ul>
              </li>
              <li>
                <div>Product</div>
                <ul>
                  <li><a href="https://mattermost.looker.com/dashboards/41" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  NPS (Net Promoter Score)</a></li>
                  <li><a href="https://mattermost.looker.com/dashboards/29" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  TEDAU Overview</a></li>
                  <li><a href="https://mattermost.looker.com/dashboards/28" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  TEDAS Overview</a></li>
                  <li><a href="https://mattermost.looker.com/dashboards/68" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Server Download & Activation Funnel</a></li>
                </ul>
              </li>
              <li>
                <div>Customer Journey Lifecycle</div>
                <ul>
                  <li><a href="https://mattermost.looker.com/dashboards/5" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Traffic &amp; Organic Google Search</a></li>
                  <li><a href="https://mattermost.looker.com/dashboards/11" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Downloads</a></li>
                  <li><a href="https://mattermost.looker.com/dashboards/25" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Contact Us Requests</li>
                  <li><a href="https://mattermost.looker.com/dashboards/23" style="@{css_link_style}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  Trial Requests</a></li>
                  <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-  MQL Dashboard - Coming Soon!</li>
                </ul>
              </li>
            </ul>
            <br>
            <div style="font-size: 20px;" >Looker Quick Links</div>
            <div>
            <a href="https://mattermost.looker.com/browse/favorites" style="@{css_link_style}">My Favorites</a>
            - <a href="https://mattermost.looker.com/browse/recent" style="@{css_link_style}">Recently Viewed</a>
            - <a href="https://mattermost.looker.com/browse/top" style="@{css_link_style}">Popular Content</a>
            - <a href="https://mattermost.looker.com/folders/home" style="@{css_link_style}">Shared Folders</a></div>
            <br>
            <div style="font-size: 20px;"><a href="https://community.mattermost.com/private-core/channels/bizops" target="_blank" style="@{css_link_style}">Ask BizOps Questions</a></div>
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
