signature GDK_EVENT_MOTION_RECORD =
  sig
    type motion
    type 'a event_union
    include
      RECORD
        where type t = motion event_union
  end
