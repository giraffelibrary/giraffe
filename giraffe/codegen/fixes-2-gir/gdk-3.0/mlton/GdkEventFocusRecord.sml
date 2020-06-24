structure GdkEventFocusRecord :>
  GDK_EVENT_FOCUS_RECORD
    where type 'a event_union = 'a GdkEvent.union
    where type C.non_opt = GdkEvent.C.non_opt
    where type 'a C.p = 'a GdkEvent.C.p =
  struct
    type 'a event_union = 'a GdkEvent.union
    open GdkEvent
    type focus = unit
    type t = focus union
    datatype event =
      FOCUS_CHANGE
  end
