(* Copyright (C) 2012, 2016-2018 Phil Clayton <phil.clayton@veonix.com>
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
    val size_ = _import "giraffe_g_object_value_size" : unit -> GSize.FFI.val_;
    val copy_ = fn x1 & x2 => (_import "giraffe_g_value_copy" : notnull p * notnull p -> unit;) (x1, x2)
    val clear_ = _import "giraffe_g_value_clear" : notnull p -> unit;
    structure Record =
      BoxedValueRecord(
        structure Pointer = Pointer
        type notnull = notnull
        type 'a p = 'a p
        val copy_ = copy_
        val clear_ = clear_
        val size_ = size_
      )
    open Record
  end
