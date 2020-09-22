signature GDK_EVENT_PAD_BUTTON_RECORD =
  sig
    type pad_button
    type 'a event_union
    include
      RECORD
        where type t = pad_button event_union
  end
