signature GTK_V_BUTTON_BOX_CLASS =
  sig
    type 'a v_button_box
    type 'a button_box_class_t
    type 'a t = 'a v_button_box button_box_class_t
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
