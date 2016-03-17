signature GDK_EVENT_VISIBILITY_RECORD =
  sig
    type visibility
    type 'a event_union
    type t = visibility event_union
    val t : (t, t) GObjectValue.accessor
    val tOpt : (t option, t option) GObjectValue.accessor
    datatype event =
      VISIBILITY_NOTIFY
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
