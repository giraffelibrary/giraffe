signature GDK_EVENT_CONFIGURE_RECORD =
  sig
    type configure
    type 'a event_t
    type t = configure event_t
    val t : (t, t) GObjectValue.accessor
    datatype event =
      CONFIGURE
(*
    val window : t -> base Window.t
    val sendEvent : t -> bool
    val x : t -> real
    val y : t -> real
    val width : t -> real
    val height : t -> real
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
