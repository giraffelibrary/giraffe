signature GDK_EVENT_CONFIGURE_RECORD =
  sig
    type configure
    type 'a event_union
    include RECORD where type t = configure event_union
    datatype event =
      CONFIGURE
    val t : (t, t) GObjectValue.accessor
    val tOpt : (t option, t option) GObjectValue.accessor
(*
    val window : t -> base Window.t
    val sendEvent : t -> bool
    val x : t -> real
    val y : t -> real
    val width : t -> real
    val height : t -> real
*)
  end
