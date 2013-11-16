structure GdkEventWindowStateRecord :>
  sig
    include GDK_EVENT_WINDOW_STATE_RECORD
      where type 'a event_t = 'a GdkEvent.t
      where type C.notnull = GdkEvent.C.notnull
      where type 'a C.p = 'a GdkEvent.C.p
  end =
  struct
    type windowstate = unit
    type 'a event_t = 'a GdkEvent.t
    type t = windowstate event_t


    datatype event =
      WINDOWSTATE


    structure C = GdkEvent.C


    val t = GdkEvent.t
  end
