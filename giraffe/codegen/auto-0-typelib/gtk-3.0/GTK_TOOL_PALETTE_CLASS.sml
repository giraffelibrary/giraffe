signature GTK_TOOL_PALETTE_CLASS =
  sig
    type 'a tool_palette
    type 'a container_class
    include
      CLASS
        where type 'a class = 'a tool_palette container_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
