structure GdkEventSelectionRecord :>
  sig
    include GDK_EVENT_SELECTION_RECORD
      where type 'a event_t = 'a GdkEvent.t
      where type C.notnull = GdkEvent.C.notnull
      where type 'a C.p = 'a GdkEvent.C.p
  end =
  struct
    type selection = unit
    type 'a event_t = 'a GdkEvent.t
    type t = selection event_t


    datatype event =
      SELECTIONCLEAR
    | SELECTIONREQUEST
    | SELECTIONNOTIFY


    structure C = GdkEvent.C


    val t = GdkEvent.t
  end
