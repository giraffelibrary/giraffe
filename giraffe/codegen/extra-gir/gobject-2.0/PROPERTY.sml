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
    type ('object_class, 'a) readonly = {get : 'object_class -> 'a}
    type ('object_class, 'a) writeonly = {set : 'a -> 'object_class -> unit}
    type ('object_class, 'a, 'b) readwrite =
      {
        get : 'object_class -> 'a,
        set : 'b -> 'object_class -> unit
      }

    (*
     * Declaration of properties with moded access
     *)
    type ('a, 'b) accessor
    type 'a object_class

    val get : string -> ('a, 'b) accessor -> 'c object_class -> 'a
    val set : string -> ('a, 'b) accessor -> 'b -> 'c object_class -> unit
  end
