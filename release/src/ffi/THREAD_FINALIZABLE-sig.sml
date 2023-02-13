(* Copyright (C) 2023 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature THREAD_FINALIZABLE =
  sig
    include CONTEXT_FINALIZABLE

    structure Thread :
      sig
        type marshaler = (unit -> unit) -> unit
        val setMarshaler : marshaler option -> unit
        val finalize : marshaler * (unit -> unit) -> bool
      end

    val newInThread : 'a -> 'a t
  end
