signature G_I_REPOSITORY_TYPE_TAG =
  sig
    datatype t =
      BOOLEAN
    | CHAR            (* GIR only, not TYPELIB *)
    | UCHAR           (* GIR only, not TYPELIB *)
    | INT             (* GIR only, not TYPELIB *)
    | UINT            (* GIR only, not TYPELIB *)
    | SHORT           (* GIR only, not TYPELIB *)
    | USHORT          (* GIR only, not TYPELIB *)
    | LONG            (* GIR only, not TYPELIB *)
    | ULONG           (* GIR only, not TYPELIB *)
    | INT8
    | UINT8
    | INT16
    | UINT16
    | INT32
    | UINT32
    | INT64
    | UINT64
    | FLOAT
    | DOUBLE
    | SIZE            (* GIR only, not TYPELIB *)
    | SSIZE           (* GIR only, not TYPELIB *)
    | OFFSET          (* GIR only, not TYPELIB *)
    | INTPTR          (* GIR only, not TYPELIB *)
    | UINTPTR         (* GIR only, not TYPELIB *)
    | UTF8
    | FILENAME
    | VOID
    | GTYPE
    | ARRAY
    | INTERFACE
    | GLIST
    | GSLIST
    | GHASH
    | ERROR
    | UNICHAR
    val toString : t -> string
  end
