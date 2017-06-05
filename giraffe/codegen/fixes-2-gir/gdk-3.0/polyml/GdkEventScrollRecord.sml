structure GdkEventScrollRecord :>
  GDK_EVENT_SCROLL_RECORD
    where type 'a event_union = 'a GdkEvent.union
    where type C.notnull = GdkEvent.C.notnull
    where type 'a C.p = 'a GdkEvent.C.p =
  struct
    type 'a event_union = 'a GdkEvent.union
    open GdkEvent
    type scroll = unit
    type t = scroll union
    datatype event =
      SCROLL
  end
