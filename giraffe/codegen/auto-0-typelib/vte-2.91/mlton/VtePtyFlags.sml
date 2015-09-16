structure VtePtyFlags :>
  sig
    include VTE_PTY_FLAGS
  end =
  struct
    val NO_LASTLOG = 0w1
    val NO_UTMP = 0w2
    val NO_WTMP = 0w4
    val NO_HELPER = 0w8
    val NO_FALLBACK = 0w16
    val DEFAULT = 0w0
    val allFlags =
      [
        NO_LASTLOG,
        NO_UTMP,
        NO_WTMP,
        NO_HELPER,
        NO_FALLBACK,
        DEFAULT
      ]
    structure BitFlags =
      Word32BitFlags (
        val allFlags = allFlags
      )
    open BitFlags
    type t = flags
    structure C =
      struct
        type val_ = FFI.Flags.C.val_
        type ref_ = FFI.Flags.C.ref_
        fun withVal f = f
        fun withRefVal f = withVal (FFI.Flags.C.withRef f)
        fun fromVal w = w
      end
    val getType_ = _import "vte_pty_flags_get_type" : unit -> GObjectType.C.val_;
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
