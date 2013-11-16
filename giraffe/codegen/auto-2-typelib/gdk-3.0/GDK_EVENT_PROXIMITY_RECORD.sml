signature GDK_EVENT_PROXIMITY_RECORD =
  sig
    type proximity
    type 'a event_t
    type t = proximity event_t
    val t : (t, t) GObjectValue.accessor
    datatype event =
      PROXIMITYIN
    | PROXIMITYOUT
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
