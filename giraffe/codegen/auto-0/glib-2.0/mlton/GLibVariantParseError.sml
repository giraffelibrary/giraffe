structure GLibVariantParseError :>
  sig
    include G_LIB_VARIANT_PARSE_ERROR
  end =
  struct
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
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            FAILED => f 0
          | BASICTYPEEXPECTED => f 1
          | CANNOTINFERTYPE => f 2
          | DEFINITETYPEEXPECTED => f 3
          | INPUTNOTATEND => f 4
          | INVALIDCHARACTER => f 5
          | INVALIDFORMATSTRING => f 6
          | INVALIDOBJECTPATH => f 7
          | INVALIDSIGNATURE => f 8
          | INVALIDTYPESTRING => f 9
          | NOCOMMONTYPE => f 10
          | NUMBEROUTOFRANGE => f 11
          | NUMBERTOOBIG => f 12
          | TYPEERROR => f 13
          | UNEXPECTEDTOKEN => f 14
          | UNKNOWNKEYWORD => f 15
          | UNTERMINATEDSTRINGCONSTANT => f 16
          | VALUEEXPECTED => f 17
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => FAILED
          | 1 => BASICTYPEEXPECTED
          | 2 => CANNOTINFERTYPE
          | 3 => DEFINITETYPEEXPECTED
          | 4 => INPUTNOTATEND
          | 5 => INVALIDCHARACTER
          | 6 => INVALIDFORMATSTRING
          | 7 => INVALIDOBJECTPATH
          | 8 => INVALIDSIGNATURE
          | 9 => INVALIDTYPESTRING
          | 10 => NOCOMMONTYPE
          | 11 => NUMBEROUTOFRANGE
          | 12 => NUMBERTOOBIG
          | 13 => TYPEERROR
          | 14 => UNEXPECTEDTOKEN
          | 15 => UNKNOWNKEYWORD
          | 16 => UNTERMINATEDSTRINGCONSTANT
          | 17 => VALUEEXPECTED
          | n => raise Value n
      end
    val null = FAILED
  end
