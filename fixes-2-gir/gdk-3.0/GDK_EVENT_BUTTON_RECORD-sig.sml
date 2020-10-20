signature GDK_EVENT_BUTTON_RECORD =
  sig
    type button
    type 'a event_union
    include
      RECORD
        where type t = button event_union
    datatype event =
      BUTTON_PRESS
    | DOUBLE_BUTTON_PRESS
    | TRIPLE_BUTTON_PRESS
    | BUTTON_RELEASE
    val t : (t, t) ValueAccessor.t
    val tOpt : (t option, t option) ValueAccessor.t
  end
