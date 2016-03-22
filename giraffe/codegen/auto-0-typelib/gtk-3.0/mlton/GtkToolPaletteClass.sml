structure GtkToolPaletteClass :>
  GTK_TOOL_PALETTE_CLASS
    where type 'a container_class = 'a GtkContainerClass.class
    where type C.notnull = GtkContainerClass.C.notnull
    where type 'a C.p = 'a GtkContainerClass.C.p =
  struct
    type 'a container_class = 'a GtkContainerClass.class
    open GtkContainerClass
    type 'a tool_palette = unit
    type 'a class = 'a tool_palette class
  end
