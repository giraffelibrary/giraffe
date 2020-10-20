signature GDK_EVENT_TOUCH_RECORD =
  sig
    type touch
    type 'a event_union
    include
      RECORD
        where type t = touch event_union
    datatype event =
      TOUCH_BEGIN
    | TOUCH_UPDATE
    | TOUCH_END
    | TOUCH_CANCEL
    val t : (t, t) ValueAccessor.t
    val tOpt : (t option, t option) ValueAccessor.t
  end
