structure GtkFontChooserDialog :>
  GTK_FONT_CHOOSER_DIALOG
    where type 'a class_t = 'a GtkFontChooserDialogClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a font_chooser_class_t = 'a GtkFontChooserClass.t
    where type 'a window_class_t = 'a GtkWindowClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_font_chooser_dialog_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_font_chooser_dialog_new") (Utf8.PolyML.INPTR &&> GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
    end
    type 'a class_t = 'a GtkFontChooserDialogClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type 'a font_chooser_class_t = 'a GtkFontChooserClass.t
    type 'a window_class_t = 'a GtkWindowClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asFontChooser self = (GObjectObjectClass.C.withPtr ---> GtkFontChooserClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new title window = (Utf8.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> GtkFontChooserDialogClass.C.fromPtr false) new_ (title & window)
  end
