structure GtkRadioToolButton :>
  GTK_RADIO_TOOL_BUTTON
    where type 'a class = 'a GtkRadioToolButtonClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_radio_tool_button_get_type" : unit -> GObjectType.C.val_;
    val newFromWidget_ = _import "gtk_radio_tool_button_new_from_widget" : unit GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newWithStockFromWidget_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_radio_tool_button_new_with_stock_from_widget" :
              unit GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
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
