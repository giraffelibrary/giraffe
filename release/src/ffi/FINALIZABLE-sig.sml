(* Copyright (C) 2015 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

(* The signature FINALIZABLE is the same as MLTON_FINALIZABLE.
 *
 * https://github.com/MLton/mlton/blob/master/basis-library/mlton/finalizable.sig
 *
 * Copyright (C) 2003-2005 Henry Cejtin, Matthew Fluet, Suresh
 *    Jagannathan, and Stephen Weeks.
 *
 * MLton is released under a BSD-style license.
 * See the file MLton-LICENSE for details.
 *)

signature FINALIZABLE =
  sig
    type 'a t
    val new : 'a -> 'a t
    val addFinalizer : 'a t * ('a -> unit) -> unit
    val finalizeBefore : 'a t * 'b t -> unit
    val touch : 'a t -> unit
    val withValue : 'a t * ('a -> 'b) -> 'b
  end
