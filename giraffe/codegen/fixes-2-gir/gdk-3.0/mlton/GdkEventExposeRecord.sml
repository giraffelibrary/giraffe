structure GdkEventExposeRecord :>
  GDK_EVENT_EXPOSE_RECORD
    where type 'a event_union = 'a GdkEvent.union
    where type C.non_opt = GdkEvent.C.non_opt
    where type 'a C.p = 'a GdkEvent.C.p =
  struct
    type 'a event_union = 'a GdkEvent.union
    open GdkEvent
    type expose = unit
    type t = expose union
    datatype event =
      EXPOSE
    | DAMAGE
  end
