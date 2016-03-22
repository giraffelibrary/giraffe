structure GtkCheckButton :>
  GTK_CHECK_BUTTON
    where type 'a class = 'a GtkCheckButtonClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_check_button_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_check_button_new" : unit -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val newWithLabel_ = _import "mlton_gtk_check_button_new_with_label" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val newWithMnemonic_ = _import "mlton_gtk_check_button_new_with_mnemonic" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    type 'a class = 'a GtkCheckButtonClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkCheckButtonClass.C.fromPtr false) new_ ()
    fun newWithLabel label = (Utf8.C.withPtr ---> GtkCheckButtonClass.C.fromPtr false) newWithLabel_ label
    fun newWithMnemonic label = (Utf8.C.withPtr ---> GtkCheckButtonClass.C.fromPtr false) newWithMnemonic_ label
  end
