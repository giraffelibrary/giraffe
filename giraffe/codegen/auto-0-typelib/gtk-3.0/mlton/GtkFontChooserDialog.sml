structure GtkFontChooserDialog :>
  GTK_FONT_CHOOSER_DIALOG
    where type 'a class = 'a GtkFontChooserDialogClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a font_chooser_class = 'a GtkFontChooserClass.class
    where type 'a window_class = 'a GtkWindowClass.class =
  struct
    val getType_ = _import "gtk_font_chooser_dialog_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gtk_font_chooser_dialog_new" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GtkWindowClass.C.notnull GtkWindowClass.C.p
               -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkFontChooserDialogClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a font_chooser_class = 'a GtkFontChooserClass.class
    type 'a window_class = 'a GtkWindowClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asFontChooser self = (GObjectObjectClass.C.withPtr ---> GtkFontChooserClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new title window = (Utf8.C.withPtr &&&> GtkWindowClass.C.withPtr ---> GtkFontChooserDialogClass.C.fromPtr false) new_ (title & window)
  end
