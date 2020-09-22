structure GdkEventButtonRecord :>
  GDK_EVENT_BUTTON_RECORD
    where type 'a event_union = 'a GdkEvent.union
    where type C.opt = GdkEvent.C.opt
    where type C.non_opt = GdkEvent.C.non_opt
    where type 'a C.p = 'a GdkEvent.C.p =
  struct
    type 'a event_union = 'a GdkEvent.union
    type button = unit
    type t = button GdkEvent.union
    structure Record = GdkEvent
    open Record
  end
