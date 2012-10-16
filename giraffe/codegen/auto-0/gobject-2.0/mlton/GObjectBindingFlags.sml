structure GObjectBindingFlags :>
  sig
    include
      G_OBJECT_BINDING_FLAGS
        where type ('a, 'b) value_accessor = ('a, 'b) GObjectValue.accessor
        where type type_t = GObjectType.t
  end =
  struct
    val DEFAULT = 0w0
    val BIDIRECTIONAL = 0w1
    val SYNCCREATE = 0w2
    val INVERTBOOLEAN = 0w4
    val allFlags =
      [
        DEFAULT,
        BIDIRECTIONAL,
        SYNCCREATE,
        INVERTBOOLEAN
      ]
    structure BitFlags =
      Word32BitFlags (
        val allFlags = allFlags
      )
    open BitFlags
    type t = flags
    structure C =
      struct
        type val_ = FFI.Flags.val_
        type ref_ = FFI.Flags.ref_
        fun withVal f = f
        fun withRefVal f = withVal (FFI.Flags.withRef f)
        fun fromVal w = w
      end
    val getType_ = _import "g_binding_flags_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_flags" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_flags" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    type ('a, 'b) value_accessor = ('a, 'b) GObjectValue.accessor
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    type type_t = GObjectType.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
