signature GDK_EVENT_PAD_GROUP_MODE_RECORD =
  sig
    type pad_group_mode
    type 'a event_union
    include
      RECORD
        where type t = pad_group_mode event_union
  end
