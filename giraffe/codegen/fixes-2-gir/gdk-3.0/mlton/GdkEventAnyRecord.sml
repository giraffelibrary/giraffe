structure GdkEventAnyRecord :>
  sig
    include GDK_EVENT_ANY_RECORD
      where type 'a event_t = 'a GdkEvent.t
      where type C.notnull = GdkEvent.C.notnull
      where type 'a C.p = 'a GdkEvent.C.p
  end =
  struct
    type any = unit
    type 'a event_t = 'a GdkEvent.t
    type t = any event_t


    datatype event =
      DELETE
    | DESTROY
    | MAP
    | UNMAP
    | CLIENT_EVENT


    structure C = GdkEvent.C


    val t = GdkEvent.t
  end
