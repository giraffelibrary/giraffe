signature G_I_REPOSITORY_REPOSITORY_ERROR =
  sig
    datatype t =
      TYPELIBNOTFOUND
    | NAMESPACEMISMATCH
    | NAMESPACEVERSIONCONFLICT
    | LIBRARYNOTFOUND
    val null : t
    structure C :
      sig
        type val_
        type ref_
        val withVal :
          (val_ -> 'a)
           -> t
           -> 'a
        val withRefVal :
          (ref_ -> 'a)
           -> t
           -> (val_, 'a) pair
        val fromVal : val_ -> t
        exception Value of FFI.Enum.val_
      end
  end
