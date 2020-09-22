signature GDK_EVENT_TOUCH_RECORD =
  sig
    type touch
    type 'a event_union
    include
      RECORD
        where type t = touch event_union
  end
