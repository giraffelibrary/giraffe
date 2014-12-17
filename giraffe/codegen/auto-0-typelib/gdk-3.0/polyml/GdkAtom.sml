structure GdkAtom :>
  GDK_ATOM
    where type record_t = GdkAtomRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val name_ = call (load_sym libgdk "gdk_atom_name") (GdkAtomRecord.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val intern_ = call (load_sym libgdk "gdk_atom_intern") (FFI.String.PolyML.INPTR &&> FFI.Bool.PolyML.VAL --> GdkAtomRecord.PolyML.PTR)
      val internStaticString_ = call (load_sym libgdk "gdk_atom_intern_static_string") (FFI.String.PolyML.INPTR --> GdkAtomRecord.PolyML.PTR)
    end
    type record_t = GdkAtomRecord.t
    type t = record_t
    fun name self = (GdkAtomRecord.C.withPtr ---> FFI.String.C.fromPtr true) name_ self
    fun intern atomName onlyIfExists = (FFI.String.C.withConstPtr &&&> FFI.Bool.C.withVal ---> GdkAtomRecord.C.fromPtr false) intern_ (atomName & onlyIfExists)
    fun internStaticString atomName = (FFI.String.C.withConstPtr ---> GdkAtomRecord.C.fromPtr false) internStaticString_ atomName
  end
