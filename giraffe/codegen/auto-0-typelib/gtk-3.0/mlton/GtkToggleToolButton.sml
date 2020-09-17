structure GtkToggleToolButton :>
  GTK_TOGGLE_TOOL_BUTTON
    where type 'a class = 'a GtkToggleToolButtonClass.class
    where type 'a actionable_class = 'a GtkActionableClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_toggle_tool_button_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_toggle_tool_button_new" : unit -> GtkToolItemClass.FFI.non_opt GtkToolItemClass.FFI.p;
    val newFromStock_ = _import "mlton_gtk_toggle_tool_button_new_from_stock" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GtkToolItemClass.FFI.non_opt GtkToolItemClass.FFI.p;
    val getActive_ = _import "gtk_toggle_tool_button_get_active" : GtkToggleToolButtonClass.FFI.non_opt GtkToggleToolButtonClass.FFI.p -> GBool.FFI.val_;
    val setActive_ = fn x1 & x2 => (_import "gtk_toggle_tool_button_set_active" : GtkToggleToolButtonClass.FFI.non_opt GtkToggleToolButtonClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkToggleToolButtonClass.class
    type 'a actionable_class = 'a GtkActionableClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActionable self = (GObjectObjectClass.FFI.withPtr false ---> GtkActionableClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr false ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkToggleToolButtonClass.FFI.fromPtr false) new_ ()
    fun newFromStock stockId = (Utf8.FFI.withPtr 0 ---> GtkToggleToolButtonClass.FFI.fromPtr false) newFromStock_ stockId before Utf8.FFI.touchPtr stockId
    fun getActive self = (GtkToggleToolButtonClass.FFI.withPtr false ---> GBool.FFI.fromVal) getActive_ self
    fun setActive self isActive = (GtkToggleToolButtonClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setActive_ (self & isActive)
    local
      open ClosureMarshal Signal
    in
      fun toggledSig f = signal "toggled" (void ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val activeProp =
        {
          name = "active",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
