signature GDK_EVENT_TOUCHPAD_SWIPE_RECORD =
  sig
    type touchpad_swipe
    type 'a event_union
    include
      RECORD
        where type t = touchpad_swipe event_union
  end
