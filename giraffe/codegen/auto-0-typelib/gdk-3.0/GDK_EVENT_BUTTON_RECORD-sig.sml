signature GDK_EVENT_BUTTON_RECORD =
  sig
    type button
    type 'a event_union
    include
      RECORD
        where type t = button event_union
  end
