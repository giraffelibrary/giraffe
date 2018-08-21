(* Copyright (C) 2012, 2017-2018 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

(**
 * The functor CallbackTable constructs an instance of a callback table given
 * the callback function type.
 *
 * Note that the type `id` is abstract in the structure returned by this
 * functor due to opaque signature matching.  This ensures that `key` values
 * from one callback table instance cannot be used with another callback
 * table instance.
 *)
functor CallbackTable(type callback) :>
  CALLBACK_TABLE
    where type callback = callback =
  struct
    type callback = callback

    structure Table = WordTable(C_UInt)
    open Table

    type id = key
    val fmtId = fmtKey

    val table : callback t = new ()

    val add = insert table
    val remove = ignore o delete table
    val lookup = lookup table
  end
