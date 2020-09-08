structure GtkToggleToolButton :>
  GTK_TOGGLE_TOOL_BUTTON
    where type 'a class = 'a GtkToggleToolButtonClass.class
    where type 'a actionable_class = 'a GtkActionableClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_toggle_tool_button_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_toggle_tool_button_new") (cVoid --> GtkToolItemClass.PolyML.cPtr)
      val newFromStock_ = call (getSymbol "gtk_toggle_tool_button_new_from_stock") (Utf8.PolyML.cInPtr --> GtkToolItemClass.PolyML.cPtr)
      val getActive_ = call (getSymbol "gtk_toggle_tool_button_get_active") (GtkToggleToolButtonClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setActive_ = call (getSymbol "gtk_toggle_tool_button_set_active") (GtkToggleToolButtonClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
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
    fun newFromStock stockId = (Utf8.FFI.withPtr 0 ---> GtkToggleToolButtonClass.FFI.fromPtr false) newFromStock_ stockId
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
