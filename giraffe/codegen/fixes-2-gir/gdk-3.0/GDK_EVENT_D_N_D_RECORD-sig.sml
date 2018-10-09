signature GDK_EVENT_D_N_D_RECORD =
  sig
    type dnd
    type 'a event_union
    include RECORD where type t = dnd event_union
    datatype event =
      DRAG_ENTER
    | DRAG_LEAVE
    | DRAG_MOTION
    | DRAG_STATUS
    | DROP_START
    | DROP_FINISHED
    val t : (t, t) ValueAccessor.t
    val tOpt : (t option, t option) ValueAccessor.t
(*
    val window : t -> base Window.t
    val sendEvent : t -> bool
    val time : t -> LargeInt.int
*)
  end
