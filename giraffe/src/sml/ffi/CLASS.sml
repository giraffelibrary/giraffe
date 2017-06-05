signature CLASS =
  sig
    type 'a class
    type t = base class
    val toBase : 'a class -> base class

    structure C :
      sig
        structure Pointer : C_POINTER
        type notnull = Pointer.notnull
        type 'a p = 'a Pointer.p
        type ('a, 'b) r = ('a, 'b) Pointer.r

        structure PointerType :
          C_POINTER_TYPE
            where type t = t
            where type notnull = notnull
            where type 'a p = 'a p
      end

    structure FFI :
      sig
        type notnull = C.notnull
        type 'a p = 'a C.p
        type ('a, 'b) r = ('a, 'b) C.r

        val withPtr : (notnull p -> 'b) -> 'a class -> 'b
        val withOptPtr : (unit p -> 'b) -> 'a class option -> 'b

        val withRefPtr : (('a, 'b) r -> 'c) -> 'd class -> ('b p, 'c) pair
        val withRefOptPtr : ((unit, 'a) r -> 'b) -> 'c class option -> ('a p, 'b) pair

        val fromPtr : bool -> notnull p -> base class
        val fromOptPtr : bool -> unit p -> base class option
      end
  end
