signature GTK_RADIO_TOOL_BUTTON_CLASS =
  sig
    type 'a radio_tool_button
    type 'a toggle_tool_button_class
    include
      CLASS
        where type 'a class = 'a radio_tool_button toggle_tool_button_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
