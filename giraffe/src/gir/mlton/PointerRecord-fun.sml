(* Copyright (C) 2017-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor PointerRecord(val name : string) :> RECORD =
  struct
    structure C =
      struct
        structure Pointer = CPointer(GMemory)
        type opt = Pointer.opt
        type non_opt = Pointer.non_opt
        type 'a p = 'a Pointer.p
        type ('a, 'b) r = ('a, 'b) Pointer.r

        structure PointerType =
          struct
            structure Pointer = Pointer
            type opt = Pointer.opt
            type non_opt = Pointer.non_opt
            type 'a p = 'a Pointer.p

            type t = non_opt p

            fun dup _ = Fn.id

            fun free _ = ignore

            val toC = Fn.id  (* FFI.withPtr (dup ~1) *)

            val fromC = Fn.id  (* FFI.fromPtr false *)

            structure CVector =
              struct
                type cvector = non_opt p
                val v = Pointer.null
                val free = free ~1
                val fromPointer = dup ~1
                val toPointer = dup ~1
                val fromVal = toC
                val toVal = fromC
              end
          end
      end

    type t = C.non_opt C.p

    structure FFI =
      struct
        structure Pointer = C.Pointer
        type opt = Pointer.opt
        type non_opt = Pointer.non_opt
        type 'a p = 'a Pointer.p
        type ('a, 'b) r = ('a, 'b) Pointer.r

        fun withPtr transfer =
          if not transfer
          then Pointer.withVal
          else raise Fail ("withPtr cannot transfer ownership of disguised struct (" ^ name ^ ")")

        fun withOptPtr transfer =
          if not transfer
          then Pointer.withOptVal
          else raise Fail ("withOptPtr cannot transfer ownership of disguised struct (" ^ name ^ ")")

        fun withRefPtr transfer =
          if not transfer
          then Pointer.withRefVal
          else raise Fail ("withRefPtr cannot transfer ownership of disguised struct (" ^ name ^ ")")

        fun withRefOptPtr transfer =
          if not transfer
          then Pointer.withRefOptVal
          else raise Fail ("withRefOptPtr cannot transfer ownership of disguised struct (" ^ name ^ ")")

        fun fromPtr transfer =
          if not transfer
          then Pointer.fromVal
          else raise Fail ("fromPtr cannot transfer ownership of disguised struct (" ^ name ^ ")")

        fun fromOptPtr transfer =
          if not transfer
          then Pointer.fromOptVal
          else raise Fail ("fromOptPtr cannot transfer ownership of disguised struct (" ^ name ^ ")")
      end
  end
