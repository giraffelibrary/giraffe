structure GdkEventPadAxisRecord :>
  GDK_EVENT_PAD_AXIS_RECORD
    where type 'a event_union = 'a GdkEvent.union
    where type C.non_opt = GdkEvent.C.non_opt
    where type 'a C.p = 'a GdkEvent.C.p =
  struct
    type 'a event_union = 'a GdkEvent.union
    open GdkEvent
    type pad_axis = unit
    type t = pad_axis union
    datatype event =
      PAD_RING
    | PAD_STRIP
  end
