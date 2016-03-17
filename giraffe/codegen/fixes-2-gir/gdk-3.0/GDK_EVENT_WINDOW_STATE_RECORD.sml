signature GDK_EVENT_WINDOW_STATE_RECORD =
  sig
    type window_state
    type 'a event_union
    type t = window_state event_union
    val t : (t, t) GObjectValue.accessor
    val tOpt : (t option, t option) GObjectValue.accessor
    datatype event =
      WINDOW_STATE
(*
    val window : t -> base Window.t
    val sendEvent : t -> bool
*)
    structure C :
      sig
        type notnull
        type 'a p
        val withPtr :
          (notnull p -> 'a)
           -> t
           -> 'a
        val withOptPtr :
          (unit p -> 'a)
           -> t option
           -> 'a
        val fromPtr :
          bool
           -> notnull p
           -> t
        val fromOptPtr :
          bool
           -> unit p
           -> t option
      end
  end
