structure GdkEventTouchRecord :>
  GDK_EVENT_TOUCH_RECORD
    where type 'a event_union = 'a GdkEvent.union
    where type C.non_opt = GdkEvent.C.non_opt
    where type 'a C.p = 'a GdkEvent.C.p =
  struct
    type 'a event_union = 'a GdkEvent.union
    open GdkEvent
    type touch = unit
    type t = touch union
    datatype event =
      TOUCH_BEGIN
    | TOUCH_UPDATE
    | TOUCH_END
    | TOUCH_CANCEL
  end
