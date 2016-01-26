(* Copyright (C) 2012, 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GObjectValueRecord :>
  sig
    include G_OBJECT_VALUE_RECORD
  end =
  struct
    type notnull = CPointer.notnull
    type 'a p = 'a CPointer.p

    val new_ = _import "giraffe_g_value_new" : unit -> notnull p;

    val copy_ = _import "giraffe_g_value_copy" : notnull p -> notnull p;

    val free_ = _import "giraffe_g_value_free" : notnull p -> unit;

    val size_ = _import "giraffe_g_value_size" : unit -> FFI.UInt.C.val_;

    type t = notnull p Finalizable.t

    structure C =
      struct
        structure Pointer = CPointer
        type notnull = notnull
        type 'a p = 'a p

        fun withPtr f ptr = Finalizable.withValue (ptr, Pointer.withVal f)

        fun withOptPtr f =
          fn
            SOME ptr => Finalizable.withValue (ptr, Pointer.withOptVal f o SOME)
          | NONE     => Pointer.withOptVal f NONE

        fun withNewPtr f () =
          let
            val ptr = new_ ()
          in
            ptr & f ptr
          end

        fun fromPtr transfer ptr =
          let
            val object =
              Finalizable.new (
                if transfer
                then ptr  (* take the existing reference *)
                else copy_ ptr
              )
          in
            Finalizable.addFinalizer (object, free_);
            object
          end

        fun fromOptPtr transfer optptr =
          Option.map (fromPtr transfer) (Pointer.fromOptVal optptr)

        val size = Word.fromLargeInt (FFI.UInt.C.fromVal (size_ ()))

        structure Array =
          struct
            type 'a array_p = 'a p
            fun sub p w = Pointer.add (p, w * size)
          end
      end
  end
