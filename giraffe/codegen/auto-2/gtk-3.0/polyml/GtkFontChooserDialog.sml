structure GtkFontChooserDialog :>
  GTK_FONT_CHOOSER_DIALOG
    where type 'a class_t = 'a GtkFontChooserDialogClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a fontchooserclass_t = 'a GtkFontChooserClass.t
    where type 'a windowclass_t = 'a GtkWindowClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_font_chooser_dialog_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_font_chooser_dialog_new") (FFI.PolyML.String.INPTR &&> GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
    end
    type 'a class_t = 'a GtkFontChooserDialogClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a fontchooserclass_t = 'a GtkFontChooserClass.t
    type 'a windowclass_t = 'a GtkWindowClass.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asFontChooser self = (GObjectObjectClass.C.withPtr ---> GtkFontChooserClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new title window = (FFI.String.withConstPtr &&&> GObjectObjectClass.C.withPtr ---> GtkFontChooserDialogClass.C.fromPtr false) new_ (title & window)
  end
