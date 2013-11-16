signature GIO_FILE_ATTRIBUTE_TYPE =
  sig
    datatype t =
      INVALID
    | STRING
    | BYTESTRING
    | BOOLEAN
    | UINT32
    | INT32
    | UINT64
    | INT64
    | OBJECT
    | STRINGV
    val null : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
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
        exception Value of FFI.Enum.C.val_
      end
  end
