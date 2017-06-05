signature GDK_EVENT_FOCUS_RECORD =
  sig
    type focus
    type 'a event_union
    include RECORD where type t = focus event_union
    datatype event =
      FOCUS_CHANGE
    val t : (t, t) GObjectValue.accessor
    val tOpt : (t option, t option) GObjectValue.accessor
(*
    val window : t -> base Window.t
    val sendEvent : t -> bool
*)
  end
