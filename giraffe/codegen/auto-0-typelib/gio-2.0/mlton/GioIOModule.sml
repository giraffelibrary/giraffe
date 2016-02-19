structure GioIOModule :>
  GIO_I_O_MODULE
    where type 'a class_t = 'a GioIOModuleClass.t =
  struct
    val getType_ = _import "g_io_module_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "mlton_g_io_module_new" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val load_ = _import "g_io_module_load" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val unload_ = _import "g_io_module_unload" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    type 'a class_t = 'a GioIOModuleClass.t
    type t = base class_t
    fun asTypePlugin self = (GObjectObjectClass.C.withPtr ---> GObjectTypePluginClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new filename = (Utf8.C.withPtr ---> GioIOModuleClass.C.fromPtr true) new_ filename
    fun load self = (GObjectObjectClass.C.withPtr ---> I) load_ self
    fun unload self = (GObjectObjectClass.C.withPtr ---> I) unload_ self
  end
