structure GdkEventVisibilityRecord :>
  GDK_EVENT_VISIBILITY_RECORD
    where type 'a event_union = 'a GdkEvent.union
    where type C.notnull = GdkEvent.C.notnull
    where type 'a C.p = 'a GdkEvent.C.p =
  struct
    type 'a event_union = 'a GdkEvent.union
    open GdkEvent
    type visibility = unit
    type t = visibility union
    datatype event =
      VISIBILITY_NOTIFY
  end
