structure GdkEventSelectionRecord :>
  sig
    include GDK_EVENT_SELECTION_RECORD
      where type 'a event_union = 'a GdkEvent.union
      where type C.notnull = GdkEvent.C.notnull
      where type 'a C.p = 'a GdkEvent.C.p
  end =
  struct
    type selection = unit
    type 'a event_union = 'a GdkEvent.union
    type t = selection event_union


    datatype event =
      SELECTION_CLEAR
    | SELECTION_REQUEST
    | SELECTION_NOTIFY


    structure C = GdkEvent.C


    val t = GdkEvent.t
    val tOpt = GdkEvent.tOpt
  end
