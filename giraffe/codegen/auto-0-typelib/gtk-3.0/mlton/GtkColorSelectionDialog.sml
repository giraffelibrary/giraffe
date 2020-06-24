structure GtkColorSelectionDialog :>
  GTK_COLOR_SELECTION_DIALOG
    where type 'a class = 'a GtkColorSelectionDialogClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_color_selection_dialog_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "mlton_gtk_color_selection_dialog_new" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getColorSelection_ = _import "gtk_color_selection_dialog_get_color_selection" : GtkColorSelectionDialogClass.FFI.non_opt GtkColorSelectionDialogClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    type 'a class = 'a GtkColorSelectionDialogClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new title = (Utf8.FFI.withPtr ---> GtkColorSelectionDialogClass.FFI.fromPtr false) new_ title
    fun getColorSelection self = (GtkColorSelectionDialogClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getColorSelection_ self
    local
      open Property
    in
      val cancelButtonProp = {get = fn x => get "cancel-button" GtkWidgetClass.tOpt x}
      val colorSelectionProp = {get = fn x => get "color-selection" GtkWidgetClass.tOpt x}
      val helpButtonProp = {get = fn x => get "help-button" GtkWidgetClass.tOpt x}
      val okButtonProp = {get = fn x => get "ok-button" GtkWidgetClass.tOpt x}
    end
  end
