signature G_I_REPOSITORY_ARGUMENT =
  sig
    datatype t =
      BOOLEAN      of bool
    | INT8         of LargeInt.int
    | UINT8        of LargeInt.int
    | INT16        of LargeInt.int
    | UINT16       of LargeInt.int
    | INT32        of LargeInt.int
    | UINT32       of LargeInt.int
    | INT64        of LargeInt.int
    | UINT64       of LargeInt.int
    | FLOAT        of LargeInt.int * int * LargeInt.int option
    | DOUBLE       of LargeInt.int * int * LargeInt.int option
    | UTF8         of string
    | FILENAME     of string
    | VOID
    | GTYPE
    | ARRAY
    | INTERFACE
    | GLIST
    | GSLIST
    | GHASH
    | ERROR
    | UNICHAR

    type typetag_t

    structure FFI :
      sig
        type notnull
        type 'a p
        val withNewPtr : (notnull p -> 'a) -> unit -> (notnull p, 'a) pair
        val fromPtr : typetag_t -> notnull p -> t
      end
  end
