structure GModule : G_MODULE =
  struct
    val moduleBuildPath_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_g_module_build_path" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val moduleError_ = _import "g_module_error" : unit -> FFI.String.C.notnull FFI.String.C.out_p;
    val moduleSupported_ = _import "g_module_supported" : unit -> FFI.Bool.C.val_;
    structure ModuleFlags = GModuleModuleFlags
    fun moduleBuildPath directory moduleName = (FFI.String.C.withConstPtr &&&> FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr true) moduleBuildPath_ (directory & moduleName)
    fun moduleError () = (I ---> FFI.String.C.fromPtr false) moduleError_ ()
    fun moduleSupported () = (I ---> FFI.Bool.C.fromVal) moduleSupported_ ()
  end
