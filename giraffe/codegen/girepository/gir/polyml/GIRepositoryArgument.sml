structure GIRepositoryArgument :>
  sig
    include G_I_REPOSITORY_ARGUMENT
      where type typetag_t = GIRepositoryTypeTag.t
  end =
  struct
    type typetag_t = GIRepositoryTypeTag.t

    datatype t =
      BOOLEAN      of bool
    | CHAR         of char            (* GIR only, not TYPELIB *)
    | UCHAR        of char            (* GIR only, not TYPELIB *)
    | INT          of LargeInt.int    (* GIR only, not TYPELIB *)
    | UINT         of LargeInt.int    (* GIR only, not TYPELIB *)
    | SHORT        of LargeInt.int    (* GIR only, not TYPELIB *)
    | USHORT       of LargeInt.int    (* GIR only, not TYPELIB *)
    | LONG         of LargeInt.int    (* GIR only, not TYPELIB *)
    | ULONG        of LargeInt.int    (* GIR only, not TYPELIB *)
    | INT8         of LargeInt.int
    | UINT8        of LargeInt.int
    | INT16        of LargeInt.int
    | UINT16       of LargeInt.int
    | INT32        of LargeInt.int
    | UINT32       of LargeInt.int
    | INT64        of LargeInt.int
    | UINT64       of LargeInt.int
    | FLOAT        of LargeInt.int * LargeInt.int * LargeInt.int option
    | DOUBLE       of LargeInt.int * LargeInt.int * LargeInt.int option
    | SIZE         of LargeInt.int    (* GIR only, not TYPELIB *)
    | SSIZE        of LargeInt.int    (* GIR only, not TYPELIB *)
    | OFFSET                          (* GIR only, not TYPELIB *)
    | INTPTR                          (* GIR only, not TYPELIB *)
    | UINTPTR                         (* GIR only, not TYPELIB *)
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
  end
