signature GDK_EVENT_SELECTION_RECORD =
  sig
    type selection
    type 'a event_union
    type t = selection event_union
    val t : (t, t) GObjectValue.accessor
    val tOpt : (t option, t option) GObjectValue.accessor
    datatype event =
      SELECTION_CLEAR
    | SELECTION_REQUEST
    | SELECTION_NOTIFY
(*
    val window : t -> base Window.t
    val sendEvent : t -> bool
    val time : t -> LargeInt.int
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
