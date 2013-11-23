structure GdkEventGrabBrokenRecord :>
  sig
    include GDK_EVENT_GRAB_BROKEN_RECORD
      where type 'a event_t = 'a GdkEvent.t
      where type C.notnull = GdkEvent.C.notnull
      where type 'a C.p = 'a GdkEvent.C.p
  end =
  struct
    type grabbroken = unit
    type 'a event_t = 'a GdkEvent.t
    type t = grabbroken event_t


    datatype event =
      GRABBROKEN


    structure C = GdkEvent.C


    val t = GdkEvent.t
  end
