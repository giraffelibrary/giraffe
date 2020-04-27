signature G_I_REPOSITORY_REPOSITORY =
  sig
    type 'a class
    type base_info_t
    type typelib_t
    type repository_load_flags_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val dump : string -> unit
    val getDefault : unit -> base class
    val prependLibraryPath : string -> unit
    val prependSearchPath : string -> unit
    val findByErrorDomain :
      'a class
       -> LargeInt.int
       -> base_info_t
    val findByGtype :
      'a class
       -> GObject.Type.t
       -> base_info_t
    val findByName :
      'a class
       -> string * string
       -> base_info_t
    val getCPrefix :
      'a class
       -> string
       -> string
    val getDependencies :
      'a class
       -> string
       -> Utf8CPtrArray.t
    val getImmediateDependencies :
      'a class
       -> string
       -> Utf8CPtrArray.t
    val getInfo :
      'a class
       -> string * LargeInt.int
       -> base_info_t
    val getLoadedNamespaces : 'a class -> Utf8CPtrArray.t
    val getNInfos :
      'a class
       -> string
       -> LargeInt.int
    val getSharedLibrary :
      'a class
       -> string
       -> string
    val getTypelibPath :
      'a class
       -> string
       -> string
    val getVersion :
      'a class
       -> string
       -> string
    val isRegistered :
      'a class
       -> string * string option
       -> bool
    val loadTypelib :
      'a class
       -> typelib_t * repository_load_flags_t
       -> string
    val require :
      'a class
       -> string
           * string option
           * repository_load_flags_t
       -> typelib_t
    val requirePrivate :
      'a class
       -> string
           * string
           * string option
           * repository_load_flags_t
       -> typelib_t
  end
