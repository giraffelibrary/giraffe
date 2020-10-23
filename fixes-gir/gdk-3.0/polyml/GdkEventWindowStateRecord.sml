structure GdkEventWindowStateRecord :>
  GDK_EVENT_WINDOW_STATE_RECORD
    where type 'a event_union = 'a GdkEvent.union
    where type C.opt = GdkEvent.C.opt
    where type C.non_opt = GdkEvent.C.non_opt
    where type 'a C.p = 'a GdkEvent.C.p =
  struct
    type 'a event_union = 'a GdkEvent.union
    type window_state = unit
    type t = window_state GdkEvent.union
    structure Record = GdkEvent
    open Record
    datatype event =
      WINDOW_STATE
  end
