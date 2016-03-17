structure GdkAtom :>
  GDK_ATOM
    where type t = GdkAtomRecord.t =
  struct
    val name_ = _import "gdk_atom_name" : GdkAtomRecord.C.notnull GdkAtomRecord.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val intern_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gdk_atom_intern" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Bool.C.val_
               -> GdkAtomRecord.C.notnull GdkAtomRecord.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val internStaticString_ = _import "mlton_gdk_atom_intern_static_string" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GdkAtomRecord.C.notnull GdkAtomRecord.C.p;
    type t = GdkAtomRecord.t
    fun name self = (GdkAtomRecord.C.withPtr ---> Utf8.C.fromPtr true) name_ self
    fun intern atomName onlyIfExists = (Utf8.C.withPtr &&&> FFI.Bool.C.withVal ---> GdkAtomRecord.C.fromPtr false) intern_ (atomName & onlyIfExists)
    fun internStaticString atomName = (Utf8.C.withPtr ---> GdkAtomRecord.C.fromPtr false) internStaticString_ atomName
  end
