signature GDK_EVENT_PROXIMITY_RECORD =
  sig
    type proximity
    type 'a event_union
    include
      RECORD
        where type t = proximity event_union
    datatype event =
      PROXIMITY_IN
    | PROXIMITY_OUT
    val t : t ValueAccessor.t
    val tOpt : t option ValueAccessor.t
  end
