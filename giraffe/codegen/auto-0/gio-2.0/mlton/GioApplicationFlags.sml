structure GioApplicationFlags :>
  sig
    include GIO_APPLICATION_FLAGS
  end =
  struct
    val FLAGSNONE = 0w0
    val ISSERVICE = 0w1
    val ISLAUNCHER = 0w2
    val HANDLESOPEN = 0w4
    val HANDLESCOMMANDLINE = 0w8
    val SENDENVIRONMENT = 0w16
    val NONUNIQUE = 0w32
    val allFlags =
      [
        FLAGSNONE,
        ISSERVICE,
        ISLAUNCHER,
        HANDLESOPEN,
        HANDLESCOMMANDLINE,
        SENDENVIRONMENT,
        NONUNIQUE
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
    val getType_ = _import "g_application_flags_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_flags" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_flags" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
