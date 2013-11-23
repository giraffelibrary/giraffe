structure GtkColorSelectionDialog :>
  GTK_COLOR_SELECTION_DIALOG
    where type 'a class_t = 'a GtkColorSelectionDialogClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a widgetclass_t = 'a GtkWidgetClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_color_selection_dialog_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_color_selection_dialog_new") (FFI.String.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val getColorSelection_ = call (load_sym libgtk "gtk_color_selection_dialog_get_color_selection") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
    end
    type 'a class_t = 'a GtkColorSelectionDialogClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a widgetclass_t = 'a GtkWidgetClass.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new title = (FFI.String.C.withConstPtr ---> GtkColorSelectionDialogClass.C.fromPtr false) new_ title
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
