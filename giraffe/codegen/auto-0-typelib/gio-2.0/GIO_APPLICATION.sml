signature GIO_APPLICATION =
  sig
    type 'a class
    type 'a cancellable_class
    type 'a application_command_line_class
    type 'a file_class
    type 'a action_group_class
    type application_flags_t
    type t = base class
    val asActionGroup : 'a class -> base action_group_class
    val getType : unit -> GObject.Type.t
    val new :
      string
       -> application_flags_t
       -> base class
    val idIsValid : string -> bool
    val activate : 'a class -> unit
    val getApplicationId : 'a class -> string
    val getFlags : 'a class -> application_flags_t
    val getInactivityTimeout : 'a class -> LargeInt.int
    val getIsRegistered : 'a class -> bool
    val getIsRemote : 'a class -> bool
    val hold : 'a class -> unit
    val open' :
      'a class
       -> base file_class vector
       -> string
       -> unit
    val register :
      'a class
       -> 'b cancellable_class option
       -> bool
    val release : 'a class -> unit
    val run :
      'a class
       -> string list option
       -> LargeInt.int
    val setActionGroup :
      'a class
       -> 'b action_group_class option
       -> unit
    val setApplicationId :
      'a class
       -> string
       -> unit
    val setFlags :
      'a class
       -> application_flags_t
       -> unit
    val setInactivityTimeout :
      'a class
       -> LargeInt.int
       -> unit
    val activateSig : (unit -> unit) -> 'a class Signal.signal
    val commandLineSig : (base application_command_line_class -> LargeInt.int) -> 'a class Signal.signal
    val openSig :
      (base file_class vector
        -> string
        -> unit)
       -> 'a class Signal.signal
    val startupSig : (unit -> unit) -> 'a class Signal.signal
    val actionGroupProp : ('a class, 'b action_group_class option) Property.writeonly
    val applicationIdProp : ('a class, string option, string option) Property.readwrite
    val flagsProp : ('a class, application_flags_t, application_flags_t) Property.readwrite
    val inactivityTimeoutProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val isRegisteredProp : ('a class, bool) Property.readonly
    val isRemoteProp : ('a class, bool) Property.readonly
  end
