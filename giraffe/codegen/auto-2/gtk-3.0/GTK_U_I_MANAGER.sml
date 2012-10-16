signature GTK_U_I_MANAGER =
  sig
    type 'a class_t
    type 'a actionclass_t
    type 'a widgetclass_t
    type 'a actiongroupclass_t
    type 'a accelgroupclass_t
    type uimanageritemtype_t
    type 'a buildableclass_t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val addUi :
      'a class_t
       -> LargeInt.int
       -> string
       -> string
       -> string option
       -> uimanageritemtype_t
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
    val getAccelGroup : 'a class_t -> base accelgroupclass_t
    val getAction :
      'a class_t
       -> string
       -> base actionclass_t
    val getAddTearoffs : 'a class_t -> bool
    val getUi : 'a class_t -> string
    val getWidget :
      'a class_t
       -> string
       -> base widgetclass_t
    val insertActionGroup :
      'a class_t
       -> 'b actiongroupclass_t
       -> LargeInt.int
       -> unit
    val newMergeId : 'a class_t -> LargeInt.int
    val removeActionGroup :
      'a class_t
       -> 'b actiongroupclass_t
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
    val addWidgetSig : (base widgetclass_t -> unit) -> 'a class_t Signal.signal
    val connectProxySig :
      (base actionclass_t
        -> base widgetclass_t
        -> unit)
       -> 'a class_t Signal.signal
    val disconnectProxySig :
      (base actionclass_t
        -> base widgetclass_t
        -> unit)
       -> 'a class_t Signal.signal
    val postActivateSig : (base actionclass_t -> unit) -> 'a class_t Signal.signal
    val preActivateSig : (base actionclass_t -> unit) -> 'a class_t Signal.signal
    val addTearoffsProp : ('a class_t, bool, bool) Property.readwrite
    val uiProp : ('a class_t, string option) Property.readonly
  end
