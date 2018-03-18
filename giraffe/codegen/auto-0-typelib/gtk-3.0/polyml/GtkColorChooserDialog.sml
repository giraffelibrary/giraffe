structure GtkColorChooserDialog :>
  GTK_COLOR_CHOOSER_DIALOG
    where type 'a class = 'a GtkColorChooserDialogClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a color_chooser_class = 'a GtkColorChooserClass.class
    where type 'a window_class = 'a GtkWindowClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_color_chooser_dialog_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_color_chooser_dialog_new") (Utf8.PolyML.cInOptPtr &&> GtkWindowClass.PolyML.cOptPtr --> GtkWidgetClass.PolyML.cPtr)
    end
    type 'a class = 'a GtkColorChooserDialogClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a color_chooser_class = 'a GtkColorChooserClass.class
    type 'a window_class = 'a GtkWindowClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asColorChooser self = (GObjectObjectClass.FFI.withPtr ---> GtkColorChooserClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (title, parent) = (Utf8.FFI.withOptPtr &&&> GtkWindowClass.FFI.withOptPtr ---> GtkColorChooserDialogClass.FFI.fromPtr false) new_ (title & parent)
    local
      open Property
    in
      val showEditorProp =
        {
          get = fn x => get "show-editor" boolean x,
          set = fn x => set "show-editor" boolean x,
          new = fn x => new "show-editor" boolean x
        }
    end
  end
