structure GdkEventFocusRecord :>
  sig
    include GDK_EVENT_FOCUS_RECORD
      where type 'a event_t = 'a GdkEvent.t
      where type C.notnull = GdkEvent.C.notnull
      where type 'a C.p = 'a GdkEvent.C.p
  end =
  struct
    type focus = unit
    type 'a event_t = 'a GdkEvent.t
    type t = focus event_t


    datatype event =
      FOCUSCHANGE


    structure C = GdkEvent.C


    val t = GdkEvent.t
  end
