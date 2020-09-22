signature GDK_EVENT_CROSSING_RECORD =
  sig
    type crossing
    type 'a event_union
    include
      RECORD
        where type t = crossing event_union
  end
