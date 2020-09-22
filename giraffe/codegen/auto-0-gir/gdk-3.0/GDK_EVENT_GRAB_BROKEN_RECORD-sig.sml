signature GDK_EVENT_GRAB_BROKEN_RECORD =
  sig
    type grab_broken
    type 'a event_union
    include
      RECORD
        where type t = grab_broken event_union
  end
