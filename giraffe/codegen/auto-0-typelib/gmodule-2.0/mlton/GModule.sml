structure GModule : G_MODULE =
  struct
    val moduleBuildPath_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_g_module_build_path" :
              Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val moduleError_ = _import "g_module_error" : unit -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val moduleSupported_ = _import "g_module_supported" : unit -> GBool.FFI.val_;
    structure ModuleFlags = GModuleModuleFlags
    fun moduleBuildPath (directory, moduleName) = (Utf8.FFI.withOptPtr 0 &&&> Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr ~1) moduleBuildPath_ (directory & moduleName)
    fun moduleError () = (I ---> Utf8.FFI.fromPtr 0) moduleError_ ()
    fun moduleSupported () = (I ---> GBool.FFI.fromVal) moduleSupported_ ()
  end
