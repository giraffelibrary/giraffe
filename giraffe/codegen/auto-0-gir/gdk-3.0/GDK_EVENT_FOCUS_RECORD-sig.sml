signature GDK_EVENT_FOCUS_RECORD =
  sig
    type focus_change
    type 'a event_union
    include
      RECORD
        where type t = focus_change event_union
  end
