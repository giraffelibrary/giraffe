signature GTK_U_I_MANAGER =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type u_i_manager_item_type_t
    type 'a accel_group_class_t
    type 'a action_group_class_t
    type 'a widget_class_t
    type 'a action_class_t
    type t = base class_t
    val asBuildable : 'a class_t -> base buildable_class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val addUi :
      'a class_t
       -> LargeInt.int
       -> string
       -> string
       -> string option
       -> u_i_manager_item_type_t
       -> bool
       -> unit
    val addUiFromFile :
      'a class_t
       -> string
       -> LargeInt.int
    val addUiFromString :
      'a class_t
       -> string
       -> LargeInt.int
       -> LargeInt.int
    val ensureUpdate : 'a class_t -> unit
    val getAccelGroup : 'a class_t -> base accel_group_class_t
    val getAction :
      'a class_t
       -> string
       -> base action_class_t
    val getAddTearoffs : 'a class_t -> bool
    val getUi : 'a class_t -> string
    val getWidget :
      'a class_t
       -> string
       -> base widget_class_t
    val insertActionGroup :
      'a class_t
       -> 'b action_group_class_t
       -> LargeInt.int
       -> unit
    val newMergeId : 'a class_t -> LargeInt.int
    val removeActionGroup :
      'a class_t
       -> 'b action_group_class_t
       -> unit
    val removeUi :
      'a class_t
       -> LargeInt.int
       -> unit
    val setAddTearoffs :
      'a class_t
       -> bool
       -> unit
    val actionsChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val addWidgetSig : (base widget_class_t -> unit) -> 'a class_t Signal.signal
    val connectProxySig :
      (base action_class_t
        -> base widget_class_t
        -> unit)
       -> 'a class_t Signal.signal
    val disconnectProxySig :
      (base action_class_t
        -> base widget_class_t
        -> unit)
       -> 'a class_t Signal.signal
    val postActivateSig : (base action_class_t -> unit) -> 'a class_t Signal.signal
    val preActivateSig : (base action_class_t -> unit) -> 'a class_t Signal.signal
    val addTearoffsProp : ('a class_t, bool, bool) Property.readwrite
    val uiProp : ('a class_t, string option) Property.readonly
  end
