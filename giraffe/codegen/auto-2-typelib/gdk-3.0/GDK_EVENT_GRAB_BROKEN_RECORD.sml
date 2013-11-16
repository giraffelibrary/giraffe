signature GDK_EVENT_GRAB_BROKEN_RECORD =
  sig
    type grabbroken
    type 'a event_t
    type t = grabbroken event_t
    val t : (t, t) GObjectValue.accessor
    datatype event =
      GRABBROKEN
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
