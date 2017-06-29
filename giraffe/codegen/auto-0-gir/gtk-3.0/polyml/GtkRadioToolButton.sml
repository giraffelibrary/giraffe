structure GtkRadioToolButton :>
  GTK_RADIO_TOOL_BUTTON
    where type 'a class = 'a GtkRadioToolButtonClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_radio_tool_button_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val newFromWidget_ = call (getSymbol "gtk_radio_tool_button_new_from_widget") (GtkRadioToolButtonClass.PolyML.cOptPtr --> GtkToolItemClass.PolyML.cPtr)
      val newWithStockFromWidget_ = call (getSymbol "gtk_radio_tool_button_new_with_stock_from_widget") (GtkRadioToolButtonClass.PolyML.cOptPtr &&> Utf8.PolyML.cInPtr --> GtkToolItemClass.PolyML.cPtr)
    end
    type 'a class = 'a GtkRadioToolButtonClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun newFromWidget group = (GtkRadioToolButtonClass.FFI.withOptPtr ---> GtkRadioToolButtonClass.FFI.fromPtr false) newFromWidget_ group
    fun newWithStockFromWidget group stockId = (GtkRadioToolButtonClass.FFI.withOptPtr &&&> Utf8.FFI.withPtr ---> GtkRadioToolButtonClass.FFI.fromPtr false) newWithStockFromWidget_ (group & stockId)
    local
      open Property
    in
      val groupProp = {set = fn x => set "group" GtkRadioToolButtonClass.tOpt x}
    end
  end
