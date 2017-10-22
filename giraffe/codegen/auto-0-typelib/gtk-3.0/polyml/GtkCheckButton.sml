structure GtkCheckButton :>
  GTK_CHECK_BUTTON
    where type 'a class = 'a GtkCheckButtonClass.class
    where type 'a actionable_class = 'a GtkActionableClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_check_button_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_check_button_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val newWithLabel_ = call (getSymbol "gtk_check_button_new_with_label") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithMnemonic_ = call (getSymbol "gtk_check_button_new_with_mnemonic") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
    end
    type 'a class = 'a GtkCheckButtonClass.class
    type 'a actionable_class = 'a GtkActionableClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActionable self = (GObjectObjectClass.FFI.withPtr ---> GtkActionableClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkCheckButtonClass.FFI.fromPtr false) new_ ()
    fun newWithLabel label = (Utf8.FFI.withPtr ---> GtkCheckButtonClass.FFI.fromPtr false) newWithLabel_ label
    fun newWithMnemonic label = (Utf8.FFI.withPtr ---> GtkCheckButtonClass.FFI.fromPtr false) newWithMnemonic_ label
  end
