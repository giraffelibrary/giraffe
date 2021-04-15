(* Copyright (C) 2012, 2018, 2020-2021 Phil Clayton <phil.clayton@veonix.com>
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
     *
     * The type `('object_class, 'get, 'set, 'init) t` represents a property
     * of an object whose class is represented by the type `'object_class`.
     * The type parameters `'get`, `'set` and `'init` capture the possible
     * access modes as follows so that type checking ensures mode safety:
     *
     *     'get is instantiated to:
     *
     *         unit -> 'r
     *           if a value of type 'r can be read from the property
     *
     *         unit
     *           if the property is not readable
     *
     *     'set is instantiated to:
     *
     *         'w -> unit
     *           if a value of type 'w can be written to the property
     *           after object construction
     *
     *         unit
     *           if the property is not writable after object construction
     *
     *     'init is instantiated as for 'set but according to whether
     *     a value of type 'w can be set during object construction.
     *
     * Ideally, the type `('object_class, 'get, 'set, 'init) t` would be
     * abstract and a function defined to construct values of the type.
     * However, the resulting value always contains a type variable in the
     * parameter `'object_class` to allow the type of any subclass to unify
     * with it.  The application of the construction function is a non-
     * expansive expression so the result cannot be a value containing a
     * type variable due to the value restriction.  The usual work around
     * for the value restriction is to defer evaluation, so a property would
     * have the type `unit -> ('object_class, 'get, 'set, 'init) t` but this
     * is not done.  Instead, the type is not abstract and its concrete
     * representation - a record - enables a value to be written as an
     * expansive expression, thereby avoiding the value restriction.
     * However, the type parameter `'object_class` is a phantom type which
     * must be therefore be mentioned in the concrete representation
     * (otherwise it imposes no type constraint).  An argument of this
     * type can be added to the `get` and `set` functions because they
     * require an object instance to operate on therefore there is always
     * a value available to use as the witness for the type.  Note that the
     * field `gtype` must defer evaluation because some GObject types are not
     * determined until run-time.  This is convenient because it allows the
     * value to be defined by a non-expansive expression without falling foul
     * of the value restriction.
     *)
    type ('object_class, 'get, 'set, 'init) t =
      {
        name  : string,
        gtype : unit -> type_t,
        get   : 'object_class -> value_v -> 'get,
        set   : 'object_class -> value_v -> 'set,
        init  :                  value_v -> 'init
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
