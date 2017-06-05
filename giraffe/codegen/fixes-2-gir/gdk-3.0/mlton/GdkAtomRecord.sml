structure GdkAtomRecord :> GDK_ATOM_RECORD =
  struct
    structure Record = PointerRecord(val name = "GdkAtomRecord")
    open Record
  end
