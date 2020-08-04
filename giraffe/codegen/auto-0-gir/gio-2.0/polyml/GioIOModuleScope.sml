structure GioIOModuleScope :>
  GIO_I_O_MODULE_SCOPE
    where type t = GioIOModuleScopeRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val block_ = call (getSymbol "g_io_module_scope_block") (GioIOModuleScopeRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
    end
    type t = GioIOModuleScopeRecord.t
    fun block self basename = (GioIOModuleScopeRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) block_ (self & basename)
  end
