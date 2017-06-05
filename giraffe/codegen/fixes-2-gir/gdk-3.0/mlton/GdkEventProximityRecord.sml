structure GdkEventProximityRecord :>
  GDK_EVENT_PROXIMITY_RECORD
    where type 'a event_union = 'a GdkEvent.union
    where type C.notnull = GdkEvent.C.notnull
    where type 'a C.p = 'a GdkEvent.C.p =
  struct
    type 'a event_union = 'a GdkEvent.union
    open GdkEvent
    type proximity = unit
    type t = proximity union
    datatype event =
      PROXIMITY_IN
    | PROXIMITY_OUT
  end
