structure GtkFontChooserDialog :>
  GTK_FONT_CHOOSER_DIALOG
    where type 'a class = 'a GtkFontChooserDialogClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a font_chooser_class = 'a GtkFontChooserClass.class
    where type 'a window_class = 'a GtkWindowClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_font_chooser_dialog_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_font_chooser_dialog_new") (Utf8.PolyML.cInPtr &&> GtkWindowClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
    end
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
