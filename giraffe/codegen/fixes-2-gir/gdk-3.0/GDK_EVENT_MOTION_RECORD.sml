signature GDK_EVENT_MOTION_RECORD =
  sig
    type motion
    type 'a event_union
    include RECORD where type t = motion event_union
    datatype event =
      MOTION_NOTIFY
    val t : (t, t) GObjectValue.accessor
    val tOpt : (t option, t option) GObjectValue.accessor
(*
    val window : t -> base Window.t
    val sendEvent : t -> bool
    val time : t -> LargeInt.int
    val x : t -> real
    val y : t -> real
    val state : t -> word
*)
  end
