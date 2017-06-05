structure GIRepositoryRepositoryError :> G_I_REPOSITORY_REPOSITORY_ERROR =
  struct
    datatype enum =
      TYPELIB_NOT_FOUND
    | NAMESPACE_MISMATCH
    | NAMESPACE_VERSION_CONFLICT
    | LIBRARY_NOT_FOUND
    structure Enum =
      Enum(
        type enum = enum
        val null = TYPELIB_NOT_FOUND
        val toInt =
          fn
            TYPELIB_NOT_FOUND => 0
          | NAMESPACE_MISMATCH => 1
          | NAMESPACE_VERSION_CONFLICT => 2
          | LIBRARY_NOT_FOUND => 3
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => TYPELIB_NOT_FOUND
          | 1 => NAMESPACE_MISMATCH
          | 2 => NAMESPACE_VERSION_CONFLICT
          | 3 => LIBRARY_NOT_FOUND
          | n => raise Value n
      )
    open Enum
  end
