signature G_I_REPOSITORY_REPOSITORY =
  sig
    type 'a class_t
    type base_info_record_t
    type typelib_record_t
    type repository_load_flags_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val dump : string -> bool
    val getDefault : unit -> base class_t
    val prependSearchPath : string -> unit
    val findByErrorDomain :
      'a class_t
       -> LargeInt.int
       -> base_info_record_t
    val findByName :
      'a class_t
       -> string
       -> string
       -> base_info_record_t
    val getCPrefix :
      'a class_t
       -> string
       -> string
    val getInfo :
      'a class_t
       -> string
       -> LargeInt.int
       -> base_info_record_t
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
       -> typelib_record_t
       -> repository_load_flags_t
       -> string
    val require :
      'a class_t
       -> string
       -> string option
       -> repository_load_flags_t
       -> typelib_record_t
    val requirePrivate :
      'a class_t
       -> string
       -> string
       -> string option
       -> repository_load_flags_t
       -> typelib_record_t
  end
