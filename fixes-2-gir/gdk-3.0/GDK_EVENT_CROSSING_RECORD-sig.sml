signature GDK_EVENT_CROSSING_RECORD =
  sig
    type crossing
    type 'a event_union
    include
      RECORD
        where type t = crossing event_union
    datatype event =
      ENTER_NOTIFY
    | LEAVE_NOTIFY
    val t : (t, t) ValueAccessor.t
    val tOpt : (t option, t option) ValueAccessor.t
  end
