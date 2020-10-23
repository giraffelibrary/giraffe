structure GdkEventTouchpadSwipeRecord :>
  GDK_EVENT_TOUCHPAD_SWIPE_RECORD
    where type 'a event_union = 'a GdkEvent.union
    where type C.opt = GdkEvent.C.opt
    where type C.non_opt = GdkEvent.C.non_opt
    where type 'a C.p = 'a GdkEvent.C.p =
  struct
    type 'a event_union = 'a GdkEvent.union
    type touchpad_swipe = unit
    type t = touchpad_swipe GdkEvent.union
    structure Record = GdkEvent
    open Record
    datatype event =
      TOUCHPAD_SWIPE
  end
