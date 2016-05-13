structure GModule : G_MODULE =
  struct
    local
      open PolyMLFFI
    in
      val moduleBuildPath_ = call (load_sym libgmodule "g_module_build_path") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val moduleError_ = call (load_sym libgmodule "g_module_error") (PolyMLFFI.cVoid --> Utf8.PolyML.cOutPtr)
      val moduleSupported_ = call (load_sym libgmodule "g_module_supported") (PolyMLFFI.cVoid --> FFI.Bool.PolyML.cVal)
    end
    structure ModuleFlags = GModuleModuleFlags
    fun moduleBuildPath directory moduleName = (Utf8.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr true) moduleBuildPath_ (directory & moduleName)
    fun moduleError () = (I ---> Utf8.C.fromPtr false) moduleError_ ()
    fun moduleSupported () = (I ---> FFI.Bool.C.fromVal) moduleSupported_ ()
  end
