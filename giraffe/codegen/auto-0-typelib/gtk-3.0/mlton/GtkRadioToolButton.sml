structure GtkRadioToolButton :>
  GTK_RADIO_TOOL_BUTTON
    where type 'a class = 'a GtkRadioToolButtonClass.class
    where type 'a actionable_class = 'a GtkActionableClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_radio_tool_button_get_type" : unit -> GObjectType.FFI.val_;
    val newFromWidget_ = _import "gtk_radio_tool_button_new_from_widget" : GtkRadioToolButtonClass.FFI.opt GtkRadioToolButtonClass.FFI.p -> GtkToolItemClass.FFI.non_opt GtkToolItemClass.FFI.p;
    val newWithStockFromWidget_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_radio_tool_button_new_with_stock_from_widget" :
              GtkRadioToolButtonClass.FFI.opt GtkRadioToolButtonClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GtkToolItemClass.FFI.non_opt GtkToolItemClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkRadioToolButtonClass.class
    type 'a actionable_class = 'a GtkActionableClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActionable self = (GObjectObjectClass.FFI.withPtr false ---> GtkActionableClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr false ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun newFromWidget group = (GtkRadioToolButtonClass.FFI.withOptPtr false ---> GtkRadioToolButtonClass.FFI.fromPtr false) newFromWidget_ group before GtkRadioToolButtonClass.FFI.touchOptPtr group
    fun newWithStockFromWidget (group, stockId) = (GtkRadioToolButtonClass.FFI.withOptPtr false &&&> Utf8.FFI.withPtr 0 ---> GtkRadioToolButtonClass.FFI.fromPtr false) newWithStockFromWidget_ (group & stockId) before GtkRadioToolButtonClass.FFI.touchOptPtr group before Utf8.FFI.touchPtr stockId
    local
      open ValueAccessor
    in
      val groupProp =
        {
          name = "group",
          gtype = fn () => C.gtype GtkRadioToolButtonClass.tOpt (),
          get = ignore,
          set = fn x => C.set GtkRadioToolButtonClass.tOpt x,
          init = fn x => C.set GtkRadioToolButtonClass.tOpt x
        }
    end
  end
