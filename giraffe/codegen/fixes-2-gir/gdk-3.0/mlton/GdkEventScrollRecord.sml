structure GdkEventScrollRecord :>
  GDK_EVENT_SCROLL_RECORD
    where type 'a event_union = 'a GdkEvent.union
    where type C.non_opt = GdkEvent.C.non_opt
    where type 'a C.p = 'a GdkEvent.C.p =
  struct
    type 'a event_union = 'a GdkEvent.union
    open GdkEvent
    type scroll = unit
    type t = scroll union
    datatype event =
      SCROLL
  end
