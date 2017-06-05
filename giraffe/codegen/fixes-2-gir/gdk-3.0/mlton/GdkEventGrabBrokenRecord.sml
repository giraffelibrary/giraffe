structure GdkEventGrabBrokenRecord :>
  GDK_EVENT_GRAB_BROKEN_RECORD
    where type 'a event_union = 'a GdkEvent.union
    where type C.notnull = GdkEvent.C.notnull
    where type 'a C.p = 'a GdkEvent.C.p =
  struct
    type 'a event_union = 'a GdkEvent.union
    open GdkEvent
    type grab_broken = unit
    type t = grab_broken union
    datatype event =
      GRAB_BROKEN
  end
