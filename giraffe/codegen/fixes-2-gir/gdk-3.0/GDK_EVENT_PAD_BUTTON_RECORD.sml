signature GDK_EVENT_PAD_BUTTON_RECORD =
  sig
    type pad_button
    type 'a event_union
    include RECORD where type t = pad_button event_union
    datatype event =
      PAD_BUTTON_PRESS
    | PAD_BUTTON_RELEASE
    val t : (t, t) ValueAccessor.t
    val tOpt : (t option, t option) ValueAccessor.t
(*
    val window : t -> base Window.t
    val sendEvent : t -> bool
*)
  end
