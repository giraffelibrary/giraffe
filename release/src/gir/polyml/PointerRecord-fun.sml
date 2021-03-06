(* Copyright (C) 2017-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor PointerRecord(val name : string) :> RECORD =
  struct
    structure Pointer = CPointer(GMemory)
    type opt = Pointer.opt
    type non_opt = Pointer.non_opt
    type 'a p = 'a Pointer.p

    type t = non_opt p

    structure C =
      struct
        structure Pointer = Pointer
        type opt = Pointer.opt
        type non_opt = Pointer.non_opt
        type 'a p = 'a Pointer.p

        type 'a from_p = 'a

        structure PointerType =
          struct
            structure Pointer = Pointer
            type opt = Pointer.opt
            type non_opt = Pointer.non_opt
            type 'a p = 'a Pointer.p

            type t = non_opt p

            type 'a from_p = 'a from_p

            fun dup _ = Fn.id

            fun free _ = ignore

            val toC = Fn.id  (* giveDupPtr Fn.id t *)

            val fromC = Fn.id  (* takePtr (dup_ p) *)
          end

        fun takePtr p = p

        fun withPtr f p = f p

        fun giveDupPtr f p = f p

        val touchPtr = ignore
      end

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

        val touchPtr = ignore

        val touchOptPtr = ignore
      end

    structure PolyML =
      struct
        val cPtr = C.Pointer.PolyML.cVal
        val cOptPtr = C.Pointer.PolyML.cOptVal
        val cOutRef = C.Pointer.PolyML.cRef
        val cOutOptRef = C.Pointer.PolyML.cOptOutRef
        val cInOutRef = C.Pointer.PolyML.cInRef
        val cInOutOptRef = C.Pointer.PolyML.cOptOutRef
      end
  end
