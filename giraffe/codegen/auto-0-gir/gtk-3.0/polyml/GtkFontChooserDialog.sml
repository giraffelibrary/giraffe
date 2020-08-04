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
      val getType_ = call (getSymbol "gtk_font_chooser_dialog_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_font_chooser_dialog_new") (Utf8.PolyML.cInOptPtr &&> GtkWindowClass.PolyML.cOptPtr --> GtkWidgetClass.PolyML.cPtr)
    end
    type 'a class = 'a GtkFontChooserDialogClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a font_chooser_class = 'a GtkFontChooserClass.class
    type 'a window_class = 'a GtkWindowClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asFontChooser self = (GObjectObjectClass.FFI.withPtr false ---> GtkFontChooserClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (title, parent) = (Utf8.FFI.withOptPtr 0 &&&> GtkWindowClass.FFI.withOptPtr false ---> GtkFontChooserDialogClass.FFI.fromPtr false) new_ (title & parent)
  end
