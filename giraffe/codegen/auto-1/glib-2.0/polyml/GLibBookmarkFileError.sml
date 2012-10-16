structure GLibBookmarkFileError :>
  sig
    include
      G_LIB_BOOKMARK_FILE_ERROR
        where type errorrecord_handler = GLibErrorRecord.handler
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      INVALIDURI
    | INVALIDVALUE
    | APPNOTREGISTERED
    | URINOTFOUND
    | READ
    | UNKNOWNENCODING
    | WRITE
    | FILENOTFOUND
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            INVALIDURI => f 0
          | INVALIDVALUE => f 1
          | APPNOTREGISTERED => f 2
          | URINOTFOUND => f 3
          | READ => f 4
          | UNKNOWNENCODING => f 5
          | WRITE => f 6
          | FILENOTFOUND => f 7
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => INVALIDURI
          | 1 => INVALIDVALUE
          | 2 => APPNOTREGISTERED
          | 3 => URINOTFOUND
          | 4 => READ
          | 5 => UNKNOWNENCODING
          | 6 => WRITE
          | 7 => FILENOTFOUND
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.PolyML.Enum.VAL
        val REF = FFI.PolyML.Enum.REF
      end
    exception Error of t
    type errorrecord_handler = GLibErrorRecord.handler
    val handler =
      GLibErrorRecord.makeHandler
        (
          "g-bookmark-file-error-quark",
          C.fromVal,
          Error
        )
  end
exception GLibBookmarkFileError = GLibBookmarkFileError.Error
