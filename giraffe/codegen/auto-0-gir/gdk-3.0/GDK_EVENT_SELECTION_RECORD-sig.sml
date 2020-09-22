signature GDK_EVENT_SELECTION_RECORD =
  sig
    type selection
    type 'a event_union
    include
      RECORD
        where type t = selection event_union
  end
