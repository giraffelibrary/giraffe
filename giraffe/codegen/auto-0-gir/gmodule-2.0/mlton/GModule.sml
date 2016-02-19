structure GModule : G_MODULE =
  struct
    val moduleBuildPath_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_g_module_build_path" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> Utf8.C.notnull Utf8.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val moduleError_ = _import "g_module_error" : unit -> Utf8.C.notnull Utf8.C.out_p;
    val moduleSupported_ = _import "g_module_supported" : unit -> FFI.Bool.C.val_;
    structure ModuleFlags = GModuleModuleFlags
    fun moduleBuildPath directory moduleName = (Utf8.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr true) moduleBuildPath_ (directory & moduleName)
    fun moduleError () = (I ---> Utf8.C.fromPtr false) moduleError_ ()
    fun moduleSupported () = (I ---> FFI.Bool.C.fromVal) moduleSupported_ ()
  end
