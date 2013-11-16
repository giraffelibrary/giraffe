structure GtkToolPaletteClass :>
  GTK_TOOL_PALETTE_CLASS
    where type 'a containerclass_t = 'a GtkContainerClass.t
    where type C.notnull = GtkContainerClass.C.notnull
    where type 'a C.p = 'a GtkContainerClass.C.p =
  struct
    type 'a toolpalette = unit
    type 'a containerclass_t = 'a GtkContainerClass.t
    type 'a t = 'a toolpalette containerclass_t
    fun toBase obj = obj
    val t = GtkContainerClass.t
    val tOpt = GtkContainerClass.tOpt
    structure C = GtkContainerClass.C
  end
