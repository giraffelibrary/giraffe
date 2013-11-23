structure GtkFontButtonClass :>
  GTK_FONT_BUTTON_CLASS
    where type 'a buttonclass_t = 'a GtkButtonClass.t
    where type C.notnull = GtkButtonClass.C.notnull
    where type 'a C.p = 'a GtkButtonClass.C.p =
  struct
    type 'a fontbutton = unit
    type 'a buttonclass_t = 'a GtkButtonClass.t
    type 'a t = 'a fontbutton buttonclass_t
    fun toBase obj = obj
    val t = GtkButtonClass.t
    val tOpt = GtkButtonClass.tOpt
    structure C = GtkButtonClass.C
  end
