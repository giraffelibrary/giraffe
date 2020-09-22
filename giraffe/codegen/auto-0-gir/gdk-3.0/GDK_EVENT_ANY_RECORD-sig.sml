signature GDK_EVENT_ANY_RECORD =
  sig
    type any
    type 'a event_union
    include
      RECORD
        where type t = any event_union
  end
