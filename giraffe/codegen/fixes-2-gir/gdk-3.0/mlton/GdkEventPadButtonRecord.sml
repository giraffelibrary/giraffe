structure GdkEventPadButtonRecord :>
  GDK_EVENT_PAD_BUTTON_RECORD
    where type 'a event_union = 'a GdkEvent.union
    where type C.opt = GdkEvent.C.opt
    where type C.non_opt = GdkEvent.C.non_opt
    where type 'a C.p = 'a GdkEvent.C.p =
  struct
    type 'a event_union = 'a GdkEvent.union
    type pad_button = unit
    type t = pad_button GdkEvent.union
    structure Record = GdkEvent
    open Record
    datatype event =
      PAD_BUTTON_PRESS
    | PAD_BUTTON_RELEASE
  end
