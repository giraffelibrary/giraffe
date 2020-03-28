signature GIO_SUBPROCESS_LAUNCHER =
  sig
    type 'a class
    type 'a subprocess_class
    type subprocess_flags_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : subprocess_flags_t -> base class
    val getenv :
      'a class
       -> string
       -> string
    val setCwd :
      'a class
       -> string
       -> unit
    val setEnviron :
      'a class
       -> Utf8CArray.t
       -> unit
    val setFlags :
      'a class
       -> subprocess_flags_t
       -> unit
    val setStderrFilePath :
      'a class
       -> string option
       -> unit
    val setStdinFilePath :
      'a class
       -> string
       -> unit
    val setStdoutFilePath :
      'a class
       -> string option
       -> unit
    val setenv :
      'a class
       -> string
           * string
           * bool
       -> unit
    val spawnv :
      'a class
       -> Utf8CArray.t
       -> base subprocess_class
    val takeFd :
      'a class
       -> LargeInt.int * LargeInt.int
       -> unit
    val takeStderrFd :
      'a class
       -> LargeInt.int
       -> unit
    val takeStdinFd :
      'a class
       -> LargeInt.int
       -> unit
    val takeStdoutFd :
      'a class
       -> LargeInt.int
       -> unit
    val unsetenv :
      'a class
       -> string
       -> unit
    val flagsProp : {new : subprocess_flags_t -> 'a class Property.t}
  end
