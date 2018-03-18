(* Copyright (C) 2012, 2018 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature PROPERTY =
  sig
    type value_t
    type ('a, 'b) accessor
    type 'a object_class

    (*
     * Initial value for properties
     *)
    type 'object_class t
    val name : 'object_class t -> string
    val value : 'object_class t -> value_t

    (*
     * Declaration of property operators
     *)
    val new : string -> ('a, 'b) accessor -> 'b -> 'c object_class t
    val get : string -> ('a, 'b) accessor -> 'c object_class -> 'a
    val set : string -> ('a, 'b) accessor -> 'b -> 'c object_class -> unit
  end
