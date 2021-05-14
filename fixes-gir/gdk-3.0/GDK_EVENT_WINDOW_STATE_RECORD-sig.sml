signature GDK_EVENT_WINDOW_STATE_RECORD =
  sig
    type window_state
    type 'a event_union
    include
      RECORD
        where type t = window_state event_union
    datatype event =
      WINDOW_STATE
    val t : t ValueAccessor.t
    val tOpt : t option ValueAccessor.t
  end
