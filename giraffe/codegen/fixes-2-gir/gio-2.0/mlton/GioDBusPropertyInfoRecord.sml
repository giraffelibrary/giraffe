structure GioDBusPropertyInfoRecord :> GIO_D_BUS_PROPERTY_INFO_RECORD =
  struct
    structure Pointer = CPointerInternal
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p

    val dup_ = _import "g_dbus_property_info_ref" : notnull p -> notnull p;
    val free_ = _import "g_dbus_property_info_unref" : notnull p -> unit;
    val getType_ = _import "g_dbus_property_info_get_type" : unit -> GObjectType.FFI.val_;

    structure Record =
      BoxedRecord(
        structure Pointer = Pointer
        type notnull = notnull
        type 'a p = 'a p
        val dup_ = dup_
        val take_ = ignore
        val free_ = free_
      )
    open Record

    structure Type =
      BoxedType(
        structure Record = Record
        type t = t
        val getType_ = getType_
      )
    open Type
  end