structure GdkEventAnyRecord :>
  sig
    include GDK_EVENT_ANY_RECORD
      where type 'a event_t = 'a GdkEvent.t
      where type C.notnull = GdkEvent.C.notnull
      where type 'a C.p = 'a GdkEvent.C.p

    structure PolyML :
      sig
        val PTR : C.notnull C.p CInterface.Conversion
        val OPTPTR : unit C.p CInterface.Conversion
      end
  end =
  struct
    type any = unit
    type 'a event_t = 'a GdkEvent.t
    type t = any event_t


    datatype event =
      DELETE
    | DESTROY
    | MAP
    | UNMAP
    | CLIENTEVENT


    structure C = GdkEvent.C
    structure PolyML = GdkEvent.PolyML


    val t = GdkEvent.t
  end