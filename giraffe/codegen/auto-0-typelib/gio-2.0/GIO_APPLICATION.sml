signature GIO_APPLICATION =
  sig
    type 'a class_t
    type 'a cancellable_class_t
    type 'a application_command_line_class_t
    type 'a action_group_class_t
    type application_flags_t
    type t = base class_t
    val asActionGroup : 'a class_t -> base action_group_class_t
    val getType : unit -> GObject.Type.t
    val new :
      string
       -> application_flags_t
       -> base class_t
    val idIsValid : string -> bool
    val activate : 'a class_t -> unit
    val getApplicationId : 'a class_t -> string
    val getFlags : 'a class_t -> application_flags_t
    val getInactivityTimeout : 'a class_t -> LargeInt.int
    val getIsRegistered : 'a class_t -> bool
    val getIsRemote : 'a class_t -> bool
    val hold : 'a class_t -> unit
    val register :
      'a class_t
       -> 'b cancellable_class_t option
       -> bool
    val release : 'a class_t -> unit
    val setActionGroup :
      'a class_t
       -> 'b action_group_class_t option
       -> unit
    val setApplicationId :
      'a class_t
       -> string
       -> unit
    val setFlags :
      'a class_t
       -> application_flags_t
       -> unit
    val setInactivityTimeout :
      'a class_t
       -> LargeInt.int
       -> unit
    val activateSig : (unit -> unit) -> 'a class_t Signal.signal
    val commandLineSig : (base application_command_line_class_t -> LargeInt.int) -> 'a class_t Signal.signal
    val startupSig : (unit -> unit) -> 'a class_t Signal.signal
    val actionGroupProp : ('a class_t, 'b action_group_class_t option) Property.writeonly
    val applicationIdProp : ('a class_t, string option, string option) Property.readwrite
    val flagsProp : ('a class_t, application_flags_t, application_flags_t) Property.readwrite
    val inactivityTimeoutProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val isRegisteredProp : ('a class_t, bool) Property.readonly
    val isRemoteProp : ('a class_t, bool) Property.readonly
  end
