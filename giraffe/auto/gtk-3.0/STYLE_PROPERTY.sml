(* Copyright (C) 2012 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature STYLE_PROPERTY =
  sig
    (*
     * Types of properties with moded access
     *)
    type ('objectclass, 'a) readonly = {get : 'objectclass -> 'a}

    (*
     * Declaration of properties with moded access
     *)
    type 'a widgetclass_t

    val get : string -> ('a, 'b) GObjectValue.accessor -> 'c widgetclass_t -> 'a
  end
