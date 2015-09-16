signature GDK_EVENT_WINDOW_STATE_RECORD =
  sig
    type window_state
    type 'a event_t
    type t = window_state event_t
    val t : (t, t) GObjectValue.accessor
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
