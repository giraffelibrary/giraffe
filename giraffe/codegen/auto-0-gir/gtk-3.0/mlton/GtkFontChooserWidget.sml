structure GtkFontChooserWidget :>
  GTK_FONT_CHOOSER_WIDGET
    where type 'a class = 'a GtkFontChooserWidgetClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a font_chooser_class = 'a GtkFontChooserClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class =
  struct
    val getType_ = _import "gtk_font_chooser_widget_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_font_chooser_widget_new" : unit -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    type 'a class = 'a GtkFontChooserWidgetClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a font_chooser_class = 'a GtkFontChooserClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asFontChooser self = (GObjectObjectClass.C.withPtr ---> GtkFontChooserClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkFontChooserWidgetClass.C.fromPtr false) new_ ()
  end
