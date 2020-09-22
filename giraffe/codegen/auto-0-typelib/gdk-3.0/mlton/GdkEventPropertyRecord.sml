structure GdkEventPropertyRecord :>
  GDK_EVENT_PROPERTY_RECORD
    where type 'a event_union = 'a GdkEvent.union
    where type C.opt = GdkEvent.C.opt
    where type C.non_opt = GdkEvent.C.non_opt
    where type 'a C.p = 'a GdkEvent.C.p =
  struct
    type 'a event_union = 'a GdkEvent.union
    type property = unit
    type t = property GdkEvent.union
    structure Record = GdkEvent
    open Record
  end
