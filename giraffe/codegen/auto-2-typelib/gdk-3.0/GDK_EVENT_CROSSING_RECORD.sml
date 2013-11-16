signature GDK_EVENT_CROSSING_RECORD =
  sig
    type crossing
    type 'a event_t
    type t = crossing event_t
    val t : (t, t) GObjectValue.accessor
    datatype event =
      ENTERNOTIFY
    | LEAVENOTIFY
(*
    val window : t -> base Window.t
    val sendEvent : t -> bool
    val time : t -> LargeInt.int
    val x : t -> real
    val y : t -> real
    val state : t -> word
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
