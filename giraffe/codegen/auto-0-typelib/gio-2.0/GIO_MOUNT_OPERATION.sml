signature GIO_MOUNT_OPERATION =
  sig
    type 'a class
    type ask_password_flags_t
    type mount_operation_result_t
    type password_save_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val getAnonymous : 'a class -> bool
    val getChoice : 'a class -> LargeInt.int
    val getDomain : 'a class -> string
    val getPassword : 'a class -> string
    val getPasswordSave : 'a class -> password_save_t
    val getUsername : 'a class -> string
    val reply :
      'a class
       -> mount_operation_result_t
       -> unit
    val setAnonymous :
      'a class
       -> bool
       -> unit
    val setChoice :
      'a class
       -> LargeInt.int
       -> unit
    val setDomain :
      'a class
       -> string
       -> unit
    val setPassword :
      'a class
       -> string
       -> unit
    val setPasswordSave :
      'a class
       -> password_save_t
       -> unit
    val setUsername :
      'a class
       -> string
       -> unit
    val abortedSig : (unit -> unit) -> 'a class Signal.signal
    val askPasswordSig :
      (string
        -> string
        -> string
        -> ask_password_flags_t
        -> unit)
       -> 'a class Signal.signal
    val replySig : (mount_operation_result_t -> unit) -> 'a class Signal.signal
    val anonymousProp : ('a class, bool, bool) Property.readwrite
    val choiceProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val domainProp : ('a class, string option, string option) Property.readwrite
    val passwordProp : ('a class, string option, string option) Property.readwrite
    val passwordSaveProp : ('a class, password_save_t, password_save_t) Property.readwrite
    val usernameProp : ('a class, string option, string option) Property.readwrite
  end
