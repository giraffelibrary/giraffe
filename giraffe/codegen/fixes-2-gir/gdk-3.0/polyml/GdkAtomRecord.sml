structure GdkAtomRecord :>
  sig
    include GDK_ATOM_RECORD

    structure PolyML :
      sig
        val cPtr : C.notnull C.p PolyMLFFI.conversion
        val cOptPtr : unit C.p PolyMLFFI.conversion
      end
  end =
  struct
    type notnull = CPointer.notnull
    type 'a p = 'a CPointer.p

    val cPtr = CPointer.PolyML.cVal : notnull p PolyMLFFI.conversion
    val cOptPtr = CPointer.PolyML.cOptVal : unit p PolyMLFFI.conversion


    type t = notnull p

    structure C =
      struct
        structure Pointer = CPointer
        type notnull = notnull
        type 'a p = 'a p

        fun withPtr f x = f x

        fun withOptPtr f =
          fn
            SOME ptr => withPtr (f o Pointer.toOptNull) ptr
          | NONE     => f Pointer.null

        fun fromPtr transfer =
          if transfer
          then raise Fail "cannot transfer GdkAtom ownership"
          else I

        fun fromOptPtr transfer =
          let
            val from = fromPtr transfer
          in
            fn optptr => Option.map from (Pointer.toOpt optptr)
          end
      end

    structure PolyML =
      struct
        val cPtr = cPtr
        val cOptPtr = cOptPtr
      end
  end
