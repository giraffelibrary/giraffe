signature GDK_EVENT_TOUCHPAD_SWIPE_RECORD =
  sig
    type touchpad_swipe
    type 'a event_union
    include
      RECORD
        where type t = touchpad_swipe event_union
    datatype event =
      TOUCHPAD_SWIPE
    val t : t ValueAccessor.t
    val tOpt : t option ValueAccessor.t
  end
