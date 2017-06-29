(* Copyright (C) 2012, 2016-2017 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GObjectValueRecord :> G_OBJECT_VALUE_RECORD =
  struct
    structure Pointer = CPointerInternal
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p

    val new_ = _import "giraffe_g_value_new" : unit -> notnull p;

    val free_ = _import "giraffe_g_value_free" : notnull p -> unit;

    val copy_ =
      fn x1 & x2 =>
        (_import "g_value_copy" : notnull p * notnull p -> unit;)
        (x1, x2)

    val clear_ = _import "g_value_unset" : notnull p -> unit;

    val size_ = _import "giraffe_g_value_size" : unit -> GUInt.FFI.val_;

    structure Record =
      BoxedValueRecord(
        structure Pointer = Pointer
        type notnull = notnull
        type 'a p = 'a p
        val new_ = new_
        val copy_ = copy_
        val take_ = ignore
        val clear_ = clear_
        val free_ = free_
        val size_ = size_
      )
    open Record
  end
