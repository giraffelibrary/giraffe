signature GDK_EVENT_PROPERTY_RECORD =
  sig
    type property
    type 'a event_union
    include
      RECORD
        where type t = property event_union
    datatype event =
      PROPERTY_NOTIFY
    val t : t ValueAccessor.t
    val tOpt : t option ValueAccessor.t
  end
