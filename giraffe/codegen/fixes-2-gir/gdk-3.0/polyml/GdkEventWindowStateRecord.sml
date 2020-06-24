structure GdkEventWindowStateRecord :>
  GDK_EVENT_WINDOW_STATE_RECORD
    where type 'a event_union = 'a GdkEvent.union
    where type C.non_opt = GdkEvent.C.non_opt
    where type 'a C.p = 'a GdkEvent.C.p =
  struct
    type 'a event_union = 'a GdkEvent.union
    open GdkEvent
    type window_state = unit
    type t = window_state union
    datatype event =
      WINDOW_STATE
  end
