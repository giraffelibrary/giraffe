signature UNION =
  sig
    type 'a union
    type t = base union
    val toBase : 'a union -> base union

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

        val withPtr : (notnull p -> 'b) -> 'a union -> 'b
        val withOptPtr : (unit p -> 'b) -> 'a union option -> 'b

        val withRefPtr : (('a, 'b) r -> 'c) -> 'd union -> ('b p, 'c) pair
        val withRefOptPtr : ((unit, 'a) r -> 'b) -> 'c union option -> ('a p, 'b) pair

        val fromPtr : bool -> notnull p -> base union
        val fromOptPtr : bool -> unit p -> base union option
      end
  end
