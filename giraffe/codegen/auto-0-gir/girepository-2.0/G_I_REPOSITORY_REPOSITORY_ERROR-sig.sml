signature G_I_REPOSITORY_REPOSITORY_ERROR =
  sig
    datatype enum =
      TYPELIB_NOT_FOUND
    | NAMESPACE_MISMATCH
    | NAMESPACE_VERSION_CONFLICT
    | LIBRARY_NOT_FOUND
    include
      ENUM
        where type t = enum
  end
