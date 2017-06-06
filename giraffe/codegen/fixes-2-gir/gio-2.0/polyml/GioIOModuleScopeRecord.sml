structure GioIOModuleScopeRecord :> GIO_I_O_MODULE_SCOPE_RECORD =
  struct
    structure Record = PointerRecord(val name = "GioIOModuleScopeRecord")
    open Record
  end
