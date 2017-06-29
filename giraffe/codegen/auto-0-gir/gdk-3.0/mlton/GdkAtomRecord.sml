structure GdkAtomRecord :> GDK_ATOM_RECORD =
  struct
    structure Record =
      PointerRecord(
        val name = "Gdk.Atom"
      )
    open Record
  end
