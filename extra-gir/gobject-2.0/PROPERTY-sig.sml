(* Copyright (C) 2012, 2018, 2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature PROPERTY =
  sig
    type type_t
    type value_v
    type 'a object_class
    type 'a binding_class

    (**
     * Representation of a property
     *)
    type ('object_class, 'get, 'set, 'init) t =
      {
        name  : string,
        gtype : unit -> type_t,
        get   : value_v -> 'get,
        set   : value_v -> 'set,
        init  : value_v -> 'init
      }

    val conv :
      ('a -> 'b)
       -> ('b, 'get, 'set, 'init) t
       -> ('a, 'get, 'set, 'init) t

    (**
     * Access to a property
     *)
    val get : ('a object_class, unit -> 'r, 'b, 'c) t -> 'a object_class -> 'r
    val set : ('a object_class, 'b, 'w -> unit, 'c) t -> 'w -> 'a object_class -> unit

    (**
     * Initial value of a property, for use with `GObject.Object.new`
     *)
    type 'object_class init_t
    val init : ('object_class, 'a, 'b, 'w -> unit) t -> 'w -> 'object_class init_t
    val initName : 'object_class init_t -> string
    val initValue : 'object_class init_t -> value_v -> unit

    (**
     * Binding two properties
     *
     * These functions provide a type safe interface to
     * `GObject.Object.bindProperty[Full]`.  For the non-full versions, where
     * the conversion is implicit, it is assumed that if two properties have
     * the same SML type but different GObject types, then the value of one
     * can be transformed to the value of the other.
     *
     * In every function, the `bool` argument determines whether the
     * properties are synchronized on creation.
     *)
    val bind :
      'a object_class
       * ('a object_class, unit -> 'c, 'set, 'init) t
       * 'b object_class
       * ('b object_class, 'get, 'c -> unit, 'init) t
       * bool
       -> base binding_class
    val bindBidir :
      'a object_class
       * ('a object_class, unit -> 'c, 'd -> unit, 'init) t
       * 'b object_class
       * ('b object_class, unit -> 'd, 'c -> unit, 'init) t
       * bool
       -> base binding_class
    val bindInvertBool :
      'a object_class
       * ('a object_class, unit -> bool, 'set, 'init) t
       * 'b object_class
       * ('b object_class, 'get, bool -> unit, 'init) t
       * bool
       -> base binding_class
    val bindBidirInvertBool :
      'a object_class
       * ('a object_class, unit -> bool, bool -> unit, 'init) t
       * 'b object_class
       * ('b object_class, unit -> bool, bool -> unit, 'init) t
       * bool
       -> base binding_class
    val bindFull :
      'a object_class
       * ('a object_class, unit -> 'c, 'set, 'init) t
       * 'b object_class
       * ('b object_class, 'get, 'd -> unit, 'init) t
       * bool
       * ('c -> 'd)
       -> base binding_class
    val bindFullBidir :
      'a object_class
       * ('a object_class, unit -> 'c, 'f -> unit, 'init) t
       * 'b object_class
       * ('b object_class, unit -> 'e, 'd -> unit, 'init) t
       * bool
       * ('c -> 'd)
       * ('e -> 'f)
       -> base binding_class
  end
