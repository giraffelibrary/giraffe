signature GTK_TOOL_BUTTON_CLASS =
  sig
    type 'a tool_button
    type 'a tool_item_class
    include
      CLASS
        where type 'a class = 'a tool_button tool_item_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
