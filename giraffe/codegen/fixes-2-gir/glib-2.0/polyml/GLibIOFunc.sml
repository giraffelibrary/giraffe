(* Copyright (C) 2013-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GLibIOFunc :>
  G_LIB_I_O_FUNC
    where type i_o_channel_t = GLibIOChannelRecord.t
    where type i_o_condition_t = GLibIOCondition.t =
  struct
    type i_o_channel_t = GLibIOChannelRecord.t
    type i_o_condition_t = GLibIOCondition.t
    type func = i_o_channel_t * i_o_condition_t -> bool
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

        type callback = (
          (
            GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p,
            GLibIOCondition.FFI.val_
          ) pair
           -> GBool.FFI.val_
        ) PolyMLFFI.closure
        local
          open PolyMLFFI
        in
          val makeClosure =
            closure (
              GLibIOChannelRecord.PolyML.cPtr
               &&> GLibIOCondition.PolyML.cVal
               --> GBool.PolyML.cVal
            )
          val nullClosure = nullClosure
        end
        fun withCallback f callback =
          f (
            makeClosure (
              fn
                (source : GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p)
                 & (condition : GLibIOCondition.FFI.val_)
              =>
                GBool.FFI.withVal I (
                  callback (
                    GLibIOChannelRecord.FFI.fromPtr false source,
                    GLibIOCondition.FFI.fromVal condition
                  )
                )
            )
          )
        fun withOptCallback f optCallback =
          case optCallback of
            SOME callback => withCallback f callback
          | NONE          => f nullClosure

        fun withPtrToDispatch f () =
          f (C.Pointer.PolyML.symbolAsAddress (PolyMLFFI.getSymbol "giraffe_io_dispatch"))
        fun withOptPtrToDispatch f =
          fn
            true  => withPtrToDispatch f ()
          | false => f C.Pointer.null

        fun withPtrToDestroy f () =
          f (C.Pointer.PolyML.symbolAsAddress (PolyMLFFI.getSymbol "giraffe_io_destroy"))
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
