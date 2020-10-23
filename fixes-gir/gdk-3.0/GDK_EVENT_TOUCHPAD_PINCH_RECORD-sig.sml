signature GDK_EVENT_TOUCHPAD_PINCH_RECORD =
  sig
    type touchpad_pinch
    type 'a event_union
    include
      RECORD
        where type t = touchpad_pinch event_union
    datatype event =
      TOUCHPAD_PINCH
    val t : (t, t) ValueAccessor.t
    val tOpt : (t option, t option) ValueAccessor.t
  end
