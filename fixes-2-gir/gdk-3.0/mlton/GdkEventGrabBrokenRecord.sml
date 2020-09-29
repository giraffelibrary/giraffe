structure GdkEventGrabBrokenRecord :>
  GDK_EVENT_GRAB_BROKEN_RECORD
    where type 'a event_union = 'a GdkEvent.union
    where type C.opt = GdkEvent.C.opt
    where type C.non_opt = GdkEvent.C.non_opt
    where type 'a C.p = 'a GdkEvent.C.p =
  struct
    type 'a event_union = 'a GdkEvent.union
    type grab_broken = unit
    type t = grab_broken GdkEvent.union
    structure Record = GdkEvent
    open Record
    datatype event =
      GRAB_BROKEN
  end
