structure GtkFontButtonClass :>
  GTK_FONT_BUTTON_CLASS
    where type 'a button_class = 'a GtkButtonClass.class
    where type C.notnull = GtkButtonClass.C.notnull
    where type 'a C.p = 'a GtkButtonClass.C.p =
  struct
    type 'a font_button = unit
    type 'a button_class = 'a GtkButtonClass.class
    type 'a class = 'a font_button button_class
    type t = base class
    fun toBase obj = obj
    val t = GtkButtonClass.t
    val tOpt = GtkButtonClass.tOpt
    structure C = GtkButtonClass.C
  end
