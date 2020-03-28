signature G_MODULE =
  sig
    structure ModuleFlags : G_MODULE_MODULE_FLAGS
    val moduleBuildPath : string option * string -> string
    val moduleError : unit -> string
    val moduleSupported : unit -> bool
  end