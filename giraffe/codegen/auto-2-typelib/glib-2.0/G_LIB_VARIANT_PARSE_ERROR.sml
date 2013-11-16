signature G_LIB_VARIANT_PARSE_ERROR =
  sig
    datatype t =
      FAILED
    | BASICTYPEEXPECTED
    | CANNOTINFERTYPE
    | DEFINITETYPEEXPECTED
    | INPUTNOTATEND
    | INVALIDCHARACTER
    | INVALIDFORMATSTRING
    | INVALIDOBJECTPATH
    | INVALIDSIGNATURE
    | INVALIDTYPESTRING
    | NOCOMMONTYPE
    | NUMBEROUTOFRANGE
    | NUMBERTOOBIG
    | TYPEERROR
    | UNEXPECTEDTOKEN
    | UNKNOWNKEYWORD
    | UNTERMINATEDSTRINGCONSTANT
    | VALUEEXPECTED
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
        exception Value of FFI.Enum.C.val_
      end
  end
