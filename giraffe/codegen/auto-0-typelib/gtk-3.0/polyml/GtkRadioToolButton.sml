structure GtkRadioToolButton :>
  GTK_RADIO_TOOL_BUTTON
    where type 'a class_t = 'a GtkRadioToolButtonClass.t
    where type 'a activatableclass_t = 'a GtkActivatableClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_radio_tool_button_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val newFromWidget_ = call (load_sym libgtk "gtk_radio_tool_button_new_from_widget") (GObjectObjectClass.PolyML.OPTPTR --> GObjectObjectClass.PolyML.PTR)
      val newWithStockFromWidget_ = call (load_sym libgtk "gtk_radio_tool_button_new_with_stock_from_widget") (GObjectObjectClass.PolyML.OPTPTR &&> FFI.String.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
    end
    type 'a class_t = 'a GtkRadioToolButtonClass.t
    type 'a activatableclass_t = 'a GtkActivatableClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun newFromWidget group = (GObjectObjectClass.C.withOptPtr ---> GtkRadioToolButtonClass.C.fromPtr false) newFromWidget_ group
    fun newWithStockFromWidget group stockId = (GObjectObjectClass.C.withOptPtr &&&> FFI.String.C.withConstPtr ---> GtkRadioToolButtonClass.C.fromPtr false) newWithStockFromWidget_ (group & stockId)
    local
      open Property
    in
      val groupProp = {set = fn x => set "group" GtkRadioToolButtonClass.tOpt x}
    end
  end