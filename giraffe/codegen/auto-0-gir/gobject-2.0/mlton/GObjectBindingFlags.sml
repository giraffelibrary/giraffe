structure GObjectBindingFlags :>
  G_OBJECT_BINDING_FLAGS
    where type ('a, 'b) value_accessor = ('a, 'b) GObjectValue.accessor
    where type type_t = GObjectType.t =
  struct
    val DEFAULT = 0w0
    val BIDIRECTIONAL = 0w1
    val SYNC_CREATE = 0w2
    val INVERT_BOOLEAN = 0w4
    val allFlags =
      [
        DEFAULT,
        BIDIRECTIONAL,
        SYNC_CREATE,
        INVERT_BOOLEAN
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    val getType_ = _import "g_binding_flags_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_flags" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_flags" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    type ('a, 'b) value_accessor = ('a, 'b) GObjectValue.accessor
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    type type_t = GObjectType.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
