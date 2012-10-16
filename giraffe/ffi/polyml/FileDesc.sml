structure FileDesc :>
  sig
    include FILE_DESC

    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    type t = Posix.ProcEnv.file_desc

    val null = Posix.FileSys.wordToFD 0w0

    val intToFD = Posix.FileSys.wordToFD o SysWord.fromInt o LargeInt.toInt
    val fdToInt = LargeInt.fromInt o SysWord.toInt o Posix.FileSys.fdToWord

    structure C =
      struct
        type val_ = FFI.Int32.val_
        type ref_ = FFI.Int32.ref_
        fun withVal f fd = f (fdToInt fd)
        fun withRefVal f = withVal (FFI.withRef FFI.PolyML.Int32.VAL f)
        val fromVal = intToFD
      end

    structure PolyML =
      struct
        val VAL = FFI.PolyML.Int32.VAL
        val REF = FFI.PolyML.Int32.REF
      end
  end
