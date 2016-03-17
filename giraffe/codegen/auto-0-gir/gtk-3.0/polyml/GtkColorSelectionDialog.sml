structure GtkColorSelectionDialog :>
  GTK_COLOR_SELECTION_DIALOG
    where type 'a class = 'a GtkColorSelectionDialogClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_color_selection_dialog_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_color_selection_dialog_new") (Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
      val getColorSelection_ = call (load_sym libgtk "gtk_color_selection_dialog_get_color_selection") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
    end
    type 'a class = 'a GtkColorSelectionDialogClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new title = (Utf8.C.withPtr ---> GtkColorSelectionDialogClass.C.fromPtr false) new_ title
    fun getColorSelection self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getColorSelection_ self
    local
      open Property
    in
      val cancelButtonProp = {get = fn x => get "cancel-button" GtkWidgetClass.tOpt x}
      val colorSelectionProp = {get = fn x => get "color-selection" GtkWidgetClass.tOpt x}
      val helpButtonProp = {get = fn x => get "help-button" GtkWidgetClass.tOpt x}
      val okButtonProp = {get = fn x => get "ok-button" GtkWidgetClass.tOpt x}
    end
  end
