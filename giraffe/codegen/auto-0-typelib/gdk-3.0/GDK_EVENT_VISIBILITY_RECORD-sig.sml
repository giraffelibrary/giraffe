signature GDK_EVENT_VISIBILITY_RECORD =
  sig
    type visibility
    type 'a event_union
    include
      RECORD
        where type t = visibility event_union
  end
