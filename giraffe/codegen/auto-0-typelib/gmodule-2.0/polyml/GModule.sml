structure GModule : G_MODULE =
  struct
    local
      open PolyMLFFI
    in
      val moduleBuildPath_ = call (getSymbol "g_module_build_path") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val moduleError_ = call (getSymbol "g_module_error") (cVoid --> Utf8.PolyML.cOutPtr)
      val moduleSupported_ = call (getSymbol "g_module_supported") (cVoid --> GBool.PolyML.cVal)
    end
    structure ModuleFlags = GModuleModuleFlags
    fun moduleBuildPath (directory, moduleName) = (Utf8.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) moduleBuildPath_ (directory & moduleName)
    fun moduleError () = (I ---> Utf8.FFI.fromPtr 0) moduleError_ ()
    fun moduleSupported () = (I ---> GBool.FFI.fromVal) moduleSupported_ ()
  end
