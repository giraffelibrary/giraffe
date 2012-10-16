structure FileDesc :>
  sig
    include FILE_DESC
  end =
  struct
    type t = Posix.ProcEnv.file_desc

    val null = Posix.FileSys.wordToFD 0w0

    val intToFD = Posix.FileSys.wordToFD o SysWord.fromInt o Int32.toInt
    val fdToInt = Int32.fromInt o SysWord.toInt o Posix.FileSys.fdToWord

    structure C =
      struct
        type val_ = FFI.Int32.val_
        type ref_ = FFI.Int32.ref_
        fun withVal f fd = f (fdToInt fd)
        fun withRefVal f = withVal (FFI.withRef f)
        val fromVal = intToFD
      end
  end
