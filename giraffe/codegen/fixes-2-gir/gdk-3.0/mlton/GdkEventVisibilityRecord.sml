structure GdkEventVisibilityRecord :>
  sig
    include GDK_EVENT_VISIBILITY_RECORD
      where type 'a event_union = 'a GdkEvent.union
      where type C.notnull = GdkEvent.C.notnull
      where type 'a C.p = 'a GdkEvent.C.p
  end =
  struct
    type visibility = unit
    type 'a event_union = 'a GdkEvent.union
    type t = visibility event_union


    datatype event =
      VISIBILITY_NOTIFY


    structure C = GdkEvent.C


    val t = GdkEvent.t
    val tOpt = GdkEvent.tOpt
  end
