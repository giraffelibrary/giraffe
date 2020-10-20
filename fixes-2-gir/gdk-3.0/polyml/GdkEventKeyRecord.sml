structure GdkEventKeyRecord :>
  GDK_EVENT_KEY_RECORD
    where type 'a event_union = 'a GdkEvent.union
    where type C.opt = GdkEvent.C.opt
    where type C.non_opt = GdkEvent.C.non_opt
    where type 'a C.p = 'a GdkEvent.C.p =
  struct
    type 'a event_union = 'a GdkEvent.union
    type key = unit
    type t = key GdkEvent.union
    structure Record = GdkEvent
    open Record
    datatype event =
      KEY_PRESS
    | KEY_RELEASE
  end
