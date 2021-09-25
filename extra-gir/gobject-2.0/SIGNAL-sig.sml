(* Copyright (C) 2012, 2017, 2021 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature SIGNAL =
  sig
    type ('arg_r, 'arg_w, 'res_r, 'res_w) marshaller

    (**
     * Representation of a signal
     *
     * The type `('object_class, 'arg_e, 'arg_h, 'res_h, 'res_e) t`
     * represents a signal of the class represented by the type
     * `'object_class` where
     *
     *     'arg_e -> 'res_e
     *       is the type of a function that emits the signal and
     *
     *     'arg_h -> 'res_h
     *       is the type of a function that handles the signal.
     *
     * The type parameters `'arg_e`, `'arg_h`, `'res_h` and `'res_e` capture
     * the type and direction of the signal arguments and the type of the
     * signal return value as follows:
     *
     *     `'arg_e` and `'arg_h` are instantiated to the types of the
     *       signal 'in' and 'inout' arguments;
     *
     *     `'res_e` and `'res_h` are instantiated to the types of the
     *       signal return value and 'out' and 'inout' arguments.
     *
     * The 'e' and 'h' variants differ in whether they allow an object of any
     * subclass or not and whether they allow an instance of any field of a
     * union or not.
     *
     * Ideally, the type `('object_class, 'arg_e, 'arg_h, 'res_h, 'res_e) t`
     * would be abstract and a function defined to construct values of the
     * type.  However, the resulting value always contains a type variable in
     * the parameter `'object_class` to allow the type of any subclass to
     * unify with it.  The application of the construction function is a non-
     * expansive expression so the result cannot be a value containing a
     * type variable due to the value restriction.  The usual work around
     * for the value restriction is to defer evaluation, so a signal would
     * have the type `unit -> ('object_class, ...) t` but this is not done.
     * Instead, the type is not abstract and its concrete representation - a
     * record - enables a value to be written as an expansive expression,
     * thereby avoiding the value restriction.
     *)
    type ('object_class, 'arg_e, 'arg_h, 'res_h, 'res_e) t =
      {
        name       : string,
        detail     : string,
        marshaller :
          unit
           -> (
                (unit,          'arg_h) pair,
                ('object_class, 'arg_e) pair,
                'res_e,
                'res_h
              )
               marshaller
      }

    type 'a object_class

    val emit :
      'a object_class
       -> ('a object_class, 'arg_e, 'b, 'c, 'res_e) t
       -> 'arg_e -> 'res_e

    type id
    val connect :
      'a object_class
       -> ('a object_class, 'b, 'arg_h, 'res_h, 'c) t * ('arg_h -> 'res_h)
       -> id
    val connectAfter :
      'a object_class
       -> ('a object_class, 'b, 'arg_h, 'res_h, 'c) t * ('arg_h -> 'res_h)
       -> id
    val handlerBlock   : 'a object_class -> id -> unit
    val handlerUnblock : 'a object_class -> id -> unit
    val disconnect : 'a object_class -> id -> unit
    val isConnected : 'a object_class -> id -> bool

    val detail : ('object_class, 'arg_e, 'arg_h, 'res_h, 'res_e) t -> string
    val withDetail :
      ('object_class, 'arg_e, 'arg_h, 'res_h, 'res_e) t * string
       -> ('object_class, 'arg_e, 'arg_h, 'res_h, 'res_e) t

    type ('object_class, 'get, 'set, 'init) property_t
    val withPropDetail :
      ('a object_class, 'arg_e, 'arg_h, 'res_h, 'res_e) t
           * ('a object_class, 'get, 'set, 'init) property_t
       -> ('a object_class, 'arg_e, 'arg_h, 'res_h, 'res_e) t
  end
