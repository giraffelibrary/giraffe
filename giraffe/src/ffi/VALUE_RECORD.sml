signature VALUE_RECORD =
  sig
    type t

    structure C :
      sig
        structure Pointer : C_POINTER
        type notnull = Pointer.notnull
        type 'a p = 'a Pointer.p
        type ('a, 'b) r = ('a, 'b) Pointer.r

        structure ValueType :
          C_VALUE_TYPE
            where type t = t
            where type v = notnull p

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

        val withPtr : (notnull p -> 'a) -> t -> 'a
        val withOptPtr : (unit p -> 'a) -> t option -> 'a

        val withNewPtr : (notnull p -> 'a) -> unit -> (notnull p, 'a) pair

        val withRefPtr : (('a, 'b) r -> 'c) -> t -> ('b p, 'c) pair
        val withRefOptPtr : ((unit, 'a) r -> 'b) -> t option -> ('a p, 'b) pair

        val fromPtr : bool -> notnull p -> t
        val fromOptPtr : bool -> unit p -> t option
      end
  end
