structure GdkAtom :>
  GDK_ATOM
    where type record_t = GdkAtomRecord.t =
  struct
    val name_ = _import "gdk_atom_name" : GdkAtomRecord.C.notnull GdkAtomRecord.C.p -> FFI.String.notnull FFI.String.out_p;
    val intern_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gdk_atom_intern" :
              cstring
               * unit CPointer.t
               * FFI.Bool.val_
               -> GdkAtomRecord.C.notnull GdkAtomRecord.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val internStaticString_ = _import "mlton_gdk_atom_intern_static_string" : cstring * unit CPointer.t -> GdkAtomRecord.C.notnull GdkAtomRecord.C.p;
    type record_t = GdkAtomRecord.t
    fun name self = (GdkAtomRecord.C.withPtr ---> FFI.String.fromPtr true) name_ self
    fun intern atomName onlyIfExists = (FFI.String.withConstPtr &&&> FFI.Bool.withVal ---> GdkAtomRecord.C.fromPtr false) intern_ (atomName & onlyIfExists)
    fun internStaticString atomName = (FFI.String.withConstPtr ---> GdkAtomRecord.C.fromPtr false) internStaticString_ atomName
  end
