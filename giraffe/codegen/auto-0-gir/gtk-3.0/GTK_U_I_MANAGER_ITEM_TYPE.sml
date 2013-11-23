signature GTK_U_I_MANAGER_ITEM_TYPE =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val AUTO : t
    val MENUBAR : t
    val MENU : t
    val TOOLBAR : t
    val PLACEHOLDER : t
    val POPUP : t
    val MENUITEM : t
    val TOOLITEM : t
    val SEPARATOR : t
    val ACCELERATOR : t
    val POPUPWITHACCELS : t
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
