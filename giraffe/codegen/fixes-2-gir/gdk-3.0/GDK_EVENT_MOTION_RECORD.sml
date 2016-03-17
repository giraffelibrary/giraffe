signature GDK_EVENT_MOTION_RECORD =
  sig
    type motion
    type 'a event_union
    type t = motion event_union
    val t : (t, t) GObjectValue.accessor
    val tOpt : (t option, t option) GObjectValue.accessor
    datatype event =
      MOTION_NOTIFY
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
