signature GDK_EVENT_TOUCHPAD_SWIPE_RECORD =
  sig
    type touchpad_swipe
    type 'a event_union
    include RECORD where type t = touchpad_swipe event_union
    datatype event =
      TOUCHPAD_SWIPE
    val t : (t, t) ValueAccessor.t
    val tOpt : (t option, t option) ValueAccessor.t
(*
    val window : t -> base Window.t
    val sendEvent : t -> bool
*)
  end
