structure GdkAtom :>
  GDK_ATOM
    where type record_t = GdkAtomRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val name_ = call (load_sym libgdk "gdk_atom_name") (GdkAtomRecord.PolyML.PTR --> Utf8.PolyML.RETPTR)
      val intern_ = call (load_sym libgdk "gdk_atom_intern") (Utf8.PolyML.INPTR &&> FFI.Bool.PolyML.VAL --> GdkAtomRecord.PolyML.PTR)
      val internStaticString_ = call (load_sym libgdk "gdk_atom_intern_static_string") (Utf8.PolyML.INPTR --> GdkAtomRecord.PolyML.PTR)
    end
    type record_t = GdkAtomRecord.t
    type t = record_t
    fun name self = (GdkAtomRecord.C.withPtr ---> Utf8.C.fromPtr true) name_ self
    fun intern atomName onlyIfExists = (Utf8.C.withPtr &&&> FFI.Bool.C.withVal ---> GdkAtomRecord.C.fromPtr false) intern_ (atomName & onlyIfExists)
    fun internStaticString atomName = (Utf8.C.withPtr ---> GdkAtomRecord.C.fromPtr false) internStaticString_ atomName
  end
