signature GIO_APPLICATION =
  sig
    type 'a class_t
    type 'a cancellableclass_t
    type 'a applicationcommandlineclass_t
    type 'a actiongroupclass_t
    type applicationflags_t
    type t = base class_t
    val asActionGroup : 'a class_t -> base actiongroupclass_t
    val getType : unit -> GObject.Type.t
    val new :
      string
       -> applicationflags_t
       -> base class_t
    val idIsValid : string -> bool
    val activate : 'a class_t -> unit
    val getApplicationId : 'a class_t -> string
    val getFlags : 'a class_t -> applicationflags_t
    val getInactivityTimeout : 'a class_t -> LargeInt.int
    val getIsRegistered : 'a class_t -> bool
    val getIsRemote : 'a class_t -> bool
    val hold : 'a class_t -> unit
    val register :
      'a class_t
       -> 'b cancellableclass_t option
       -> bool
    val release : 'a class_t -> unit
    val setActionGroup :
      'a class_t
       -> 'b actiongroupclass_t option
       -> unit
    val setApplicationId :
      'a class_t
       -> string
       -> unit
    val setFlags :
      'a class_t
       -> applicationflags_t
       -> unit
    val setInactivityTimeout :
      'a class_t
       -> LargeInt.int
       -> unit
    val activateSig : (unit -> unit) -> 'a class_t Signal.signal
    val commandLineSig : (base applicationcommandlineclass_t -> LargeInt.int) -> 'a class_t Signal.signal
    val startupSig : (unit -> unit) -> 'a class_t Signal.signal
    val actionGroupProp : ('a class_t, 'b actiongroupclass_t option) Property.writeonly
    val applicationIdProp : ('a class_t, string option, string option) Property.readwrite
    val flagsProp : ('a class_t, applicationflags_t, applicationflags_t) Property.readwrite
    val inactivityTimeoutProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val isRegisteredProp : ('a class_t, bool) Property.readonly
    val isRemoteProp : ('a class_t, bool) Property.readonly
  end
