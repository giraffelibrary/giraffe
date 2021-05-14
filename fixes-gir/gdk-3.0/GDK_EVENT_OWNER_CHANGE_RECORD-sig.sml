signature GDK_EVENT_OWNER_CHANGE_RECORD =
  sig
    type owner_change
    type 'a event_union
    include
      RECORD
        where type t = owner_change event_union
    datatype event =
      OWNER_CHANGE
    val t : t ValueAccessor.t
    val tOpt : t option ValueAccessor.t
  end
