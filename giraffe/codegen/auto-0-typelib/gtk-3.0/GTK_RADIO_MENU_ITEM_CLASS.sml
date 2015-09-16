signature GTK_RADIO_MENU_ITEM_CLASS =
  sig
    type 'a radio_menu_item
    type 'a check_menu_item_class_t
    type 'a t = 'a radio_menu_item check_menu_item_class_t
    val toBase : 'a t -> base t
    val t : (base t, 'a t) GObject.Value.accessor
    val tOpt : (base t option, 'a t option) GObject.Value.accessor
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr :
          bool
           -> notnull p
           -> 'a t
        val fromOptPtr :
          bool
           -> unit p
           -> 'a t option
      end
  end
