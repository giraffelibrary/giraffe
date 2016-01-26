structure GdkAtom :>
  GDK_ATOM
    where type record_t = GdkAtomRecord.t =
  struct
    val name_ = _import "gdk_atom_name" : GdkAtomRecord.C.notnull GdkAtomRecord.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val intern_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gdk_atom_intern" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.Bool.C.val_
               -> GdkAtomRecord.C.notnull GdkAtomRecord.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val internStaticString_ = _import "mlton_gdk_atom_intern_static_string" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> GdkAtomRecord.C.notnull GdkAtomRecord.C.p;
    type record_t = GdkAtomRecord.t
    type t = record_t
    fun name self = (GdkAtomRecord.C.withPtr ---> FFI.String.C.fromPtr true) name_ self
    fun intern atomName onlyIfExists = (FFI.String.C.withConstPtr &&&> FFI.Bool.C.withVal ---> GdkAtomRecord.C.fromPtr false) intern_ (atomName & onlyIfExists)
    fun internStaticString atomName = (FFI.String.C.withConstPtr ---> GdkAtomRecord.C.fromPtr false) internStaticString_ atomName
  end
