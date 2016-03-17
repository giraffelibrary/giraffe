structure GdkEventCrossingRecord :>
  sig
    include GDK_EVENT_CROSSING_RECORD
      where type 'a event_union = 'a GdkEvent.union
      where type C.notnull = GdkEvent.C.notnull
      where type 'a C.p = 'a GdkEvent.C.p
  end =
  struct
    type crossing = unit
    type 'a event_union = 'a GdkEvent.union
    type t = crossing event_union


    datatype event =
      ENTER_NOTIFY
    | LEAVE_NOTIFY


    structure C = GdkEvent.C


    val t = GdkEvent.t
    val tOpt = GdkEvent.tOpt
  end
