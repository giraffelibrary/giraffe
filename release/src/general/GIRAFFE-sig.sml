(* Copyright (C) 2020, 2024 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature GIRAFFE =
  sig
    (**
     * `exit status` exits the process where the exit status is the lower
     *  8 bits of (the two's complement representation of) `status`.
     *)
    val exit : LargeInt.int -> 'a

    (**
     * `error status errMsgs` outputs `errMsgs` to the standard error,
     * flushes the standard error and exits the process using `exit status`.
     *)
    val error : LargeInt.int -> string list -> 'a
  
    structure Log : GIRAFFE_LOG
    structure Debug : GIRAFFE_DEBUG
    structure GC : GIRAFFE_GC
  end
