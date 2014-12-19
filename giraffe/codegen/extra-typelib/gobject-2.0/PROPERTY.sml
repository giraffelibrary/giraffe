(* Copyright (C) 2012 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature PROPERTY =
  sig
    (*
     * Types of properties with moded access
     *)
    type ('objectclass, 'a) readonly = {get : 'objectclass -> 'a}
    type ('objectclass, 'a) writeonly = {set : 'a -> 'objectclass -> unit}
    type ('objectclass, 'a, 'b) readwrite =
      {
        get : 'objectclass -> 'a,
        set : 'b -> 'objectclass -> unit
      }

    (*
     * Declaration of properties with moded access
     *)
    type ('a, 'b) accessor
    type 'a objectclass_t

    val get : string -> ('a, 'b) accessor -> 'c objectclass_t -> 'a
    val set : string -> ('a, 'b) accessor -> 'b -> 'c objectclass_t -> unit
  end
