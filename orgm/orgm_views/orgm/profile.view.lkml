view: profile {
  sql_table_name: orgm.profile ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: _hc_err {
    type: string
    sql: ${TABLE}."_hc_err" ;;
  }

  dimension: _hc_lastop {
    type: string
    sql: ${TABLE}."_hc_lastop" ;;
  }

  dimension: createdbyid {
    type: string
    sql: ${TABLE}."createdbyid" ;;
  }

  dimension_group: createddate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."createddate" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."description" ;;
  }

  dimension: lastmodifiedbyid {
    type: string
    sql: ${TABLE}."lastmodifiedbyid" ;;
  }

  dimension_group: lastmodifieddate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."lastmodifieddate" ;;
  }

  dimension_group: lastreferenceddate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."lastreferenceddate" ;;
  }

  dimension_group: lastvieweddate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."lastvieweddate" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: accesscmc {
    type: yesno
    sql: ${TABLE}."permissionsaccesscmc" ;;
  }

  dimension: activatecontract {
    type: yesno
    sql: ${TABLE}."permissionsactivatecontract" ;;
  }

  dimension: activateorder {
    type: yesno
    sql: ${TABLE}."permissionsactivateorder" ;;
  }

  dimension: activitiesaccess {
    type: yesno
    sql: ${TABLE}."permissionsactivitiesaccess" ;;
  }

  dimension: adddirectmessagemembers {
    type: yesno
    sql: ${TABLE}."permissionsadddirectmessagemembers" ;;
  }

  dimension: allowemailic {
    type: yesno
    sql: ${TABLE}."permissionsallowemailic" ;;
  }

  dimension: allowlightninglogin {
    type: yesno
    sql: ${TABLE}."permissionsallowlightninglogin" ;;
  }

  dimension: allowvieweditconvertedleads {
    type: yesno
    sql: ${TABLE}."permissionsallowvieweditconvertedleads" ;;
  }

  dimension: apexrestservices {
    type: yesno
    sql: ${TABLE}."permissionsapexrestservices" ;;
  }

  dimension: apienabled {
    type: yesno
    sql: ${TABLE}."permissionsapienabled" ;;
  }

  dimension: apiuseronly {
    type: yesno
    sql: ${TABLE}."permissionsapiuseronly" ;;
  }

  dimension: assignpermissionsets {
    type: yesno
    sql: ${TABLE}."permissionsassignpermissionsets" ;;
  }

  dimension: assigntopics {
    type: yesno
    sql: ${TABLE}."permissionsassigntopics" ;;
  }

  dimension: authorapex {
    type: yesno
    sql: ${TABLE}."permissionsauthorapex" ;;
  }

  dimension: automaticactivitycapture {
    type: yesno
    sql: ${TABLE}."permissionsautomaticactivitycapture" ;;
  }

  dimension: b2bmarketinganalyticsuser {
    type: yesno
    sql: ${TABLE}."permissionsb2bmarketinganalyticsuser" ;;
  }

  dimension: bulkapiharddelete {
    type: yesno
    sql: ${TABLE}."permissionsbulkapiharddelete" ;;
  }

  dimension: bulkmacrosallowed {
    type: yesno
    sql: ${TABLE}."permissionsbulkmacrosallowed" ;;
  }

  dimension: campaigninfluence2 {
    type: yesno
    sql: ${TABLE}."permissionscampaigninfluence2" ;;
  }

  dimension: canapprovefeedpost {
    type: yesno
    sql: ${TABLE}."permissionscanapprovefeedpost" ;;
  }

  dimension: caneditprompts {
    type: yesno
    sql: ${TABLE}."permissionscaneditprompts" ;;
  }

  dimension: caninsertfeedsystemfields {
    type: yesno
    sql: ${TABLE}."permissionscaninsertfeedsystemfields" ;;
  }

  dimension: canusenewdashboardbuilder {
    type: yesno
    sql: ${TABLE}."permissionscanusenewdashboardbuilder" ;;
  }

  dimension: canverifycomment {
    type: yesno
    sql: ${TABLE}."permissionscanverifycomment" ;;
  }

  dimension: changedashboardcolors {
    type: yesno
    sql: ${TABLE}."permissionschangedashboardcolors" ;;
  }

  dimension: chattercomposeuicodesnippet {
    type: yesno
    sql: ${TABLE}."permissionschattercomposeuicodesnippet" ;;
  }

  dimension: chattereditownpost {
    type: yesno
    sql: ${TABLE}."permissionschattereditownpost" ;;
  }

  dimension: chattereditownrecordpost {
    type: yesno
    sql: ${TABLE}."permissionschattereditownrecordpost" ;;
  }

  dimension: chatterfilelink {
    type: yesno
    sql: ${TABLE}."permissionschatterfilelink" ;;
  }

  dimension: chatterinternaluser {
    type: yesno
    sql: ${TABLE}."permissionschatterinternaluser" ;;
  }

  dimension: chatterinviteexternalusers {
    type: yesno
    sql: ${TABLE}."permissionschatterinviteexternalusers" ;;
  }

  dimension: chatterowngroups {
    type: yesno
    sql: ${TABLE}."permissionschatterowngroups" ;;
  }

  dimension: closeconversations {
    type: yesno
    sql: ${TABLE}."permissionscloseconversations" ;;
  }

  dimension: configcustomrecs {
    type: yesno
    sql: ${TABLE}."permissionsconfigcustomrecs" ;;
  }

  dimension: connectorgtoenvironmenthub {
    type: yesno
    sql: ${TABLE}."permissionsconnectorgtoenvironmenthub" ;;
  }

  dimension: contentadministrator {
    type: yesno
    sql: ${TABLE}."permissionscontentadministrator" ;;
  }

  dimension: contenthubuser {
    type: yesno
    sql: ${TABLE}."permissionscontenthubuser" ;;
  }

  dimension: contentworkspaces {
    type: yesno
    sql: ${TABLE}."permissionscontentworkspaces" ;;
  }

  dimension: convertleads {
    type: yesno
    sql: ${TABLE}."permissionsconvertleads" ;;
  }

  dimension: createauditfields {
    type: yesno
    sql: ${TABLE}."permissionscreateauditfields" ;;
  }

  dimension: createcustomizedashboards {
    type: yesno
    sql: ${TABLE}."permissionscreatecustomizedashboards" ;;
  }

  dimension: createcustomizefilters {
    type: yesno
    sql: ${TABLE}."permissionscreatecustomizefilters" ;;
  }

  dimension: createcustomizereports {
    type: yesno
    sql: ${TABLE}."permissionscreatecustomizereports" ;;
  }

  dimension: createdashboardfolders {
    type: yesno
    sql: ${TABLE}."permissionscreatedashboardfolders" ;;
  }

  dimension: createltngtempfolder {
    type: yesno
    sql: ${TABLE}."permissionscreateltngtempfolder" ;;
  }

  dimension: createltngtempinpub {
    type: yesno
    sql: ${TABLE}."permissionscreateltngtempinpub" ;;
  }

  dimension: createmultiforce {
    type: yesno
    sql: ${TABLE}."permissionscreatemultiforce" ;;
  }

  dimension: createreportfolders {
    type: yesno
    sql: ${TABLE}."permissionscreatereportfolders" ;;
  }

  dimension: createreportinlightning {
    type: yesno
    sql: ${TABLE}."permissionscreatereportinlightning" ;;
  }

  dimension: createtopics {
    type: yesno
    sql: ${TABLE}."permissionscreatetopics" ;;
  }

  dimension: createworkbadgedefinition {
    type: yesno
    sql: ${TABLE}."permissionscreateworkbadgedefinition" ;;
  }

  dimension: createworkspaces {
    type: yesno
    sql: ${TABLE}."permissionscreateworkspaces" ;;
  }

  dimension: customizeapplication {
    type: yesno
    sql: ${TABLE}."permissionscustomizeapplication" ;;
  }

  dimension: custommobileappsaccess {
    type: yesno
    sql: ${TABLE}."permissionscustommobileappsaccess" ;;
  }

  dimension: dataexport {
    type: yesno
    sql: ${TABLE}."permissionsdataexport" ;;
  }

  dimension: delegatedtwofactor {
    type: yesno
    sql: ${TABLE}."permissionsdelegatedtwofactor" ;;
  }

  dimension: deleteactivatedcontract {
    type: yesno
    sql: ${TABLE}."permissionsdeleteactivatedcontract" ;;
  }

  dimension: deletetopics {
    type: yesno
    sql: ${TABLE}."permissionsdeletetopics" ;;
  }

  dimension: distributefromperswksp {
    type: yesno
    sql: ${TABLE}."permissionsdistributefromperswksp" ;;
  }

  dimension: editactivatedorders {
    type: yesno
    sql: ${TABLE}."permissionseditactivatedorders" ;;
  }

  dimension: editbrandtemplates {
    type: yesno
    sql: ${TABLE}."permissionseditbrandtemplates" ;;
  }

  dimension: editcasecomments {
    type: yesno
    sql: ${TABLE}."permissionseditcasecomments" ;;
  }

  dimension: editevent {
    type: yesno
    sql: ${TABLE}."permissionseditevent" ;;
  }

  dimension: edithtmltemplates {
    type: yesno
    sql: ${TABLE}."permissionsedithtmltemplates" ;;
  }

  dimension: editmydashboards {
    type: yesno
    sql: ${TABLE}."permissionseditmydashboards" ;;
  }

  dimension: editmyreports {
    type: yesno
    sql: ${TABLE}."permissionseditmyreports" ;;
  }

  dimension: editopplineitemunitprice {
    type: yesno
    sql: ${TABLE}."permissionseditopplineitemunitprice" ;;
  }

  dimension: editpublicdocuments {
    type: yesno
    sql: ${TABLE}."permissionseditpublicdocuments" ;;
  }

  dimension: editpublicfilters {
    type: yesno
    sql: ${TABLE}."permissionseditpublicfilters" ;;
  }

  dimension: editpublictemplates {
    type: yesno
    sql: ${TABLE}."permissionseditpublictemplates" ;;
  }

  dimension: editreadonlyfields {
    type: yesno
    sql: ${TABLE}."permissionseditreadonlyfields" ;;
  }

  dimension: edittask {
    type: yesno
    sql: ${TABLE}."permissionsedittask" ;;
  }

  dimension: edittopics {
    type: yesno
    sql: ${TABLE}."permissionsedittopics" ;;
  }

  dimension: emailadministration {
    type: yesno
    sql: ${TABLE}."permissionsemailadministration" ;;
  }

  dimension: emailmass {
    type: yesno
    sql: ${TABLE}."permissionsemailmass" ;;
  }

  dimension: emailsingle {
    type: yesno
    sql: ${TABLE}."permissionsemailsingle" ;;
  }

  dimension: emailtemplatemanagement {
    type: yesno
    sql: ${TABLE}."permissionsemailtemplatemanagement" ;;
  }

  dimension: enablecommunityapplauncher {
    type: yesno
    sql: ${TABLE}."permissionsenablecommunityapplauncher" ;;
  }

  dimension: enablenotifications {
    type: yesno
    sql: ${TABLE}."permissionsenablenotifications" ;;
  }

  dimension: exportreport {
    type: yesno
    sql: ${TABLE}."permissionsexportreport" ;;
  }

  dimension: feedpinning {
    type: yesno
    sql: ${TABLE}."permissionsfeedpinning" ;;
  }

  dimension: flowuflrequired {
    type: yesno
    sql: ${TABLE}."permissionsflowuflrequired" ;;
  }

  dimension: forcetwofactor {
    type: yesno
    sql: ${TABLE}."permissionsforcetwofactor" ;;
  }

  dimension: giverecognitionbadge {
    type: yesno
    sql: ${TABLE}."permissionsgiverecognitionbadge" ;;
  }

  dimension: governnetworks {
    type: yesno
    sql: ${TABLE}."permissionsgovernnetworks" ;;
  }

  dimension: hasunlimitednbaexecutions {
    type: yesno
    sql: ${TABLE}."permissionshasunlimitednbaexecutions" ;;
  }

  dimension: hidereadbylist {
    type: yesno
    sql: ${TABLE}."permissionshidereadbylist" ;;
  }

  dimension: identityconnect {
    type: yesno
    sql: ${TABLE}."permissionsidentityconnect" ;;
  }

  dimension: identityenabled {
    type: yesno
    sql: ${TABLE}."permissionsidentityenabled" ;;
  }

  dimension: importcustomobjects {
    type: yesno
    sql: ${TABLE}."permissionsimportcustomobjects" ;;
  }

  dimension: importleads {
    type: yesno
    sql: ${TABLE}."permissionsimportleads" ;;
  }

  dimension: importpersonal {
    type: yesno
    sql: ${TABLE}."permissionsimportpersonal" ;;
  }

  dimension: inboundmigrationtoolsuser {
    type: yesno
    sql: ${TABLE}."permissionsinboundmigrationtoolsuser" ;;
  }

  dimension: installmultiforce {
    type: yesno
    sql: ${TABLE}."permissionsinstallmultiforce" ;;
  }

  dimension: lightningconsoleallowedforuser {
    type: yesno
    sql: ${TABLE}."permissionslightningconsoleallowedforuser" ;;
  }

  dimension: lightningexperienceuser {
    type: yesno
    sql: ${TABLE}."permissionslightningexperienceuser" ;;
  }

  dimension: listemailsend {
    type: yesno
    sql: ${TABLE}."permissionslistemailsend" ;;
  }

  dimension: lmoutboundmessaginguserperm {
    type: yesno
    sql: ${TABLE}."permissionslmoutboundmessaginguserperm" ;;
  }

  dimension: ltngpromoreserved01userperm {
    type: yesno
    sql: ${TABLE}."permissionsltngpromoreserved01userperm" ;;
  }

  dimension: manageanalyticsnapshots {
    type: yesno
    sql: ${TABLE}."permissionsmanageanalyticsnapshots" ;;
  }

  dimension: manageauthproviders {
    type: yesno
    sql: ${TABLE}."permissionsmanageauthproviders" ;;
  }

  dimension: managebusinesshourholidays {
    type: yesno
    sql: ${TABLE}."permissionsmanagebusinesshourholidays" ;;
  }

  dimension: managecallcenters {
    type: yesno
    sql: ${TABLE}."permissionsmanagecallcenters" ;;
  }

  dimension: managecases {
    type: yesno
    sql: ${TABLE}."permissionsmanagecases" ;;
  }

  dimension: managecategories {
    type: yesno
    sql: ${TABLE}."permissionsmanagecategories" ;;
  }

  dimension: managecertificates {
    type: yesno
    sql: ${TABLE}."permissionsmanagecertificates" ;;
  }

  dimension: managechattermessages {
    type: yesno
    sql: ${TABLE}."permissionsmanagechattermessages" ;;
  }

  dimension: managecms {
    type: yesno
    sql: ${TABLE}."permissionsmanagecms" ;;
  }

  dimension: managecontentpermissions {
    type: yesno
    sql: ${TABLE}."permissionsmanagecontentpermissions" ;;
  }

  dimension: managecontentproperties {
    type: yesno
    sql: ${TABLE}."permissionsmanagecontentproperties" ;;
  }

  dimension: managecontenttypes {
    type: yesno
    sql: ${TABLE}."permissionsmanagecontenttypes" ;;
  }

  dimension: managecustompermissions {
    type: yesno
    sql: ${TABLE}."permissionsmanagecustompermissions" ;;
  }

  dimension: managecustomreporttypes {
    type: yesno
    sql: ${TABLE}."permissionsmanagecustomreporttypes" ;;
  }

  dimension: managedashbdsinpubfolders {
    type: yesno
    sql: ${TABLE}."permissionsmanagedashbdsinpubfolders" ;;
  }

  dimension: managedatacategories {
    type: yesno
    sql: ${TABLE}."permissionsmanagedatacategories" ;;
  }

  dimension: managedataintegrations {
    type: yesno
    sql: ${TABLE}."permissionsmanagedataintegrations" ;;
  }

  dimension: manageemailclientconfig {
    type: yesno
    sql: ${TABLE}."permissionsmanageemailclientconfig" ;;
  }

  dimension: manageexchangeconfig {
    type: yesno
    sql: ${TABLE}."permissionsmanageexchangeconfig" ;;
  }

  dimension: managehealthcheck {
    type: yesno
    sql: ${TABLE}."permissionsmanagehealthcheck" ;;
  }

  dimension: managehubconnections {
    type: yesno
    sql: ${TABLE}."permissionsmanagehubconnections" ;;
  }

  dimension: manageinteraction {
    type: yesno
    sql: ${TABLE}."permissionsmanageinteraction" ;;
  }

  dimension: manageinternalusers {
    type: yesno
    sql: ${TABLE}."permissionsmanageinternalusers" ;;
  }

  dimension: manageipaddresses {
    type: yesno
    sql: ${TABLE}."permissionsmanageipaddresses" ;;
  }

  dimension: manageleads {
    type: yesno
    sql: ${TABLE}."permissionsmanageleads" ;;
  }

  dimension: manageloginaccesspolicies {
    type: yesno
    sql: ${TABLE}."permissionsmanageloginaccesspolicies" ;;
  }

  dimension: managemobile {
    type: yesno
    sql: ${TABLE}."permissionsmanagemobile" ;;
  }

  dimension: managenetworks {
    type: yesno
    sql: ${TABLE}."permissionsmanagenetworks" ;;
  }

  dimension: managepasswordpolicies {
    type: yesno
    sql: ${TABLE}."permissionsmanagepasswordpolicies" ;;
  }

  dimension: manageprofilespermissionsets {
    type: yesno
    sql: ${TABLE}."permissionsmanageprofilespermissionsets" ;;
  }

  dimension: managepropositions {
    type: yesno
    sql: ${TABLE}."permissionsmanagepropositions" ;;
  }

  dimension: managepvtrptsanddashbds {
    type: yesno
    sql: ${TABLE}."permissionsmanagepvtrptsanddashbds" ;;
  }

  dimension: managequotas {
    type: yesno
    sql: ${TABLE}."permissionsmanagequotas" ;;
  }

  dimension: managerecommendationstrategies {
    type: yesno
    sql: ${TABLE}."permissionsmanagerecommendationstrategies" ;;
  }

  dimension: manageremoteaccess {
    type: yesno
    sql: ${TABLE}."permissionsmanageremoteaccess" ;;
  }

  dimension: managereportsinpubfolders {
    type: yesno
    sql: ${TABLE}."permissionsmanagereportsinpubfolders" ;;
  }

  dimension: manageroles {
    type: yesno
    sql: ${TABLE}."permissionsmanageroles" ;;
  }

  dimension: managesandboxes {
    type: yesno
    sql: ${TABLE}."permissionsmanagesandboxes" ;;
  }

  dimension: managesessionpermissionsets {
    type: yesno
    sql: ${TABLE}."permissionsmanagesessionpermissionsets" ;;
  }

  dimension: managesharing {
    type: yesno
    sql: ${TABLE}."permissionsmanagesharing" ;;
  }

  dimension: managesolutions {
    type: yesno
    sql: ${TABLE}."permissionsmanagesolutions" ;;
  }

  dimension: managesubscriptions {
    type: yesno
    sql: ${TABLE}."permissionsmanagesubscriptions" ;;
  }

  dimension: managesurveys {
    type: yesno
    sql: ${TABLE}."permissionsmanagesurveys" ;;
  }

  dimension: managesynonyms {
    type: yesno
    sql: ${TABLE}."permissionsmanagesynonyms" ;;
  }

  dimension: managetwofactor {
    type: yesno
    sql: ${TABLE}."permissionsmanagetwofactor" ;;
  }

  dimension: manageunlistedgroups {
    type: yesno
    sql: ${TABLE}."permissionsmanageunlistedgroups" ;;
  }

  dimension: manageusers {
    type: yesno
    sql: ${TABLE}."permissionsmanageusers" ;;
  }

  dimension: massinlineedit {
    type: yesno
    sql: ${TABLE}."permissionsmassinlineedit" ;;
  }

  dimension: mergetopics {
    type: yesno
    sql: ${TABLE}."permissionsmergetopics" ;;
  }

  dimension: moderatechatter {
    type: yesno
    sql: ${TABLE}."permissionsmoderatechatter" ;;
  }

  dimension: moderatenetworkusers {
    type: yesno
    sql: ${TABLE}."permissionsmoderatenetworkusers" ;;
  }

  dimension: modifyalldata {
    type: yesno
    sql: ${TABLE}."permissionsmodifyalldata" ;;
  }

  dimension: modifydataclassification {
    type: yesno
    sql: ${TABLE}."permissionsmodifydataclassification" ;;
  }

  dimension: modifymetadata {
    type: yesno
    sql: ${TABLE}."permissionsmodifymetadata" ;;
  }

  dimension: newreportbuilder {
    type: yesno
    sql: ${TABLE}."permissionsnewreportbuilder" ;;
  }

  dimension: outboundmigrationtoolsuser {
    type: yesno
    sql: ${TABLE}."permissionsoutboundmigrationtoolsuser" ;;
  }

  dimension: overrideforecasts {
    type: yesno
    sql: ${TABLE}."permissionsoverrideforecasts" ;;
  }

  dimension: packaging2 {
    type: yesno
    sql: ${TABLE}."permissionspackaging2" ;;
  }

  dimension: passwordneverexpires {
    type: yesno
    sql: ${TABLE}."permissionspasswordneverexpires" ;;
  }

  dimension: preventclassicexperience {
    type: yesno
    sql: ${TABLE}."permissionspreventclassicexperience" ;;
  }

  dimension: privacydataaccess {
    type: yesno
    sql: ${TABLE}."permissionsprivacydataaccess" ;;
  }

  dimension: publishmultiforce {
    type: yesno
    sql: ${TABLE}."permissionspublishmultiforce" ;;
  }

  dimension: queryallfiles {
    type: yesno
    sql: ${TABLE}."permissionsqueryallfiles" ;;
  }

  dimension: recordvisibilityapi {
    type: yesno
    sql: ${TABLE}."permissionsrecordvisibilityapi" ;;
  }

  dimension: removedirectmessagemembers {
    type: yesno
    sql: ${TABLE}."permissionsremovedirectmessagemembers" ;;
  }

  dimension: resetpasswords {
    type: yesno
    sql: ${TABLE}."permissionsresetpasswords" ;;
  }

  dimension: runflow {
    type: yesno
    sql: ${TABLE}."permissionsrunflow" ;;
  }

  dimension: runreports {
    type: yesno
    sql: ${TABLE}."permissionsrunreports" ;;
  }

  dimension: salesconsole {
    type: yesno
    sql: ${TABLE}."permissionssalesconsole" ;;
  }

  dimension: salesforceiqinbox {
    type: yesno
    sql: ${TABLE}."permissionssalesforceiqinbox" ;;
  }

  dimension: sandboxtestingincommunityapp {
    type: yesno
    sql: ${TABLE}."permissionssandboxtestingincommunityapp" ;;
  }

  dimension: schedulejob {
    type: yesno
    sql: ${TABLE}."permissionsschedulejob" ;;
  }

  dimension: schedulereports {
    type: yesno
    sql: ${TABLE}."permissionsschedulereports" ;;
  }

  dimension: selectfilesfromsalesforce {
    type: yesno
    sql: ${TABLE}."permissionsselectfilesfromsalesforce" ;;
  }

  dimension: sendannouncementemails {
    type: yesno
    sql: ${TABLE}."permissionssendannouncementemails" ;;
  }

  dimension: sendsitrequests {
    type: yesno
    sql: ${TABLE}."permissionssendsitrequests" ;;
  }

  dimension: showcompanynameasuserbadge {
    type: yesno
    sql: ${TABLE}."permissionsshowcompanynameasuserbadge" ;;
  }

  dimension: socialinsightslogoadmin {
    type: yesno
    sql: ${TABLE}."permissionssocialinsightslogoadmin" ;;
  }

  dimension: solutionimport {
    type: yesno
    sql: ${TABLE}."permissionssolutionimport" ;;
  }

  dimension: stdautomaticactivitycapture {
    type: yesno
    sql: ${TABLE}."permissionsstdautomaticactivitycapture" ;;
  }

  dimension: submitmacrosallowed {
    type: yesno
    sql: ${TABLE}."permissionssubmitmacrosallowed" ;;
  }

  dimension: subscribedashboardrolesgrps {
    type: yesno
    sql: ${TABLE}."permissionssubscribedashboardrolesgrps" ;;
  }

  dimension: subscribedashboardtootherusers {
    type: yesno
    sql: ${TABLE}."permissionssubscribedashboardtootherusers" ;;
  }

  dimension: subscribereportrolesgrps {
    type: yesno
    sql: ${TABLE}."permissionssubscribereportrolesgrps" ;;
  }

  dimension: subscribereportsrunasuser {
    type: yesno
    sql: ${TABLE}."permissionssubscribereportsrunasuser" ;;
  }

  dimension: subscribereporttootherusers {
    type: yesno
    sql: ${TABLE}."permissionssubscribereporttootherusers" ;;
  }

  dimension: subscribetolightningdashboards {
    type: yesno
    sql: ${TABLE}."permissionssubscribetolightningdashboards" ;;
  }

  dimension: subscribetolightningreports {
    type: yesno
    sql: ${TABLE}."permissionssubscribetolightningreports" ;;
  }

  dimension: tracexdsqueries {
    type: yesno
    sql: ${TABLE}."permissionstracexdsqueries" ;;
  }

  dimension: transactionalemailsend {
    type: yesno
    sql: ${TABLE}."permissionstransactionalemailsend" ;;
  }

  dimension: transferanycase {
    type: yesno
    sql: ${TABLE}."permissionstransferanycase" ;;
  }

  dimension: transferanyentity {
    type: yesno
    sql: ${TABLE}."permissionstransferanyentity" ;;
  }

  dimension: transferanylead {
    type: yesno
    sql: ${TABLE}."permissionstransferanylead" ;;
  }

  dimension: twofactorapi {
    type: yesno
    sql: ${TABLE}."permissionstwofactorapi" ;;
  }

  dimension: updatewithinactiveowner {
    type: yesno
    sql: ${TABLE}."permissionsupdatewithinactiveowner" ;;
  }

  dimension: useassistantdialog {
    type: yesno
    sql: ${TABLE}."permissionsuseassistantdialog" ;;
  }

  dimension: usemysearch {
    type: yesno
    sql: ${TABLE}."permissionsusemysearch" ;;
  }

  dimension: usequerysuggestions {
    type: yesno
    sql: ${TABLE}."permissionsusequerysuggestions" ;;
  }

  dimension: useteamreassignwizards {
    type: yesno
    sql: ${TABLE}."permissionsuseteamreassignwizards" ;;
  }

  dimension: useweblink {
    type: yesno
    sql: ${TABLE}."permissionsuseweblink" ;;
  }

  dimension: viewallactivities {
    type: yesno
    sql: ${TABLE}."permissionsviewallactivities" ;;
  }

  dimension: viewallcustomsettings {
    type: yesno
    sql: ${TABLE}."permissionsviewallcustomsettings" ;;
  }

  dimension: viewalldata {
    type: yesno
    sql: ${TABLE}."permissionsviewalldata" ;;
  }

  dimension: viewallforecasts {
    type: yesno
    sql: ${TABLE}."permissionsviewallforecasts" ;;
  }

  dimension: viewallusers {
    type: yesno
    sql: ${TABLE}."permissionsviewallusers" ;;
  }

  dimension: viewcaseinteraction {
    type: yesno
    sql: ${TABLE}."permissionsviewcaseinteraction" ;;
  }

  dimension: viewcontent {
    type: yesno
    sql: ${TABLE}."permissionsviewcontent" ;;
  }

  dimension: viewdataassessment {
    type: yesno
    sql: ${TABLE}."permissionsviewdataassessment" ;;
  }

  dimension: viewdatacategories {
    type: yesno
    sql: ${TABLE}."permissionsviewdatacategories" ;;
  }

  dimension: viewencrypteddata {
    type: yesno
    sql: ${TABLE}."permissionsviewencrypteddata" ;;
  }

  dimension: vieweventlogfiles {
    type: yesno
    sql: ${TABLE}."permissionsvieweventlogfiles" ;;
  }

  dimension: viewflowusageandfloweventdata {
    type: yesno
    sql: ${TABLE}."permissionsviewflowusageandfloweventdata" ;;
  }

  dimension: viewhealthcheck {
    type: yesno
    sql: ${TABLE}."permissionsviewhealthcheck" ;;
  }

  dimension: viewhelplink {
    type: yesno
    sql: ${TABLE}."permissionsviewhelplink" ;;
  }

  dimension: viewmyteamsdashboards {
    type: yesno
    sql: ${TABLE}."permissionsviewmyteamsdashboards" ;;
  }

  dimension: viewonlyembeddedappuser {
    type: yesno
    sql: ${TABLE}."permissionsviewonlyembeddedappuser" ;;
  }

  dimension: viewprivatestaticresources {
    type: yesno
    sql: ${TABLE}."permissionsviewprivatestaticresources" ;;
  }

  dimension: viewpublicdashboards {
    type: yesno
    sql: ${TABLE}."permissionsviewpublicdashboards" ;;
  }

  dimension: viewpublicreports {
    type: yesno
    sql: ${TABLE}."permissionsviewpublicreports" ;;
  }

  dimension: viewroles {
    type: yesno
    sql: ${TABLE}."permissionsviewroles" ;;
  }

  dimension: viewsetup {
    type: yesno
    sql: ${TABLE}."permissionsviewsetup" ;;
  }

  dimension: viewuserpii {
    type: yesno
    sql: ${TABLE}."permissionsviewuserpii" ;;
  }

  dimension: sfid {
    type: string
    sql: ${TABLE}."sfid" ;;
  }

  dimension_group: systemmodstamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."systemmodstamp" ;;
  }

  dimension: userlicenseid {
    type: string
    sql: ${TABLE}."userlicenseid" ;;
  }

  dimension: usertype {
    type: string
    sql: ${TABLE}."usertype" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
