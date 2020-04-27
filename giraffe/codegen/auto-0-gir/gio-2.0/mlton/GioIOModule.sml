structure GioIOModule :>
  GIO_I_O_MODULE
    where type 'a class = 'a GioIOModuleClass.class =
  struct
    val getType_ = _import "g_io_module_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "mlton_g_io_module_new" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GioIOModuleClass.FFI.notnull GioIOModuleClass.FFI.p;
    val query_ = _import "g_io_module_query" : unit -> Utf8CPtrArray.FFI.notnull Utf8CPtrArray.FFI.out_p;
    val load_ = _import "g_io_module_load" : GioIOModuleClass.FFI.notnull GioIOModuleClass.FFI.p -> unit;
    val unload_ = _import "g_io_module_unload" : GioIOModuleClass.FFI.notnull GioIOModuleClass.FFI.p -> unit;
    type 'a class = 'a GioIOModuleClass.class
    type t = base class
    fun asTypePlugin self = (GObjectObjectClass.FFI.withPtr ---> GObjectTypePluginClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new filename = (Utf8.FFI.withPtr ---> GioIOModuleClass.FFI.fromPtr true) new_ filename
    fun query () = (I ---> Utf8CPtrArray.FFI.fromPtr 2) query_ ()
    fun load self = (GioIOModuleClass.FFI.withPtr ---> I) load_ self
    fun unload self = (GioIOModuleClass.FFI.withPtr ---> I) unload_ self
  end
