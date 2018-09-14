(* Copyright (C) 2012-2013, 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure FileDescType :> FILE_DESC_TYPE =
  struct
    open GIntType

    type t = Posix.ProcEnv.file_desc

    structure MLtonVector =
      struct
        val e = (Posix.FileSys.wordToFD o SysWord.fromLargeInt) MLtonVector.e
      end

    val toC = toC o SysWord.toLargeInt o Posix.FileSys.fdToWord
    val updateC = Fn.const Fn.ignore
    val fromC = Posix.FileSys.wordToFD o SysWord.fromLargeInt o fromC
  end
