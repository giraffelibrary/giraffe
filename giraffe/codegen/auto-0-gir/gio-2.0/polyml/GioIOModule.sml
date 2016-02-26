structure GioIOModule :>
  GIO_I_O_MODULE
    where type 'a class_t = 'a GioIOModuleClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_io_module_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_io_module_new") (Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
      val load_ = call (load_sym libgio "g_io_module_load") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val unload_ = call (load_sym libgio "g_io_module_unload") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GioIOModuleClass.t
    type t = base class_t
    fun asTypePlugin self = (GObjectObjectClass.C.withPtr ---> GObjectTypePluginClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new filename = (Utf8.C.withPtr ---> GioIOModuleClass.C.fromPtr true) new_ filename
    fun load self = (GObjectObjectClass.C.withPtr ---> I) load_ self
    fun unload self = (GObjectObjectClass.C.withPtr ---> I) unload_ self
  end
