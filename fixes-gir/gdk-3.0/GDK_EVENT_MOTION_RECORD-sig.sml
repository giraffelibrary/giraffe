signature GDK_EVENT_MOTION_RECORD =
  sig
    type motion
    type 'a event_union
    include
      RECORD
        where type t = motion event_union
    datatype event =
      MOTION_NOTIFY
    val t : t ValueAccessor.t
    val tOpt : t option ValueAccessor.t
  end
