structure GdkEventDNDRecord :>
  GDK_EVENT_D_N_D_RECORD
    where type 'a event_union = 'a GdkEvent.union
    where type C.non_opt = GdkEvent.C.non_opt
    where type 'a C.p = 'a GdkEvent.C.p =
  struct
    type 'a event_union = 'a GdkEvent.union
    open GdkEvent
    type dnd = unit
    type t = dnd union
    datatype event =
      DRAG_ENTER
    | DRAG_LEAVE
    | DRAG_MOTION
    | DRAG_STATUS
    | DROP_START
    | DROP_FINISHED
  end
