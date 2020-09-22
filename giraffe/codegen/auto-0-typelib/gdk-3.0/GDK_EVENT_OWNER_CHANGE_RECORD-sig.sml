signature GDK_EVENT_OWNER_CHANGE_RECORD =
  sig
    type owner_change
    type 'a event_union
    include
      RECORD
        where type t = owner_change event_union
  end
