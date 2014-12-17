signature GIO_MOUNT_OPERATION =
  sig
    type 'a class_t
    type askpasswordflags_t
    type mountoperationresult_t
    type passwordsave_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val getAnonymous : 'a class_t -> bool
    val getChoice : 'a class_t -> LargeInt.int
    val getDomain : 'a class_t -> string
    val getPassword : 'a class_t -> string
    val getPasswordSave : 'a class_t -> passwordsave_t
    val getUsername : 'a class_t -> string
    val reply :
      'a class_t
       -> mountoperationresult_t
       -> unit
    val setAnonymous :
      'a class_t
       -> bool
       -> unit
    val setChoice :
      'a class_t
       -> LargeInt.int
       -> unit
    val setDomain :
      'a class_t
       -> string
       -> unit
    val setPassword :
      'a class_t
       -> string
       -> unit
    val setPasswordSave :
      'a class_t
       -> passwordsave_t
       -> unit
    val setUsername :
      'a class_t
       -> string
       -> unit
    val abortedSig : (unit -> unit) -> 'a class_t Signal.signal
    val askPasswordSig :
      (string
        -> string
        -> string
        -> askpasswordflags_t
        -> unit)
       -> 'a class_t Signal.signal
    val replySig : (mountoperationresult_t -> unit) -> 'a class_t Signal.signal
    val anonymousProp : ('a class_t, bool, bool) Property.readwrite
    val choiceProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val domainProp : ('a class_t, string option, string option) Property.readwrite
    val passwordProp : ('a class_t, string option, string option) Property.readwrite
    val passwordSaveProp : ('a class_t, passwordsave_t, passwordsave_t) Property.readwrite
    val usernameProp : ('a class_t, string option, string option) Property.readwrite
  end
