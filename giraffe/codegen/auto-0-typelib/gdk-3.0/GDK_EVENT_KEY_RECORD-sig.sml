signature GDK_EVENT_KEY_RECORD =
  sig
    type key
    type 'a event_union
    include
      RECORD
        where type t = key event_union
  end
