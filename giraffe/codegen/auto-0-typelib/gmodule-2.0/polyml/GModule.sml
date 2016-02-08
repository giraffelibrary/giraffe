structure GModule : G_MODULE =
  struct
    local
      open PolyMLFFI
    in
      val moduleBuildPath_ = call (load_sym libgmodule "g_module_build_path") (Utf8.PolyML.INPTR &&> Utf8.PolyML.INPTR --> Utf8.PolyML.RETPTR)
      val moduleError_ = call (load_sym libgmodule "g_module_error") (FFI.PolyML.VOID --> Utf8.PolyML.RETPTR)
      val moduleSupported_ = call (load_sym libgmodule "g_module_supported") (FFI.PolyML.VOID --> FFI.Bool.PolyML.VAL)
    end
    structure ModuleFlags = GModuleModuleFlags
    fun moduleBuildPath directory moduleName = (Utf8.C.withConstPtr &&&> Utf8.C.withConstPtr ---> Utf8.C.fromPtr true) moduleBuildPath_ (directory & moduleName)
    fun moduleError () = (I ---> Utf8.C.fromPtr false) moduleError_ ()
    fun moduleSupported () = (I ---> FFI.Bool.C.fromVal) moduleSupported_ ()
  end
