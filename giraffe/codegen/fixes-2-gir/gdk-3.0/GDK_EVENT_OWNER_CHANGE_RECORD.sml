signature GDK_EVENT_OWNER_CHANGE_RECORD =
  sig
    type owner_change
    type 'a event_t
    type t = owner_change event_t
    val t : (t, t) GObjectValue.accessor
    datatype event =
      OWNER_CHANGE
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
