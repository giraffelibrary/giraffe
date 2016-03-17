structure GdkEventWindowStateRecord :>
  sig
    include GDK_EVENT_WINDOW_STATE_RECORD
      where type 'a event_union = 'a GdkEvent.union
      where type C.notnull = GdkEvent.C.notnull
      where type 'a C.p = 'a GdkEvent.C.p
  end =
  struct
    type window_state = unit
    type 'a event_union = 'a GdkEvent.union
    type t = window_state event_union


    datatype event =
      WINDOW_STATE


    structure C = GdkEvent.C


    val t = GdkEvent.t
    val tOpt = GdkEvent.tOpt
  end
