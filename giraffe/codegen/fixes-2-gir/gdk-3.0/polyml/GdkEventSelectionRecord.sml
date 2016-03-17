structure GdkEventSelectionRecord :>
  sig
    include GDK_EVENT_SELECTION_RECORD
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
    type selection = unit
    type 'a event_union = 'a GdkEvent.union
    type t = selection event_union


    datatype event =
      SELECTION_CLEAR
    | SELECTION_REQUEST
    | SELECTION_NOTIFY


    structure C = GdkEvent.C
    structure PolyML = GdkEvent.PolyML


    val t = GdkEvent.t
    val tOpt = GdkEvent.tOpt
  end
