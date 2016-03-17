signature GTK_TOGGLE_TOOL_BUTTON_CLASS =
  sig
    type 'a toggle_tool_button
    type 'a tool_button_class
    type 'a class = 'a toggle_tool_button tool_button_class
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
