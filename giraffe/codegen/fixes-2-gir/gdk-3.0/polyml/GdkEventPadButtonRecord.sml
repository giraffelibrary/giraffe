structure GdkEventPadButtonRecord :>
  GDK_EVENT_PAD_BUTTON_RECORD
    where type 'a event_union = 'a GdkEvent.union
    where type C.notnull = GdkEvent.C.notnull
    where type 'a C.p = 'a GdkEvent.C.p =
  struct
    type 'a event_union = 'a GdkEvent.union
    open GdkEvent
    type pad_button = unit
    type t = pad_button union
    datatype event =
      PAD_BUTTON_PRESS
    | PAD_BUTTON_RELEASE
  end
