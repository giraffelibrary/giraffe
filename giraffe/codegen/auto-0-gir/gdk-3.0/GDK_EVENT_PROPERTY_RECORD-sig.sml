signature GDK_EVENT_PROPERTY_RECORD =
  sig
    type property
    type 'a event_union
    include
      RECORD
        where type t = property event_union
  end
