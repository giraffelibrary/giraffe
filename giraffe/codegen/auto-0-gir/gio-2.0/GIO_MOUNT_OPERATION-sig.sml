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
    val askQuestionSig : (string * string list -> unit) -> 'a class Signal.t
    val replySig : (mount_operation_result_t -> unit) -> 'a class Signal.t
    val showUnmountProgressSig :
      (string
        * LargeInt.int
        * LargeInt.int
        -> unit)
       -> 'a class Signal.t
    val anonymousProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val choiceProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val domainProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val passwordProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val passwordSaveProp :
      {
        get : 'a class -> password_save_t,
        set :
          password_save_t
           -> 'a class
           -> unit,
        new : password_save_t -> 'a class Property.t
      }
    val usernameProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
  end
