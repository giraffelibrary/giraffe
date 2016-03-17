signature GTK_U_I_MANAGER =
  sig
    type 'a class
    type 'a buildable_class
    type u_i_manager_item_type_t
    type 'a accel_group_class
    type 'a action_group_class
    type 'a widget_class
    type 'a action_class
    type t = base class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val addUi :
      'a class
       -> LargeInt.int
       -> string
       -> string
       -> string option
       -> u_i_manager_item_type_t
       -> bool
       -> unit
    val addUiFromFile :
      'a class
       -> string
       -> LargeInt.int
    val addUiFromString :
      'a class
       -> string
       -> LargeInt.int
       -> LargeInt.int
    val ensureUpdate : 'a class -> unit
    val getAccelGroup : 'a class -> base accel_group_class
    val getAction :
      'a class
       -> string
       -> base action_class
    val getAddTearoffs : 'a class -> bool
    val getUi : 'a class -> string
    val getWidget :
      'a class
       -> string
       -> base widget_class
    val insertActionGroup :
      'a class
       -> 'b action_group_class
       -> LargeInt.int
       -> unit
    val newMergeId : 'a class -> LargeInt.int
    val removeActionGroup :
      'a class
       -> 'b action_group_class
       -> unit
    val removeUi :
      'a class
       -> LargeInt.int
       -> unit
    val setAddTearoffs :
      'a class
       -> bool
       -> unit
    val actionsChangedSig : (unit -> unit) -> 'a class Signal.signal
    val addWidgetSig : (base widget_class -> unit) -> 'a class Signal.signal
    val connectProxySig :
      (base action_class
        -> base widget_class
        -> unit)
       -> 'a class Signal.signal
    val disconnectProxySig :
      (base action_class
        -> base widget_class
        -> unit)
       -> 'a class Signal.signal
    val postActivateSig : (base action_class -> unit) -> 'a class Signal.signal
    val preActivateSig : (base action_class -> unit) -> 'a class Signal.signal
    val addTearoffsProp : ('a class, bool, bool) Property.readwrite
    val uiProp : ('a class, string option) Property.readonly
  end
