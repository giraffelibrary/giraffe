structure GioIOModule :>
  GIO_I_O_MODULE
    where type 'a class = 'a GioIOModuleClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_io_module_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_io_module_new") (Utf8.PolyML.cInPtr --> GioIOModuleClass.PolyML.cPtr)
      val load_ = call (load_sym libgio "g_io_module_load") (GioIOModuleClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val unload_ = call (load_sym libgio "g_io_module_unload") (GioIOModuleClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GioIOModuleClass.class
    type t = base class
    fun asTypePlugin self = (GObjectObjectClass.C.withPtr ---> GObjectTypePluginClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new filename = (Utf8.C.withPtr ---> GioIOModuleClass.C.fromPtr true) new_ filename
    fun load self = (GioIOModuleClass.C.withPtr ---> I) load_ self
    fun unload self = (GioIOModuleClass.C.withPtr ---> I) unload_ self
  end
