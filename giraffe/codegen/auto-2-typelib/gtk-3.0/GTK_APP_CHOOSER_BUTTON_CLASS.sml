signature GTK_APP_CHOOSER_BUTTON_CLASS =
  sig
    type 'a appchooserbutton
    type 'a comboboxclass_t
    type 'a t = 'a appchooserbutton comboboxclass_t
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
