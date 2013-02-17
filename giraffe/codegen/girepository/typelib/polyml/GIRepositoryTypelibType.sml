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
        type notnull = notnull
        type 'a p = 'a p
        val withPtr = I
        fun withOptPtr f = f o CPointer.fromOpt
        val fromPtr = I
        val fromOptPtr = CPointer.toOpt
      end

    structure PolyML =
      struct
        val PTR = PTR
        val OPTPTR = OPTPTR
      end
  end
