signature GDK_EVENT_ANY_RECORD =
  sig
    type any
    type 'a event_union
    include
      RECORD
        where type t = any event_union
    datatype event =
      DELETE
    | DESTROY
    | MAP
    | UNMAP
    | CLIENT_EVENT
    val t : t ValueAccessor.t
    val tOpt : t option ValueAccessor.t
  end
