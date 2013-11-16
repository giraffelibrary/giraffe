structure GioIOModule :>
  GIO_I_O_MODULE
    where type 'a class_t = 'a GioIOModuleClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_io_module_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgio "g_io_module_new") (FFI.String.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val load_ = call (load_sym libgio "g_io_module_load") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val unload_ = call (load_sym libgio "g_io_module_unload") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GioIOModuleClass.t
    fun asTypePlugin self = (GObjectObjectClass.C.withPtr ---> GObjectTypePluginClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new filename = (FFI.String.C.withConstPtr ---> GioIOModuleClass.C.fromPtr true) new_ filename
    fun load self = (GObjectObjectClass.C.withPtr ---> I) load_ self
    fun unload self = (GObjectObjectClass.C.withPtr ---> I) unload_ self
  end
