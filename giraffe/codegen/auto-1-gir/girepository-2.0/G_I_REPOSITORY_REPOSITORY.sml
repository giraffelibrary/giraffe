signature G_I_REPOSITORY_REPOSITORY =
  sig
    type 'a class_t
    type repositoryloadflags_t
    type typelibrecord_t
    type baseinforecord_t
    type enuminforecord_t
    val getType : unit -> GObject.Type.t
    val dump : string -> bool
    val getDefault : unit -> base class_t
    val prependSearchPath : string -> unit
    val findByErrorDomain :
      'a class_t
       -> GLib.Quark.t
       -> enuminforecord_t
    val findByName :
      'a class_t
       -> string
       -> string
       -> baseinforecord_t
    val getCPrefix :
      'a class_t
       -> string
       -> string
    val getInfo :
      'a class_t
       -> string
       -> LargeInt.int
       -> baseinforecord_t
    val getNInfos :
      'a class_t
       -> string
       -> LargeInt.int
    val getSharedLibrary :
      'a class_t
       -> string
       -> string
    val getTypelibPath :
      'a class_t
       -> string
       -> string
    val getVersion :
      'a class_t
       -> string
       -> string
    val isRegistered :
      'a class_t
       -> string
       -> string option
       -> bool
    val loadTypelib :
      'a class_t
       -> typelibrecord_t
       -> repositoryloadflags_t
       -> string
    val require :
      'a class_t
       -> string
       -> string option
       -> repositoryloadflags_t
       -> typelibrecord_t
    val requirePrivate :
      'a class_t
       -> string
       -> string
       -> string option
       -> repositoryloadflags_t
       -> typelibrecord_t
  end
