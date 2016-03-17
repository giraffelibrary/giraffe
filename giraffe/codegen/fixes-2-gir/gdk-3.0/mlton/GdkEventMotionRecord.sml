structure GdkEventMotionRecord :>
  sig
    include GDK_EVENT_MOTION_RECORD
      where type 'a event_union = 'a GdkEvent.union
      where type C.notnull = GdkEvent.C.notnull
      where type 'a C.p = 'a GdkEvent.C.p
  end =
  struct
    type motion = unit
    type 'a event_union = 'a GdkEvent.union
    type t = motion event_union


    datatype event =
      MOTION_NOTIFY


    structure C = GdkEvent.C


    val t = GdkEvent.t
    val tOpt = GdkEvent.tOpt
  end
