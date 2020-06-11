(* Copyright (C) 2013, 2016-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GLibSourceFunc :> G_LIB_SOURCE_FUNC =
  struct
    type func = unit -> bool
    type t = func

    structure C =
      struct
        structure Pointer = CPointer(GMemory)
        type opt = Pointer.opt
        type non_opt = Pointer.non_opt
        type 'a p = 'a Pointer.p
      end

    structure FFI =
      struct
        type opt = C.opt
        type non_opt = C.non_opt
        type 'a p = 'a C.p

        type callback = (unit -> GBool.FFI.val_) PolyMLFFI.closure
        local
          open PolyMLFFI
        in
          val makeClosure = closure (cVoid --> GBool.PolyML.cVal)
          val nullClosure = nullClosure
        end
        fun withCallback f callback =
          f (makeClosure (fn () => GBool.FFI.withVal I (callback ())))
        fun withOptCallback f optCallback =
          case optCallback of
            SOME callback => withCallback f callback
          | NONE          => f nullClosure

        fun withPtrToDispatch f () =
          f (C.Pointer.PolyML.symbolAsAddress (PolyMLFFI.getSymbol "giraffe_source_dispatch"))
        fun withOptPtrToDispatch f =
          fn
            true  => withPtrToDispatch f ()
          | false => f C.Pointer.null

        fun withPtrToDestroy f () =
          f (C.Pointer.PolyML.symbolAsAddress (PolyMLFFI.getSymbol "giraffe_source_destroy"))
        fun withOptPtrToDestroy f =
          fn
            true  => withPtrToDestroy f ()
          | false => f C.Pointer.null
      end

    structure PolyML =
      struct
        val cPtr = C.Pointer.PolyML.cVal
        val cOptPtr = C.Pointer.PolyML.cOptVal
        val cFunction = PolyMLFFI.cFunction
      end
  end
