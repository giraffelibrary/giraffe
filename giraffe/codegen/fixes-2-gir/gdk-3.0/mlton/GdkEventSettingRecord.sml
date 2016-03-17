structure GdkEventSettingRecord :>
  sig
    include GDK_EVENT_SETTING_RECORD
      where type 'a event_union = 'a GdkEvent.union
      where type C.notnull = GdkEvent.C.notnull
      where type 'a C.p = 'a GdkEvent.C.p
  end =
  struct
    type setting = unit
    type 'a event_union = 'a GdkEvent.union
    type t = setting event_union


    datatype event =
      SETTING


    structure C = GdkEvent.C


    val t = GdkEvent.t
    val tOpt = GdkEvent.tOpt
  end
