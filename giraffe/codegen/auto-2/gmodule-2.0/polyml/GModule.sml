structure GModule : G_MODULE =
  struct
    local
      open PolyMLFFI
    in
      val moduleBuildPath_ = call (load_sym libgmodule "g_module_build_path") (FFI.String.PolyML.INPTR &&> FFI.String.PolyML.INPTR --> FFI.String.PolyML.RETPTR)
      val moduleError_ = call (load_sym libgmodule "g_module_error") (FFI.PolyML.VOID --> FFI.String.PolyML.RETPTR)
      val moduleSupported_ = call (load_sym libgmodule "g_module_supported") (FFI.PolyML.VOID --> FFI.Bool.PolyML.VAL)
    end
    structure ModuleFlags = GModuleModuleFlags
    fun moduleBuildPath directory moduleName = (FFI.String.C.withConstPtr &&&> FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr true) moduleBuildPath_ (directory & moduleName)
    fun moduleError () = (I ---> FFI.String.C.fromPtr false) moduleError_ ()
    fun moduleSupported () = (I ---> FFI.Bool.C.fromVal) moduleSupported_ ()
  end
