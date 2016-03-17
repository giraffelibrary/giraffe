structure GdkAtom :>
  GDK_ATOM
    where type t = GdkAtomRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val name_ = call (load_sym libgdk "gdk_atom_name") (GdkAtomRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val intern_ = call (load_sym libgdk "gdk_atom_intern") (Utf8.PolyML.cInPtr &&> FFI.Bool.PolyML.cVal --> GdkAtomRecord.PolyML.cPtr)
      val internStaticString_ = call (load_sym libgdk "gdk_atom_intern_static_string") (Utf8.PolyML.cInPtr --> GdkAtomRecord.PolyML.cPtr)
    end
    type t = GdkAtomRecord.t
    fun name self = (GdkAtomRecord.C.withPtr ---> Utf8.C.fromPtr true) name_ self
    fun intern atomName onlyIfExists = (Utf8.C.withPtr &&&> FFI.Bool.C.withVal ---> GdkAtomRecord.C.fromPtr false) intern_ (atomName & onlyIfExists)
    fun internStaticString atomName = (Utf8.C.withPtr ---> GdkAtomRecord.C.fromPtr false) internStaticString_ atomName
  end
