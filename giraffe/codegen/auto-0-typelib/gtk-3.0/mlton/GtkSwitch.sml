structure GtkSwitch :>
  GTK_SWITCH
    where type 'a class = 'a GtkSwitchClass.class
    where type 'a actionable_class = 'a GtkActionableClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_switch_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_switch_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getActive_ = _import "gtk_switch_get_active" : GtkSwitchClass.FFI.non_opt GtkSwitchClass.FFI.p -> GBool.FFI.val_;
    val getState_ = _import "gtk_switch_get_state" : GtkSwitchClass.FFI.non_opt GtkSwitchClass.FFI.p -> GBool.FFI.val_;
    val setActive_ = fn x1 & x2 => (_import "gtk_switch_set_active" : GtkSwitchClass.FFI.non_opt GtkSwitchClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setState_ = fn x1 & x2 => (_import "gtk_switch_set_state" : GtkSwitchClass.FFI.non_opt GtkSwitchClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
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
