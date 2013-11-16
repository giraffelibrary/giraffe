structure GdkEventDNDRecord :>
  sig
    include GDK_EVENT_D_N_D_RECORD
      where type 'a event_t = 'a GdkEvent.t
      where type C.notnull = GdkEvent.C.notnull
      where type 'a C.p = 'a GdkEvent.C.p
  end =
  struct
    type dnd = unit
    type 'a event_t = 'a GdkEvent.t
    type t = dnd event_t


    datatype event =
      DRAGENTER
    | DRAGLEAVE
    | DRAGMOTION
    | DRAGSTATUS
    | DROPSTART
    | DROPFINISHED


    structure C = GdkEvent.C


    val t = GdkEvent.t
  end
