signature GDK_MODIFIER_TYPE =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val SHIFTMASK : t
    val LOCKMASK : t
    val CONTROLMASK : t
    val MOD1MASK : t
    val MOD2MASK : t
    val MOD3MASK : t
    val MOD4MASK : t
    val MOD5MASK : t
    val BUTTON1MASK : t
    val BUTTON2MASK : t
    val BUTTON3MASK : t
    val BUTTON4MASK : t
    val BUTTON5MASK : t
    val MODIFIERRESERVED13MASK : t
    val MODIFIERRESERVED14MASK : t
    val MODIFIERRESERVED15MASK : t
    val MODIFIERRESERVED16MASK : t
    val MODIFIERRESERVED17MASK : t
    val MODIFIERRESERVED18MASK : t
    val MODIFIERRESERVED19MASK : t
    val MODIFIERRESERVED20MASK : t
    val MODIFIERRESERVED21MASK : t
    val MODIFIERRESERVED22MASK : t
    val MODIFIERRESERVED23MASK : t
    val MODIFIERRESERVED24MASK : t
    val MODIFIERRESERVED25MASK : t
    val SUPERMASK : t
    val HYPERMASK : t
    val METAMASK : t
    val MODIFIERRESERVED29MASK : t
    val RELEASEMASK : t
    val MODIFIERMASK : t
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
