structure GdkEventProximityRecord :>
  GDK_EVENT_PROXIMITY_RECORD
    where type 'a event_union = 'a GdkEvent.union
    where type C.opt = GdkEvent.C.opt
    where type C.non_opt = GdkEvent.C.non_opt
    where type 'a C.p = 'a GdkEvent.C.p =
  struct
    type 'a event_union = 'a GdkEvent.union
    type proximity = unit
    type t = proximity GdkEvent.union
    structure Record = GdkEvent
    open Record
  end
