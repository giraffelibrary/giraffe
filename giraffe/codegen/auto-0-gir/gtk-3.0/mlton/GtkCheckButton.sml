structure GtkCheckButton :>
  GTK_CHECK_BUTTON
    where type 'a class = 'a GtkCheckButtonClass.class
    where type 'a actionable_class = 'a GtkActionableClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_check_button_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_check_button_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val newWithLabel_ = _import "mlton_gtk_check_button_new_with_label" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val newWithMnemonic_ = _import "mlton_gtk_check_button_new_with_mnemonic" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    type 'a class = 'a GtkCheckButtonClass.class
    type 'a actionable_class = 'a GtkActionableClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActionable self = (GObjectObjectClass.FFI.withPtr false ---> GtkActionableClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr false ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkCheckButtonClass.FFI.fromPtr false) new_ ()
    fun newWithLabel label = (Utf8.FFI.withPtr 0 ---> GtkCheckButtonClass.FFI.fromPtr false) newWithLabel_ label
    fun newWithMnemonic label = (Utf8.FFI.withPtr 0 ---> GtkCheckButtonClass.FFI.fromPtr false) newWithMnemonic_ label
  end
