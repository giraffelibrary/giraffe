structure GtkSwitch :>
  GTK_SWITCH
    where type 'a class = 'a GtkSwitchClass.class
    where type 'a actionable_class = 'a GtkActionableClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_switch_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_switch_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val getActive_ = call (getSymbol "gtk_switch_get_active") (GtkSwitchClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getState_ = call (getSymbol "gtk_switch_get_state") (GtkSwitchClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setActive_ = call (getSymbol "gtk_switch_set_active") (GtkSwitchClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setState_ = call (getSymbol "gtk_switch_set_state") (GtkSwitchClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkSwitchClass.class
    type 'a actionable_class = 'a GtkActionableClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActionable self = (GObjectObjectClass.FFI.withPtr false ---> GtkActionableClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr false ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkSwitchClass.FFI.fromPtr false) new_ ()
    fun getActive self = (GtkSwitchClass.FFI.withPtr false ---> GBool.FFI.fromVal) getActive_ self
    fun getState self = (GtkSwitchClass.FFI.withPtr false ---> GBool.FFI.fromVal) getState_ self
    fun setActive self isActive = (GtkSwitchClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setActive_ (self & isActive)
    fun setState self state = (GtkSwitchClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setState_ (self & state)
    local
      open ClosureMarshal Signal
    in
      fun activateSig f = signal "activate" (void ---> ret_void) f
      fun stateSetSig f = signal "state-set" (get 0w1 boolean ---> ret boolean) f
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
      val stateProp =
        {
          name = "state",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
