structure GdkAtom :>
  GDK_ATOM
    where type t = GdkAtomRecord.t =
  struct
    val name_ = _import "gdk_atom_name" : GdkAtomRecord.FFI.non_opt GdkAtomRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val intern_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gdk_atom_intern" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GBool.FFI.val_
               -> GdkAtomRecord.FFI.non_opt GdkAtomRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val internStaticString_ = _import "mlton_gdk_atom_intern_static_string" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GdkAtomRecord.FFI.non_opt GdkAtomRecord.FFI.p;
    type t = GdkAtomRecord.t
    fun name self = (GdkAtomRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) name_ self
    fun intern (atomName, onlyIfExists) = (Utf8.FFI.withPtr 0 &&&> GBool.FFI.withVal ---> GdkAtomRecord.FFI.fromPtr false) intern_ (atomName & onlyIfExists)
    fun internStaticString atomName = (Utf8.FFI.withPtr 0 ---> GdkAtomRecord.FFI.fromPtr false) internStaticString_ atomName
  end
