structure GioIOModule :>
  GIO_I_O_MODULE
    where type 'a class = 'a GioIOModuleClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_io_module_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_io_module_new") (Utf8.PolyML.cInPtr --> GioIOModuleClass.PolyML.cPtr)
      val query_ = call (getSymbol "g_io_module_query") (cVoid --> Utf8CPtrArray.PolyML.cOutPtr)
      val load_ = call (getSymbol "g_io_module_load") (GioIOModuleClass.PolyML.cPtr --> cVoid)
      val unload_ = call (getSymbol "g_io_module_unload") (GioIOModuleClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GioIOModuleClass.class
    type t = base class
    fun asTypePlugin self = (GObjectObjectClass.FFI.withPtr false ---> GObjectTypePluginClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new filename = (Utf8.FFI.withPtr 0 ---> GioIOModuleClass.FFI.fromPtr true) new_ filename
    fun query () = (I ---> Utf8CPtrArray.FFI.fromPtr ~1) query_ ()
    fun load self = (GioIOModuleClass.FFI.withPtr false ---> I) load_ self
    fun unload self = (GioIOModuleClass.FFI.withPtr false ---> I) unload_ self
  end
