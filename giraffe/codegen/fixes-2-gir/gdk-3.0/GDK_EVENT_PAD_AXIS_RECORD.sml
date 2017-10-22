signature GDK_EVENT_PAD_AXIS_RECORD =
  sig
    type pad_axis
    type 'a event_union
    include RECORD where type t = pad_axis event_union
    datatype event =
      PAD_RING
    | PAD_STRIP
    val t : (t, t) ValueAccessor.t
    val tOpt : (t option, t option) ValueAccessor.t
(*
    val window : t -> base Window.t
    val sendEvent : t -> bool
*)
  end
