structure GtkFontSelectionClass :>
  GTK_FONT_SELECTION_CLASS
    where type 'a boxclass_t = 'a GtkBoxClass.t
    where type C.notnull = GtkBoxClass.C.notnull
    where type 'a C.p = 'a GtkBoxClass.C.p =
  struct
    type 'a fontselection = unit
    type 'a boxclass_t = 'a GtkBoxClass.t
    type 'a t = 'a fontselection boxclass_t
    fun toBase obj = obj
    val t = GtkBoxClass.t
    val tOpt = GtkBoxClass.tOpt
    structure C = GtkBoxClass.C
  end
