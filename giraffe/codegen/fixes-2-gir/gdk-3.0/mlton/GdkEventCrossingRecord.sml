structure GdkEventCrossingRecord :>
  sig
    include GDK_EVENT_CROSSING_RECORD
      where type 'a event_t = 'a GdkEvent.t
      where type C.notnull = GdkEvent.C.notnull
      where type 'a C.p = 'a GdkEvent.C.p
  end =
  struct
    type crossing = unit
    type 'a event_t = 'a GdkEvent.t
    type t = crossing event_t


    datatype event =
      ENTER_NOTIFY
    | LEAVE_NOTIFY


    structure C = GdkEvent.C


    val t = GdkEvent.t
  end
