structure GdkEventCrossingRecord :>
  GDK_EVENT_CROSSING_RECORD
    where type 'a event_union = 'a GdkEvent.union
    where type C.notnull = GdkEvent.C.notnull
    where type 'a C.p = 'a GdkEvent.C.p =
  struct
    type 'a event_union = 'a GdkEvent.union
    open GdkEvent
    type crossing = unit
    type t = crossing union
    datatype event =
      ENTER_NOTIFY
    | LEAVE_NOTIFY
  end
