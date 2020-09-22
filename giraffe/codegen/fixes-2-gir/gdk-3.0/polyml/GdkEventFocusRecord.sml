structure GdkEventFocusRecord :>
  GDK_EVENT_FOCUS_RECORD
    where type 'a event_union = 'a GdkEvent.union
    where type C.opt = GdkEvent.C.opt
    where type C.non_opt = GdkEvent.C.non_opt
    where type 'a C.p = 'a GdkEvent.C.p =
  struct
    type 'a event_union = 'a GdkEvent.union
    type focus_change = unit
    type t = focus_change GdkEvent.union
    structure Record = GdkEvent
    open Record
    datatype event =
      FOCUS_CHANGE
  end
