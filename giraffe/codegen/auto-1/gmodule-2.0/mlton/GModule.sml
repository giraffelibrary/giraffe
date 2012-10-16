structure GModule : G_MODULE =
  struct
    val moduleBuildPath_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_g_module_build_path" :
              cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               -> FFI.String.notnull FFI.String.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val moduleError_ = _import "g_module_error" : unit -> FFI.String.notnull FFI.String.out_p;
    val moduleSupported_ = _import "g_module_supported" : unit -> FFI.Bool.val_;
    structure ModuleFlags = GModuleModuleFlags
    fun moduleBuildPath directory moduleName = (FFI.String.withConstPtr &&&> FFI.String.withConstPtr ---> FFI.String.fromPtr true) moduleBuildPath_ (directory & moduleName)
    fun moduleError () = (I ---> FFI.String.fromPtr false) moduleError_ ()
    fun moduleSupported () = (I ---> FFI.Bool.fromVal) moduleSupported_ ()
  end
