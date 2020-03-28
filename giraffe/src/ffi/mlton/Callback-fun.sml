(* Copyright (C) 2012, 2017 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

(**
 * The functor Callback constructs an instance of a callback table given the
 * type for callback values.
 *
 * Note that the type `id` is abstract in the structure returned by this
 * functor due to opaque signature matching.  This ensures that `id` values
 * from one callback table instance cannot be used with another callback
 * table instance.
 *)
functor CallbackTable(type elem) :>
  CALLBACK_TABLE
    where type id = C_UInt.word
    where type elem = elem =
  struct
    type elem = elem

    structure Table = WordTable(C_UInt)
    open Table

    val table : elem t = new ()

    val add = insert table
    val remove = ignore o delete table
    val lookup = lookup table
  end