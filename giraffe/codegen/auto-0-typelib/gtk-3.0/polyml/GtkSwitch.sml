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
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActionable self = (GObjectObjectClass.FFI.withPtr ---> GtkActionableClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkSwitchClass.FFI.fromPtr false) new_ ()
    fun getActive self = (GtkSwitchClass.FFI.withPtr ---> GBool.FFI.fromVal) getActive_ self
    fun getState self = (GtkSwitchClass.FFI.withPtr ---> GBool.FFI.fromVal) getState_ self
    fun setActive self isActive = (GtkSwitchClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setActive_ (self & isActive)
    fun setState self state = (GtkSwitchClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setState_ (self & state)
    local
      open ClosureMarshal Signal
    in
      fun activateSig f = signal "activate" (void ---> ret_void) f
      fun stateSetSig f = signal "state-set" (get 0w1 boolean ---> ret boolean) f
    end
    local
      open Property
    in
      val activeProp =
        {
          get = fn x => get "active" boolean x,
          set = fn x => set "active" boolean x,
          new = fn x => new "active" boolean x
        }
      val stateProp =
        {
          get = fn x => get "state" boolean x,
          set = fn x => set "state" boolean x,
          new = fn x => new "state" boolean x
        }
    end
  end
