signature GTK_RADIO_TOOL_BUTTON_CLASS =
  sig
    type 'a radiotoolbutton
    type 'a toggletoolbuttonclass_t
    type 'a t = 'a radiotoolbutton toggletoolbuttonclass_t
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
