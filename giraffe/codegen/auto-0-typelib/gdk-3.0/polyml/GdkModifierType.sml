structure GdkModifierType :> GDK_MODIFIER_TYPE =
  struct
    val SHIFT_MASK = 0w1
    val LOCK_MASK = 0w2
    val CONTROL_MASK = 0w4
    val MOD_1_MASK = 0w8
    val MOD_2_MASK = 0w16
    val MOD_3_MASK = 0w32
    val MOD_4_MASK = 0w64
    val MOD_5_MASK = 0w128
    val BUTTON_1_MASK = 0w256
    val BUTTON_2_MASK = 0w512
    val BUTTON_3_MASK = 0w1024
    val BUTTON_4_MASK = 0w2048
    val BUTTON_5_MASK = 0w4096
    val MODIFIER_RESERVED_13_MASK = 0w8192
    val MODIFIER_RESERVED_14_MASK = 0w16384
    val MODIFIER_RESERVED_15_MASK = 0w32768
    val MODIFIER_RESERVED_16_MASK = 0w65536
    val MODIFIER_RESERVED_17_MASK = 0w131072
    val MODIFIER_RESERVED_18_MASK = 0w262144
    val MODIFIER_RESERVED_19_MASK = 0w524288
    val MODIFIER_RESERVED_20_MASK = 0w1048576
    val MODIFIER_RESERVED_21_MASK = 0w2097152
    val MODIFIER_RESERVED_22_MASK = 0w4194304
    val MODIFIER_RESERVED_23_MASK = 0w8388608
    val MODIFIER_RESERVED_24_MASK = 0w16777216
    val MODIFIER_RESERVED_25_MASK = 0w33554432
    val SUPER_MASK = 0w67108864
    val HYPER_MASK = 0w134217728
    val META_MASK = 0w268435456
    val MODIFIER_RESERVED_29_MASK = 0w536870912
    val RELEASE_MASK = 0w1073741824
    val MODIFIER_MASK = 0w1543512063
    val allFlags =
      [
        SHIFT_MASK,
        LOCK_MASK,
        CONTROL_MASK,
        MOD_1_MASK,
        MOD_2_MASK,
        MOD_3_MASK,
        MOD_4_MASK,
        MOD_5_MASK,
        BUTTON_1_MASK,
        BUTTON_2_MASK,
        BUTTON_3_MASK,
        BUTTON_4_MASK,
        BUTTON_5_MASK,
        MODIFIER_RESERVED_13_MASK,
        MODIFIER_RESERVED_14_MASK,
        MODIFIER_RESERVED_15_MASK,
        MODIFIER_RESERVED_16_MASK,
        MODIFIER_RESERVED_17_MASK,
        MODIFIER_RESERVED_18_MASK,
        MODIFIER_RESERVED_19_MASK,
        MODIFIER_RESERVED_20_MASK,
        MODIFIER_RESERVED_21_MASK,
        MODIFIER_RESERVED_22_MASK,
        MODIFIER_RESERVED_23_MASK,
        MODIFIER_RESERVED_24_MASK,
        MODIFIER_RESERVED_25_MASK,
        SUPER_MASK,
        HYPER_MASK,
        META_MASK,
        MODIFIER_RESERVED_29_MASK,
        RELEASE_MASK,
        MODIFIER_MASK
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_modifier_type_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_flags") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_flags") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> cVoid)
    end
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
