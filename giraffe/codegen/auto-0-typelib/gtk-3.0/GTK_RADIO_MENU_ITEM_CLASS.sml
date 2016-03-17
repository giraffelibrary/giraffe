signature GTK_RADIO_MENU_ITEM_CLASS =
  sig
    type 'a radio_menu_item
    type 'a check_menu_item_class
    type 'a class = 'a radio_menu_item check_menu_item_class
    type t = base class
    val toBase : 'a class -> base class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr :
          bool
           -> notnull p
           -> 'a class
        val fromOptPtr :
          bool
           -> unit p
           -> 'a class option
      end
  end
