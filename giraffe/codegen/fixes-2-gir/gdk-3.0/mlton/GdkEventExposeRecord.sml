structure GdkEventExposeRecord :>
  sig
    include GDK_EVENT_EXPOSE_RECORD
      where type 'a event_union = 'a GdkEvent.union
      where type C.notnull = GdkEvent.C.notnull
      where type 'a C.p = 'a GdkEvent.C.p
  end =
  struct
    type expose = unit
    type 'a event_union = 'a GdkEvent.union
    type t = expose event_union


    datatype event =
      EXPOSE
    | DAMAGE


    structure C = GdkEvent.C


    val t = GdkEvent.t
    val tOpt = GdkEvent.tOpt
  end
