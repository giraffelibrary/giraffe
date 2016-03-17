signature GTK_APP_CHOOSER_BUTTON_CLASS =
  sig
    type 'a app_chooser_button
    type 'a combo_box_class
    type 'a class = 'a app_chooser_button combo_box_class
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
