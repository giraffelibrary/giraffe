structure GdkEventFocusRecord :>
  sig
    include GDK_EVENT_FOCUS_RECORD
      where type 'a event_union = 'a GdkEvent.union
      where type C.notnull = GdkEvent.C.notnull
      where type 'a C.p = 'a GdkEvent.C.p
  end =
  struct
    type focus = unit
    type 'a event_union = 'a GdkEvent.union
    type t = focus event_union


    datatype event =
      FOCUS_CHANGE


    structure C = GdkEvent.C


    val t = GdkEvent.t
    val tOpt = GdkEvent.tOpt
  end
