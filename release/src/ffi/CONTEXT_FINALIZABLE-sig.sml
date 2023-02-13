(* Copyright (C) 2023 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature CONTEXT_FINALIZABLE =
  sig
    include FINALIZABLE

    structure Context :
      sig
        type t
        val new : unit -> t

        type marshaler = (unit -> unit) -> unit
        val setMarshaler : t -> marshaler option -> unit
        val finalize : t -> marshaler * (unit -> unit) -> bool
      end

    val newInContext : Context.t -> 'a -> 'a t
  end
