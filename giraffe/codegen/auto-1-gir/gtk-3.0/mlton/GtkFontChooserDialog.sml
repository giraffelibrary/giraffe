structure GtkFontChooserDialog :>
  GTK_FONT_CHOOSER_DIALOG
    where type 'a class_t = 'a GtkFontChooserDialogClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a fontchooserclass_t = 'a GtkFontChooserClass.t
    where type 'a windowclass_t = 'a GtkWindowClass.t =
  struct
    val getType_ = _import "gtk_font_chooser_dialog_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gtk_font_chooser_dialog_new" :
              cstring
               * unit CPointer.t
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class_t = 'a GtkFontChooserDialogClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a fontchooserclass_t = 'a GtkFontChooserClass.t
    type 'a windowclass_t = 'a GtkWindowClass.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asFontChooser self = (GObjectObjectClass.C.withPtr ---> GtkFontChooserClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new title window = (FFI.String.C.withConstPtr &&&> GObjectObjectClass.C.withPtr ---> GtkFontChooserDialogClass.C.fromPtr false) new_ (title & window)
  end
