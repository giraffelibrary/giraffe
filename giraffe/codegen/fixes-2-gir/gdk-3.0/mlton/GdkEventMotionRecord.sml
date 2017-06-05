structure GdkEventMotionRecord :>
  GDK_EVENT_MOTION_RECORD
    where type 'a event_union = 'a GdkEvent.union
    where type C.notnull = GdkEvent.C.notnull
    where type 'a C.p = 'a GdkEvent.C.p =
  struct
    type 'a event_union = 'a GdkEvent.union
    open GdkEvent
    type motion = unit
    type t = motion union
    datatype event =
      MOTION_NOTIFY
  end
