signature GDK_EVENT_SELECTION_RECORD =
  sig
    type selection
    type 'a event_union
    include
      RECORD
        where type t = selection event_union
    datatype event =
      SELECTION_CLEAR
    | SELECTION_REQUEST
    | SELECTION_NOTIFY
    val t : (t, t) ValueAccessor.t
    val tOpt : (t option, t option) ValueAccessor.t
  end
