structure GdkEventTouch :>
  GDK_EVENT_TOUCH
    where type t = GdkEventTouchRecord.t =
  struct
    type t = GdkEventTouchRecord.t
  end
