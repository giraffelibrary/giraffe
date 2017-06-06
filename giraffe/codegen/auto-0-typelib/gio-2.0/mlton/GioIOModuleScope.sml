structure GioIOModuleScope :>
  GIO_I_O_MODULE_SCOPE
    where type t = GioIOModuleScopeRecord.t =
  struct
    val block_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_io_module_scope_block" :
              GioIOModuleScopeRecord.FFI.notnull GioIOModuleScopeRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type t = GioIOModuleScopeRecord.t
    fun block self basename = (GioIOModuleScopeRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) block_ (self & basename)
  end
