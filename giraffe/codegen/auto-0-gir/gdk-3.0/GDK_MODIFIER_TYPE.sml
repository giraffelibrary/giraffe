signature GDK_MODIFIER_TYPE =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val SHIFT_MASK : t
    val LOCK_MASK : t
    val CONTROL_MASK : t
    val MOD_1_MASK : t
    val MOD_2_MASK : t
    val MOD_3_MASK : t
    val MOD_4_MASK : t
    val MOD_5_MASK : t
    val BUTTON_1_MASK : t
    val BUTTON_2_MASK : t
    val BUTTON_3_MASK : t
    val BUTTON_4_MASK : t
    val BUTTON_5_MASK : t
    val MODIFIER_RESERVED_13_MASK : t
    val MODIFIER_RESERVED_14_MASK : t
    val MODIFIER_RESERVED_15_MASK : t
    val MODIFIER_RESERVED_16_MASK : t
    val MODIFIER_RESERVED_17_MASK : t
    val MODIFIER_RESERVED_18_MASK : t
    val MODIFIER_RESERVED_19_MASK : t
    val MODIFIER_RESERVED_20_MASK : t
    val MODIFIER_RESERVED_21_MASK : t
    val MODIFIER_RESERVED_22_MASK : t
    val MODIFIER_RESERVED_23_MASK : t
    val MODIFIER_RESERVED_24_MASK : t
    val MODIFIER_RESERVED_25_MASK : t
    val SUPER_MASK : t
    val HYPER_MASK : t
    val META_MASK : t
    val MODIFIER_RESERVED_29_MASK : t
    val RELEASE_MASK : t
    val MODIFIER_MASK : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
    structure C :
      sig
        type val_
        type ref_
        val withVal :
          (val_ -> 'a)
           -> t
           -> 'a
        val withRefVal :
          (ref_ -> 'a)
           -> t
           -> (val_, 'a) pair
        val fromVal : val_ -> t
      end
  end
