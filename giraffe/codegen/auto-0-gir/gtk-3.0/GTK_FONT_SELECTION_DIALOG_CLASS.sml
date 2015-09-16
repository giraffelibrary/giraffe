signature GTK_FONT_SELECTION_DIALOG_CLASS =
  sig
    type 'a font_selection_dialog
    type 'a dialog_class_t
    type 'a t = 'a font_selection_dialog dialog_class_t
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
