(* Copyright (C) 2012, 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GObjectValueRecord :>
  sig
    include G_OBJECT_VALUE_RECORD

    structure PolyML :
      sig
        val PTR : C.notnull C.p PolyMLFFI.conversion
        val OPTPTR : unit C.p PolyMLFFI.conversion
        structure Array :
          sig
            val PTR : C.notnull C.Array.array_p PolyMLFFI.conversion
          end
      end
  end =
  struct
    type notnull = CPointer.notnull
    type 'a p = 'a CPointer.p

    val PTR = CPointer.PolyML.cVal : notnull p PolyMLFFI.conversion
    val OPTPTR = CPointer.PolyML.cOptVal : unit p PolyMLFFI.conversion

    local
      open PolyMLFFI
    in
      val new_ =
        call
          (load_sym libgiraffegobject "giraffe_g_value_new")
          (FFI.PolyML.VOID --> PTR)

      val copy_ =
        call
          (load_sym libgiraffegobject "giraffe_g_value_copy")
          (PTR --> PTR)

      val free_ =
        call
          (load_sym libgiraffegobject "giraffe_g_value_free")
          (PTR --> FFI.PolyML.VOID)

      val size_ =
        call
          (load_sym libgiraffegobject "giraffe_g_value_size")
          (FFI.PolyML.VOID --> FFI.UInt.PolyML.VAL)
    end

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

        (* `size_` must be called at run-time because we cannot refer to
         * library names for portability.  Therefore `size` is a ref that is
         * initialized at start-up *)
        val size = ref 0w0
        fun initSize () = size := Word.fromLargeInt (FFI.UInt.C.fromVal (size_ ()))
        val () = PolyML.onEntry initSize

        structure Array =
          struct
            type 'a array_p = 'a p
            fun sub p w = Pointer.add (p, w * ! size)
          end
      end

    structure PolyML =
      struct
        val PTR = PTR
        val OPTPTR = OPTPTR
        structure Array =
          struct
            val PTR = PTR
          end
      end
  end
