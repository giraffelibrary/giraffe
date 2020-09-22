structure GdkEventExposeRecord :>
  GDK_EVENT_EXPOSE_RECORD
    where type 'a event_union = 'a GdkEvent.union
    where type C.opt = GdkEvent.C.opt
    where type C.non_opt = GdkEvent.C.non_opt
    where type 'a C.p = 'a GdkEvent.C.p =
  struct
    type 'a event_union = 'a GdkEvent.union
    type expose = unit
    type t = expose GdkEvent.union
    structure Record = GdkEvent
    open Record
    datatype event =
      EXPOSE
    | DAMAGE
  end
