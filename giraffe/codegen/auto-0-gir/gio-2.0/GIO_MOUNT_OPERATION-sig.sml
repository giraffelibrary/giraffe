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
    val abortedSig : (unit -> unit) -> 'a class Signal.t
    val askPasswordSig :
      (string
        * string
        * string
        * ask_password_flags_t
        -> unit)
       -> 'a class Signal.t
    val askQuestionSig : (string * Utf8CPtrArray.t -> unit) -> 'a class Signal.t
    val replySig : (mount_operation_result_t -> unit) -> 'a class Signal.t
    val showUnmountProgressSig :
      (string
        * LargeInt.int
        * LargeInt.int
        -> unit)
       -> 'a class Signal.t
    val anonymousProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val choiceProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val domainProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val passwordProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val passwordSaveProp : ('a class, unit -> password_save_t, password_save_t -> unit, password_save_t -> unit) Property.t
    val usernameProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
  end
