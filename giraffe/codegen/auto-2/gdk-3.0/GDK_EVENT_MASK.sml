signature GDK_EVENT_MASK =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val EXPOSUREMASK : t
    val POINTERMOTIONMASK : t
    val POINTERMOTIONHINTMASK : t
    val BUTTONMOTIONMASK : t
    val BUTTON1MOTIONMASK : t
    val BUTTON2MOTIONMASK : t
    val BUTTON3MOTIONMASK : t
    val BUTTONPRESSMASK : t
    val BUTTONRELEASEMASK : t
    val KEYPRESSMASK : t
    val KEYRELEASEMASK : t
    val ENTERNOTIFYMASK : t
    val LEAVENOTIFYMASK : t
    val FOCUSCHANGEMASK : t
    val STRUCTUREMASK : t
    val PROPERTYCHANGEMASK : t
    val VISIBILITYNOTIFYMASK : t
    val PROXIMITYINMASK : t
    val PROXIMITYOUTMASK : t
    val SUBSTRUCTUREMASK : t
    val SCROLLMASK : t
    val ALLEVENTSMASK : t
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
