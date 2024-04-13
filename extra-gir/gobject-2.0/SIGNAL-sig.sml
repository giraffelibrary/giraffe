(* Copyright (C) 2012, 2017, 2021, 2024 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature SIGNAL =
  sig
    type callback

    type 'a object_class

    (**
     * Representation of a signal
     *
     * The type `('object_class, 'h, 'e) t` represents a signal of the class
     * represented by the type `'object_class`.  The type parameters `'h`
     * and `'e` represent the type of the signal for handling and emission,
     * respectively.  The parameters `'h` and `'e` are instantiated with
     * types of the form
     *
     *     <arg> -> <res>
     *       if the signal has one or more 'in' or 'inout' arguments
     *
     *     <res>
     *       otherwise
     *
     * where
     *
     *     arg
     *       is the types of the signal 'in' and 'inout' arguments,
     *        as a tuple if there are two or more;
     *
     *     res
     *       is the types of the signal return value and 'out' and
     *        'inout' arguments, as a tuple if there are two or more
     *        and `unit` if there are none.
     *
     * The types `'h` and `'e` differ in that <res> for `'h` and
     * <arg> for `'e` allow
     *   - an object of any subclass and
     *   - an instance of any field of a union
     * but <arg> for `'h` and <res> for `'e` do not.
     *
     * Ideally, the type `('object_class, 'h, 'e) t`  would be abstract and
     * a function defined to construct values of the type.  However, the
     * resulting value always contains a type variable in the parameter
     * `'object_class` to allow the type of any subclass to unify with it.
     * The application of the construction function is a non-expansive
     * expression so the result cannot be a value containing a type variable
     * due to the value restriction.  The usual work around for the value
     * restriction is to defer evaluation, so a signal would have the type
     * `unit -> ('object_class, ...) t` but this is not desirable for users.
     * Instead, the type is not abstract and its concrete representation - a
     * record - enables a value to be written as an expansive expression,
     * thereby avoiding the value restriction.
     *)
    type ('object_class, 'h, 'e) t =
      {
        name       : string,
        detail     : string,
        marshaller :
          unit
           -> {
                h : (base object_class -> 'h) -> callback,
                e : callback -> 'object_class -> 'e
              }
      }

    val conv :
      ('a -> 'b)
       -> ('b, 'h, 'e) t
       -> ('a, 'h, 'e) t

    (* `emit instance signal` uses the same calling closure for each
     * argument that it is applied to. *)
    val emit :
      'a object_class
       -> ('a object_class, 'h, 'e) t
       -> 'e

    type handler_id
    val connect :
      'a object_class
       -> ('a object_class, 'h, 'e) t
           * ('a object_class -> 'h)
       -> handler_id
    val connectAfter :
      'a object_class
       -> ('a object_class, 'h, 'e) t
           * ('a object_class -> 'h)
       -> handler_id
    val handlerBlock   : 'a object_class -> handler_id -> unit
    val handlerUnblock : 'a object_class -> handler_id -> unit
    val handlerDisconnect : 'a object_class -> handler_id -> unit
    val handlerIsConnected : 'a object_class -> handler_id -> bool

    val detail : ('object_class, 'h, 'e) t -> string
    val withDetail :
      ('object_class, 'h, 'e) t * string
       -> ('object_class, 'h, 'e) t

    type ('object_class, 'get, 'set, 'init) property_t
    val withPropDetail :
      ('a object_class, 'h, 'e) t
           * ('a object_class, 'get, 'set, 'init) property_t
       -> ('a object_class, 'h, 'e) t
  end
