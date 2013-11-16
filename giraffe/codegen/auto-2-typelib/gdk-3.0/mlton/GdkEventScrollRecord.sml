structure GdkEventScrollRecord :>
  sig
    include GDK_EVENT_SCROLL_RECORD
      where type 'a event_t = 'a GdkEvent.t
      where type C.notnull = GdkEvent.C.notnull
      where type 'a C.p = 'a GdkEvent.C.p
  end =
  struct
    type scroll = unit
    type 'a event_t = 'a GdkEvent.t
    type t = scroll event_t


    datatype event =
      SCROLL


    structure C = GdkEvent.C


    val t = GdkEvent.t
  end
