structure GdkAtom :>
  GDK_ATOM
    where type record_t = GdkAtomRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val name_ = call (load_sym libgdk "gdk_atom_name") (GdkAtomRecord.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val intern_ = call (load_sym libgdk "gdk_atom_intern") (FFI.PolyML.String.INPTR &&> FFI.PolyML.Bool.VAL --> GdkAtomRecord.PolyML.PTR)
      val internStaticString_ = call (load_sym libgdk "gdk_atom_intern_static_string") (FFI.PolyML.String.INPTR --> GdkAtomRecord.PolyML.PTR)
    end
    type record_t = GdkAtomRecord.t
    fun name self = (GdkAtomRecord.C.withPtr ---> FFI.String.fromPtr true) name_ self
    fun intern atomName onlyIfExists = (FFI.String.withConstPtr &&&> FFI.Bool.withVal ---> GdkAtomRecord.C.fromPtr false) intern_ (atomName & onlyIfExists)
    fun internStaticString atomName = (FFI.String.withConstPtr ---> GdkAtomRecord.C.fromPtr false) internStaticString_ atomName
  end
