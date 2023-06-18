view: contracted_arr_outstanding {
  derived_table: {
    sql: with arros as (
select
r.account_name
,r.account_id
,last_day(dateadd('month',1,last_day(dateadd('month',2,date_trunc('quarter',dateadd('month',-1,current_date)))))) as close_qtr
,sum(coalesce(r.arr_delta,0)) as arr_os
from analytics.finance.contracted_arr_reporting r
where close_day <= last_day(dateadd('month',1,last_day(dateadd('month',2,date_trunc('quarter',dateadd('month',-1,current_date))))))
group by 1,2

union

select
r.account_name
,r.account_id
,last_day(dateadd('month',1,last_day(dateadd('month',2,date_trunc('quarter',dateadd('month',-4,current_date)))))) as close_qtr
,sum(coalesce(r.arr_delta,0)) as arr_os
from analytics.finance.contracted_arr_reporting r
where close_day <= last_day(dateadd('month',1,last_day(dateadd('month',2,date_trunc('quarter',dateadd('month',-4,current_date))))))
group by 1,2


union

select
r.account_name
,r.account_id
,last_day(dateadd('month',1,last_day(dateadd('month',2,date_trunc('quarter',dateadd('month',-7,current_date)))))) as close_qtr
,sum(coalesce(r.arr_delta,0)) as arr_os
from analytics.finance.contracted_arr_reporting r
where close_day <= last_day(dateadd('month',1,last_day(dateadd('month',2,date_trunc('quarter',dateadd('month',-7,current_date))))))
group by 1,2


union

select
r.account_name
,r.account_id
,last_day(dateadd('month',1,last_day(dateadd('month',2,date_trunc('quarter',dateadd('month',-10,current_date)))))) as close_qtr
,sum(coalesce(r.arr_delta,0)) as arr_os
from analytics.finance.contracted_arr_reporting r
where close_day <= last_day(dateadd('month',1,last_day(dateadd('month',2,date_trunc('quarter',dateadd('month',-10,current_date))))))
group by 1,2

union

select
r.account_name
,r.account_id
,last_day(dateadd('month',1,last_day(dateadd('month',2,date_trunc('quarter',dateadd('month',-13,current_date)))))) as close_qtr
,sum(coalesce(r.arr_delta,0)) as arr_os
from analytics.finance.contracted_arr_reporting r
where close_day <= last_day(dateadd('month',1,last_day(dateadd('month',2,date_trunc('quarter',dateadd('month',-13,current_date))))))
group by 1,2

union

select
r.account_name
,r.account_id
,last_day(dateadd('month',1,last_day(dateadd('month',2,date_trunc('quarter',dateadd('month',-17,current_date)))))) as close_qtr
,sum(coalesce(r.arr_delta,0)) as arr_os
from analytics.finance.contracted_arr_reporting r
where close_day <= last_day(dateadd('month',1,last_day(dateadd('month',2,date_trunc('quarter',dateadd('month',-17,current_date))))))
group by 1,2

union

select
r.account_name
,r.account_id
,last_day(dateadd('month',1,last_day(dateadd('month',2,date_trunc('quarter',dateadd('month',-20,current_date)))))) as close_qtr
,sum(coalesce(r.arr_delta,0)) as arr_os
from analytics.finance.contracted_arr_reporting r
where close_day <= last_day(dateadd('month',1,last_day(dateadd('month',2,date_trunc('quarter',dateadd('month',-20,current_date))))))
group by 1,2

union

select
r.account_name
,r.account_id
,last_day(dateadd('month',1,last_day(dateadd('month',2,date_trunc('quarter',dateadd('month',-23,current_date)))))) as close_qtr
,sum(coalesce(r.arr_delta,0)) as arr_os
from analytics.finance.contracted_arr_reporting r
where close_day <= last_day(dateadd('month',1,last_day(dateadd('month',2,date_trunc('quarter',dateadd('month',-23,current_date))))))
group by 1,2

union

select
r.account_name
,r.account_id
,last_day(dateadd('month',1,last_day(dateadd('month',2,date_trunc('quarter',dateadd('month',-26,current_date)))))) as close_qtr
,sum(coalesce(r.arr_delta,0)) as arr_os
from analytics.finance.contracted_arr_reporting r
where close_day <= last_day(dateadd('month',1,last_day(dateadd('month',2,date_trunc('quarter',dateadd('month',-26,current_date))))))
group by 1,2

union

select
r.account_name
,r.account_id
,last_day(dateadd('month',1,last_day(dateadd('month',2,date_trunc('quarter',dateadd('month',-29,current_date)))))) as close_qtr
,sum(coalesce(r.arr_delta,0)) as arr_os
from analytics.finance.contracted_arr_reporting r
where close_day <= last_day(dateadd('month',1,last_day(dateadd('month',2,date_trunc('quarter',dateadd('month',-29,current_date))))))
group by 1,2

union

select
r.account_name
,r.account_id
,last_day(dateadd('month',1,last_day(dateadd('month',2,date_trunc('quarter',dateadd('month',-32,current_date)))))) as close_qtr
,sum(coalesce(r.arr_delta,0)) as arr_os
from analytics.finance.contracted_arr_reporting r
where close_day <= last_day(dateadd('month',1,last_day(dateadd('month',2,date_trunc('quarter',dateadd('month',-32,current_date))))))
group by 1,2

union

select
r.account_name
,r.account_id
,last_day(dateadd('month',1,last_day(dateadd('month',2,date_trunc('quarter',dateadd('month',-35,current_date)))))) as close_qtr
,sum(coalesce(r.arr_delta,0)) as arr_os
from analytics.finance.contracted_arr_reporting r
where close_day <= last_day(dateadd('month',1,last_day(dateadd('month',2,date_trunc('quarter',dateadd('month',-35,current_date))))))
group by 1,2

)

,attributes as (
select
    account_id
    ,parent
    ,parent_id
    ,bin_avg_arr
    ,company_type
    ,geo
    ,industry
    ,government
    ,account_owner
    ,min(cohort_fiscal_yr) as cohort_year
from analytics.finance.contracted_arr_reporting
group by 1,2,3,4,5,6,7,8,9
)

select
arros.*
,iff(arr_os>0,1,0) as active_cnt
,d.parent
,d.parent_id
,d.bin_avg_arr
,d.company_type
,d.geo
,d.industry
,d.government
,d.account_owner
,d.cohort_year as cohort_yr
from arros
left join attributes d on d.account_id = arros.account_id
where arr_os >0
order by close_qtr desc, arr_os desc
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}."ACCOUNT_NAME" ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}."ACCOUNT_ID" ;;
  }

  dimension: active_cnt {
    type: number
    value_format: "0"
    sql: ${TABLE}."ACTIVE_CNT" ;;
  }

  measure: total_active_cnt {
    type: sum
    sql: ${active_cnt} ;;
  }

  dimension: fiscal_closing_quarter {
    type: string
    sql: ${TABLE}."CLOSE_QTR" ;;
  }

  dimension: cohort_yr {
    type: string
    sql: ${TABLE}."COHORT_YR";;
  }

  dimension: arr_os {
    type: number
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."ARR_OS" ;;
  }

  measure: total_arr_os {
    type: sum
    value_format: "$#,##0;($#,##0)"
    sql: ${arr_os} ;;
  }

  dimension: parent {
    type: string
    sql: ${TABLE}."PARENT" ;;
  }

  dimension: parent_id {
    type: string
    sql: ${TABLE}."PARENT_ID" ;;
  }

  dimension: bin_avg_arr {
    type: string
    sql: ${TABLE}."BIN_AVG_ARR" ;;
  }

  dimension: company_type {
    type: string
    sql: ${TABLE}."COMPANY_TYPE" ;;
  }

  dimension: geo {
    type: string
    sql: ${TABLE}."GEO" ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}."INDUSTRY" ;;
  }

  dimension: government {
    type: yesno
    sql: ${TABLE}."GOVERNMENT" ;;
  }

  dimension: account_owner {
    type: string
    sql: ${TABLE}."ACCOUNT_OWNER" ;;
  }

  set: detail {
    fields: [
      account_name,
      account_id,
      fiscal_closing_quarter,
      arr_os,
      parent,
      parent_id,
      bin_avg_arr,
      company_type,
      geo,
      industry,
      government,
      account_owner
    ]
  }
}
