structure GdkEventSettingRecord :>
  sig
    include GDK_EVENT_SETTING_RECORD
      where type 'a event_t = 'a GdkEvent.t
      where type C.notnull = GdkEvent.C.notnull
      where type 'a C.p = 'a GdkEvent.C.p
  end =
  struct
    type setting = unit
    type 'a event_t = 'a GdkEvent.t
    type t = setting event_t


    datatype event =
      SETTING


    structure C = GdkEvent.C


    val t = GdkEvent.t
  end
