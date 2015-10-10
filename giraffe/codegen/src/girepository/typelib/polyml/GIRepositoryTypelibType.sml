structure GIRepositoryTypelibType :>
  sig
    include G_I_REPOSITORY_TYPELIB_TYPE
    structure PolyML :
      sig
        val PTR : C.notnull C.p CInterface.Conversion
        val OPTPTR : unit C.p CInterface.Conversion
      end
  end =
  struct
    type notnull = CPointer.notnull
    type 'a p = 'a CPointer.t
    val PTR = CPointer.PolyML.POINTER : notnull p CInterface.Conversion
    val OPTPTR = CPointer.PolyML.POINTER : unit p CInterface.Conversion

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
          then raise Fail "cannot transfer GITypelib ownership"
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
        val PTR = PTR
        val OPTPTR = OPTPTR
      end
  end
