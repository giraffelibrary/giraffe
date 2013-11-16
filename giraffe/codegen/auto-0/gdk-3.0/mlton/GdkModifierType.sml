structure GdkModifierType :>
  sig
    include GDK_MODIFIER_TYPE
  end =
  struct
    val SHIFTMASK = 0w1
    val LOCKMASK = 0w2
    val CONTROLMASK = 0w4
    val MOD1MASK = 0w8
    val MOD2MASK = 0w16
    val MOD3MASK = 0w32
    val MOD4MASK = 0w64
    val MOD5MASK = 0w128
    val BUTTON1MASK = 0w256
    val BUTTON2MASK = 0w512
    val BUTTON3MASK = 0w1024
    val BUTTON4MASK = 0w2048
    val BUTTON5MASK = 0w4096
    val MODIFIERRESERVED13MASK = 0w8192
    val MODIFIERRESERVED14MASK = 0w16384
    val MODIFIERRESERVED15MASK = 0w32768
    val MODIFIERRESERVED16MASK = 0w65536
    val MODIFIERRESERVED17MASK = 0w131072
    val MODIFIERRESERVED18MASK = 0w262144
    val MODIFIERRESERVED19MASK = 0w524288
    val MODIFIERRESERVED20MASK = 0w1048576
    val MODIFIERRESERVED21MASK = 0w2097152
    val MODIFIERRESERVED22MASK = 0w4194304
    val MODIFIERRESERVED23MASK = 0w8388608
    val MODIFIERRESERVED24MASK = 0w16777216
    val MODIFIERRESERVED25MASK = 0w33554432
    val SUPERMASK = 0w67108864
    val HYPERMASK = 0w134217728
    val METAMASK = 0w268435456
    val MODIFIERRESERVED29MASK = 0w536870912
    val RELEASEMASK = 0w1073741824
    val MODIFIERMASK = 0w1543512063
    val allFlags =
      [
        SHIFTMASK,
        LOCKMASK,
        CONTROLMASK,
        MOD1MASK,
        MOD2MASK,
        MOD3MASK,
        MOD4MASK,
        MOD5MASK,
        BUTTON1MASK,
        BUTTON2MASK,
        BUTTON3MASK,
        BUTTON4MASK,
        BUTTON5MASK,
        MODIFIERRESERVED13MASK,
        MODIFIERRESERVED14MASK,
        MODIFIERRESERVED15MASK,
        MODIFIERRESERVED16MASK,
        MODIFIERRESERVED17MASK,
        MODIFIERRESERVED18MASK,
        MODIFIERRESERVED19MASK,
        MODIFIERRESERVED20MASK,
        MODIFIERRESERVED21MASK,
        MODIFIERRESERVED22MASK,
        MODIFIERRESERVED23MASK,
        MODIFIERRESERVED24MASK,
        MODIFIERRESERVED25MASK,
        SUPERMASK,
        HYPERMASK,
        METAMASK,
        MODIFIERRESERVED29MASK,
        RELEASEMASK,
        MODIFIERMASK
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
    val getType_ = _import "gdk_modifier_type_get_type" : unit -> GObjectType.C.val_;
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
