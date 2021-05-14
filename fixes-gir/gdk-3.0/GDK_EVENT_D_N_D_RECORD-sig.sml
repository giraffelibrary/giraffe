signature GDK_EVENT_D_N_D_RECORD =
  sig
    type dnd
    type 'a event_union
    include
      RECORD
        where type t = dnd event_union
    datatype event =
      DRAG_ENTER
    | DRAG_LEAVE
    | DRAG_MOTION
    | DRAG_STATUS
    | DROP_START
    | DROP_FINISHED
    val t : t ValueAccessor.t
    val tOpt : t option ValueAccessor.t
  end
