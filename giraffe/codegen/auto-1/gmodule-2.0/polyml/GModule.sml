structure GModule : G_MODULE =
  struct
    local
      open PolyMLFFI
    in
      val moduleBuildPath_ = call (load_sym libgmodule "g_module_build_path") (FFI.PolyML.String.INPTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val moduleError_ = call (load_sym libgmodule "g_module_error") (FFI.PolyML.VOID --> FFI.PolyML.String.RETPTR)
      val moduleSupported_ = call (load_sym libgmodule "g_module_supported") (FFI.PolyML.VOID --> FFI.PolyML.Bool.VAL)
    end
    structure ModuleFlags = GModuleModuleFlags
    fun moduleBuildPath directory moduleName = (FFI.String.withConstPtr &&&> FFI.String.withConstPtr ---> FFI.String.fromPtr true) moduleBuildPath_ (directory & moduleName)
    fun moduleError () = (I ---> FFI.String.fromPtr false) moduleError_ ()
    fun moduleSupported () = (I ---> FFI.Bool.fromVal) moduleSupported_ ()
  end
