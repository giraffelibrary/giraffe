signature GDK_EVENT_CONFIGURE_RECORD =
  sig
    type configure
    type 'a event_union
    include
      RECORD
        where type t = configure event_union
    datatype event =
      CONFIGURE
    val t : t ValueAccessor.t
    val tOpt : t option ValueAccessor.t
  end
