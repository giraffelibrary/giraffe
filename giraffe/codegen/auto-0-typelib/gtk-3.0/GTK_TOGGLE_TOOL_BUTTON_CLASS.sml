signature GTK_TOGGLE_TOOL_BUTTON_CLASS =
  sig
    type 'a toggle_tool_button
    type 'a tool_button_class
    include
      CLASS
        where type 'a class = 'a toggle_tool_button tool_button_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
