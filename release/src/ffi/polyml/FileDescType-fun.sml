(* Copyright (C) 2012-2013, 2016, 2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor FileDescType(
  Memory : C_MEMORY where type Pointer.t = PolyMLFFI.Memory.Pointer.t
) :> FILE_DESC_TYPE =
  struct
    structure GIntType = IntType(Memory)
    open GIntType

    type t = Posix.ProcEnv.file_desc

    val toC = toC o SysWord.toLargeInt o Posix.FileSys.fdToWord
    val updateC = Fn.const Fn.ignore
    val fromC = Posix.FileSys.wordToFD o SysWord.fromLargeInt o fromC
  end
