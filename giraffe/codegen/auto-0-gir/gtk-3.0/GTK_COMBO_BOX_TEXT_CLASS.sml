signature GTK_COMBO_BOX_TEXT_CLASS =
  sig
    type 'a combo_box_text
    type 'a combo_box_class_t
    type 'a t = 'a combo_box_text combo_box_class_t
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
