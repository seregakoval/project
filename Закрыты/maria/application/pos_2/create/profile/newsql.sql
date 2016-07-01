create SEQUENCE  seq_stdjournalhdr_id;
create SEQUENCE  seq_stdjournaldet_rowno;


alter table stdjournaldet_temp add column gst_accid integer;
alter table stdjournaldet_temp add column gst_percent  numeric(20,4) default 0;
alter table stdjournaldet_temp add column gst_amount_debit  numeric(20,4) default 0;
alter table stdjournaldet_temp add column gst_amount_credit  numeric(20,4) default 0;
alter table stdjournaldet_temp add column finaltotal_debit  numeric(20,2) default 0;
alter table stdjournaldet_temp add column finaltotal_credit  numeric(20,2) default 0;
alter table stdjournaldet_temp add column gst_doc_debit  numeric(20,4) default 0;
alter table stdjournaldet_temp add column gst_doc_credit  numeric(20,4) default 0;
alter table stdjournaldet_temp add column finaldoc_debit  numeric(20,2) default 0;
alter table stdjournaldet_temp add column finaldoc_credit  numeric(20,2) default 0;

alter table stdjournaldet add column gst_accid integer;
alter table stdjournaldet add column gst_percent  numeric(20,4) default 0;
alter table stdjournaldet add column gst_amount_debit  numeric(20,4) default 0;
alter table stdjournaldet add column gst_amount_credit  numeric(20,4) default 0;
alter table stdjournaldet add column finaltotal_debit  numeric(20,2) default 0;
alter table stdjournaldet add column finaltotal_credit  numeric(20,2) default 0;
alter table stdjournaldet add column gst_doc_debit  numeric(20,4) default 0;
alter table stdjournaldet add column gst_doc_credit  numeric(20,4) default 0;
alter table stdjournaldet add column finaldoc_debit  numeric(20,2) default 0;
alter table stdjournaldet add column finaldoc_credit  numeric(20,2) default 0;