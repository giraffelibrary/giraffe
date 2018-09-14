(* Copyright (C) 2012, 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure Fn =
  struct
    fun id x = x

    fun const x _ = x

    fun ignore x = const () x

    fun iterate f x =
      case f x of
        NONE    => x
      | SOME x' => iterate f x'

    fun lazy (f : unit -> 'a) : unit -> 'a =
      let
        datatype 'a result =
          UNKNOWN of (unit -> 'a)
        | SUCCESS of 'a
        | FAILURE of exn

        val r = ref (UNKNOWN f)
      in
        fn () =>
          case ! r of
            UNKNOWN f =>
              let
                val a = f () handle e => (r := FAILURE e; raise e)
              in
                r := SUCCESS a;
                a
              end
          | SUCCESS a => a
          | FAILURE e => raise e
      end
  end
