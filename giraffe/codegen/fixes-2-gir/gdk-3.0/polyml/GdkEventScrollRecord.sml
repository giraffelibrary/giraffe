structure GdkEventScrollRecord :>
  sig
    include GDK_EVENT_SCROLL_RECORD
      where type 'a event_union = 'a GdkEvent.union
      where type C.notnull = GdkEvent.C.notnull
      where type 'a C.p = 'a GdkEvent.C.p

    structure PolyML :
      sig
        val cPtr : C.notnull C.p PolyMLFFI.conversion
        val cOptPtr : unit C.p PolyMLFFI.conversion
      end
  end =
  struct
    type scroll = unit
    type 'a event_union = 'a GdkEvent.union
    type t = scroll event_union


    datatype event =
      SCROLL


    structure C = GdkEvent.C
    structure PolyML = GdkEvent.PolyML


    val t = GdkEvent.t
    val tOpt = GdkEvent.tOpt
  end
