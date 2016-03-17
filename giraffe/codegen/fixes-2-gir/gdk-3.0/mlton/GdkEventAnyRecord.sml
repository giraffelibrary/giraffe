structure GdkEventAnyRecord :>
  sig
    include GDK_EVENT_ANY_RECORD
      where type 'a event_union = 'a GdkEvent.union
      where type C.notnull = GdkEvent.C.notnull
      where type 'a C.p = 'a GdkEvent.C.p
  end =
  struct
    type any = unit
    type 'a event_union = 'a GdkEvent.union
    type t = any event_union


    datatype event =
      DELETE
    | DESTROY
    | MAP
    | UNMAP
    | CLIENT_EVENT


    structure C = GdkEvent.C


    val t = GdkEvent.t
    val tOpt = GdkEvent.tOpt
  end
