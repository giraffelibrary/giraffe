signature GDK_EVENT_PROXIMITY_RECORD =
  sig
    type proximity
    type 'a event_union
    include
      RECORD
        where type t = proximity event_union
  end
