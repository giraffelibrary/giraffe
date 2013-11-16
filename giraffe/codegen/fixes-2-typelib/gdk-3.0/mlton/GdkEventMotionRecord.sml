structure GdkEventMotionRecord :>
  sig
    include GDK_EVENT_MOTION_RECORD
      where type 'a event_t = 'a GdkEvent.t
      where type C.notnull = GdkEvent.C.notnull
      where type 'a C.p = 'a GdkEvent.C.p
  end =
  struct
    type motion = unit
    type 'a event_t = 'a GdkEvent.t
    type t = motion event_t


    datatype event =
      MOTIONNOTIFY


    structure C = GdkEvent.C


    val t = GdkEvent.t
  end
