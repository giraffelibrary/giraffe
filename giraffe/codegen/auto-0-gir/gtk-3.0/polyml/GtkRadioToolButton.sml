structure GtkRadioToolButton :>
  GTK_RADIO_TOOL_BUTTON
    where type 'a class = 'a GtkRadioToolButtonClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_radio_tool_button_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val newFromWidget_ = call (load_sym libgtk "gtk_radio_tool_button_new_from_widget") (GObjectObjectClass.PolyML.cOptPtr --> GObjectObjectClass.PolyML.cPtr)
      val newWithStockFromWidget_ = call (load_sym libgtk "gtk_radio_tool_button_new_with_stock_from_widget") (GObjectObjectClass.PolyML.cOptPtr &&> Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
    end
    type 'a class = 'a GtkRadioToolButtonClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun newFromWidget group = (GObjectObjectClass.C.withOptPtr ---> GtkRadioToolButtonClass.C.fromPtr false) newFromWidget_ group
    fun newWithStockFromWidget group stockId = (GObjectObjectClass.C.withOptPtr &&&> Utf8.C.withPtr ---> GtkRadioToolButtonClass.C.fromPtr false) newWithStockFromWidget_ (group & stockId)
    local
      open Property
    in
      val groupProp = {set = fn x => set "group" GtkRadioToolButtonClass.tOpt x}
    end
  end
