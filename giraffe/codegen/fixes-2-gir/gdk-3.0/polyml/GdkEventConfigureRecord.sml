structure GdkEventConfigureRecord :>
  sig
    include GDK_EVENT_CONFIGURE_RECORD
      where type 'a event_t = 'a GdkEvent.t
      where type C.notnull = GdkEvent.C.notnull
      where type 'a C.p = 'a GdkEvent.C.p

    structure PolyML :
      sig
        val cPtr : C.notnull C.p PolyMLFFI.conversion
        val cOptPtr : unit C.p PolyMLFFI.conversion
      end
  end =
  struct
    type configure = unit
    type 'a event_t = 'a GdkEvent.t
    type t = configure event_t


    datatype event =
      CONFIGURE


    structure C = GdkEvent.C
    structure PolyML = GdkEvent.PolyML


    val t = GdkEvent.t
  end
