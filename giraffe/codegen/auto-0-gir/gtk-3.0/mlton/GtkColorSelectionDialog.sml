structure GtkColorSelectionDialog :>
  GTK_COLOR_SELECTION_DIALOG
    where type 'a class_t = 'a GtkColorSelectionDialogClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a widget_class_t = 'a GtkWidgetClass.t =
  struct
    val getType_ = _import "gtk_color_selection_dialog_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "mlton_gtk_color_selection_dialog_new" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getColorSelection_ = _import "gtk_color_selection_dialog_get_color_selection" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    type 'a class_t = 'a GtkColorSelectionDialogClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type 'a widget_class_t = 'a GtkWidgetClass.t
    type t = base class_t
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
