structure GdkEventDNDRecord :>
  sig
    include GDK_EVENT_D_N_D_RECORD
      where type 'a event_union = 'a GdkEvent.union
      where type C.notnull = GdkEvent.C.notnull
      where type 'a C.p = 'a GdkEvent.C.p
  end =
  struct
    type dnd = unit
    type 'a event_union = 'a GdkEvent.union
    type t = dnd event_union


    datatype event =
      DRAG_ENTER
    | DRAG_LEAVE
    | DRAG_MOTION
    | DRAG_STATUS
    | DROP_START
    | DROP_FINISHED


    structure C = GdkEvent.C


    val t = GdkEvent.t
    val tOpt = GdkEvent.tOpt
  end
