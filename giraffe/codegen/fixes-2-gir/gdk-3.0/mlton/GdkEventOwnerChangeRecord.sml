structure GdkEventOwnerChangeRecord :>
  GDK_EVENT_OWNER_CHANGE_RECORD
    where type 'a event_union = 'a GdkEvent.union
    where type C.non_opt = GdkEvent.C.non_opt
    where type 'a C.p = 'a GdkEvent.C.p =
  struct
    type 'a event_union = 'a GdkEvent.union
    open GdkEvent
    type owner_change = unit
    type t = owner_change union
    datatype event =
      OWNER_CHANGE
  end
