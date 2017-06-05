signature GDK_EVENT_PROXIMITY_RECORD =
  sig
    type proximity
    type 'a event_union
    include RECORD where type t = proximity event_union
    datatype event =
      PROXIMITY_IN
    | PROXIMITY_OUT
    val t : (t, t) GObjectValue.accessor
    val tOpt : (t option, t option) GObjectValue.accessor
(*
    val window : t -> base Window.t
    val sendEvent : t -> bool
    val time : t -> LargeInt.int
*)
  end
