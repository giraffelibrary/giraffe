structure GioIOModule :>
  GIO_I_O_MODULE
    where type 'a class_t = 'a GioIOModuleClass.t =
  struct
    val getType_ = _import "g_io_module_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "mlton_g_io_module_new" : cstring * unit CPointer.t -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val load_ = _import "g_io_module_load" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val unload_ = _import "g_io_module_unload" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    type 'a class_t = 'a GioIOModuleClass.t
    fun asTypePlugin self = (GObjectObjectClass.C.withPtr ---> GObjectTypePluginClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new filename = (FFI.String.withConstPtr ---> GioIOModuleClass.C.fromPtr true) new_ filename
    fun load self = (GObjectObjectClass.C.withPtr ---> I) load_ self
    fun unload self = (GObjectObjectClass.C.withPtr ---> I) unload_ self
  end
