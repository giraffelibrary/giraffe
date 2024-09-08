(* Copyright (C) 2012, 2024 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature GIRAFFE_LOG =
  sig
    val log : bool -> string list -> string list -> unit
    val logDebug : string list -> string list -> unit
    val logWarning : string list -> unit
    val logCritical : string list -> unit

    val warning : string -> unit
    val critical : string -> unit
  end
