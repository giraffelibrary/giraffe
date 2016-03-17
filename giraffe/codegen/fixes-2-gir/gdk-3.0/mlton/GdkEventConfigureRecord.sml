structure GdkEventConfigureRecord :>
  sig
    include GDK_EVENT_CONFIGURE_RECORD
      where type 'a event_union = 'a GdkEvent.union
      where type C.notnull = GdkEvent.C.notnull
      where type 'a C.p = 'a GdkEvent.C.p
  end =
  struct
    type configure = unit
    type 'a event_union = 'a GdkEvent.union
    type t = configure event_union


    datatype event =
      CONFIGURE


    structure C = GdkEvent.C


    val t = GdkEvent.t
    val tOpt = GdkEvent.tOpt
  end
