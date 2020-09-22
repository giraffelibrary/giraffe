signature GDK_EVENT_SCROLL_RECORD =
  sig
    type scroll
    type 'a event_union
    include
      RECORD
        where type t = scroll event_union
  end
