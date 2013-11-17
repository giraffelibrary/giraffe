structure GdkEventVisibilityRecord :>
  sig
    include GDK_EVENT_VISIBILITY_RECORD
      where type 'a event_t = 'a GdkEvent.t
      where type C.notnull = GdkEvent.C.notnull
      where type 'a C.p = 'a GdkEvent.C.p
  end =
  struct
    type visibility = unit
    type 'a event_t = 'a GdkEvent.t
    type t = visibility event_t


    datatype event =
      VISIBILITYNOTIFY


    structure C = GdkEvent.C


    val t = GdkEvent.t
  end
