structure GdkEventPadGroupModeRecord :>
  GDK_EVENT_PAD_GROUP_MODE_RECORD
    where type 'a event_union = 'a GdkEvent.union
    where type C.notnull = GdkEvent.C.notnull
    where type 'a C.p = 'a GdkEvent.C.p =
  struct
    type 'a event_union = 'a GdkEvent.union
    open GdkEvent
    type pad_group_mode = unit
    type t = pad_group_mode union
    datatype event =
      PAD_GROUP_MODE
  end
