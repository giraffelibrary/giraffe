signature GDK_EVENT_PAD_AXIS_RECORD =
  sig
    type pad_axis
    type 'a event_union
    include
      RECORD
        where type t = pad_axis event_union
  end
