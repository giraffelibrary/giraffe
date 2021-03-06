(* Copyright (C) 2012 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GiraffeLog :> GIRAFFE_LOG =
  struct
    fun critical msg =
      (
        app print ["GIRAFFE-CRITICAL ", msg, "\n"];
        TextIO.flushOut TextIO.stdOut
      )
  end
