signature GDK_EVENT_GRAB_BROKEN_RECORD =
  sig
    type grab_broken
    type 'a event_union
    include
      RECORD
        where type t = grab_broken event_union
    datatype event =
      GRAB_BROKEN
    val t : t ValueAccessor.t
    val tOpt : t option ValueAccessor.t
  end
