signature GDK_EVENT_SCROLL_RECORD =
  sig
    type scroll
    type 'a event_union
    include
      RECORD
        where type t = scroll event_union
    datatype event =
      SCROLL
    val t : t ValueAccessor.t
    val tOpt : t option ValueAccessor.t
  end
