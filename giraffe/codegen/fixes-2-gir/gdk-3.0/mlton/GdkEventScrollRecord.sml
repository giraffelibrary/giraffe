structure GdkEventScrollRecord :>
  sig
    include GDK_EVENT_SCROLL_RECORD
      where type 'a event_union = 'a GdkEvent.union
      where type C.notnull = GdkEvent.C.notnull
      where type 'a C.p = 'a GdkEvent.C.p
  end =
  struct
    type scroll = unit
    type 'a event_union = 'a GdkEvent.union
    type t = scroll event_union


    datatype event =
      SCROLL


    structure C = GdkEvent.C


    val t = GdkEvent.t
    val tOpt = GdkEvent.tOpt
  end
