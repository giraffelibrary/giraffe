structure GdkEventGrabBrokenRecord :>
  sig
    include GDK_EVENT_GRAB_BROKEN_RECORD
      where type 'a event_union = 'a GdkEvent.union
      where type C.notnull = GdkEvent.C.notnull
      where type 'a C.p = 'a GdkEvent.C.p
  end =
  struct
    type grab_broken = unit
    type 'a event_union = 'a GdkEvent.union
    type t = grab_broken event_union


    datatype event =
      GRAB_BROKEN


    structure C = GdkEvent.C


    val t = GdkEvent.t
    val tOpt = GdkEvent.tOpt
  end
