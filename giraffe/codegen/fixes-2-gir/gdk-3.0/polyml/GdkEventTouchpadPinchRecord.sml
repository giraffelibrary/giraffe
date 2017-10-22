structure GdkEventTouchpadPinchRecord :>
  GDK_EVENT_TOUCHPAD_PINCH_RECORD
    where type 'a event_union = 'a GdkEvent.union
    where type C.notnull = GdkEvent.C.notnull
    where type 'a C.p = 'a GdkEvent.C.p =
  struct
    type 'a event_union = 'a GdkEvent.union
    open GdkEvent
    type touchpad_pinch = unit
    type t = touchpad_pinch union
    datatype event =
      TOUCHPAD_PINCH
  end
