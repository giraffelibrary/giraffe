structure GdkEventButtonRecord :>
  sig
    include GDK_EVENT_BUTTON_RECORD
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
    type button = unit
    type 'a event_t = 'a GdkEvent.t
    type t = button event_t


    datatype event =
      BUTTON_PRESS
    | DOUBLE_BUTTON_PRESS
    | TRIPLE_BUTTON_PRESS
    | BUTTON_RELEASE


    structure C = GdkEvent.C
    structure PolyML = GdkEvent.PolyML


    val t = GdkEvent.t
  end
