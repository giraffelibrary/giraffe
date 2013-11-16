structure FileDesc :>
  sig
    include FILE_DESC
  end =
  struct
    type t = Posix.ProcEnv.file_desc

    val null = Posix.FileSys.wordToFD 0w0

    val intToFD = Posix.FileSys.wordToFD o SysWord.fromLargeInt
    val fdToInt = SysWord.toLargeInt o Posix.FileSys.fdToWord

    structure C =
      struct
        type val_ = FFI.Int.C.val_
        type ref_ = FFI.Int.C.ref_
        fun withVal f = FFI.Int.C.withVal f o fdToInt
        fun withRefVal f = FFI.Int.C.withRefVal f o fdToInt
        val fromVal = intToFD o FFI.Int.C.fromVal
      end
  end
