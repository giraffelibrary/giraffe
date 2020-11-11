(* Copyright (C) 2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure Giraffe :> GIRAFFE =
  struct
    fun exit status = Posix.Process.exit (Word8.fromLargeInt status)

    fun error status errMsgs =
      let
        open TextIO
        fun outputErr s = output (stdErr, s)

        val () = app outputErr errMsgs
        val () = flushOut stdErr
      in
        exit status
      end
  end
