functor PointerRecord (val name : string) :>
  RECORD
    where type C.notnull = CPointer.notnull
    where type 'a C.p = 'a CPointer.p
    where type ('a, 'b) C.r = ('a, 'b) CPointer.r =
  struct
    type t = CPointer.notnull CPointer.p

    structure C =
      struct
        structure Pointer = CPointer
        type notnull = Pointer.notnull
        type 'a p = 'a Pointer.p
        type ('a, 'b) r = ('a, 'b) Pointer.r

        fun withPtr f = Pointer.withVal f

        fun withOptPtr f = Pointer.withOptVal f

        fun withRefPtr f = Pointer.withRefVal f

        fun withRefOptPtr f = Pointer.withRefOptVal f

        fun fromPtr transfer =
          if transfer
          then raise Fail ("cannot transfer ownership for " ^ name)
          else Fn.id

        fun fromOptPtr transfer =
          let
            val from = fromPtr transfer
          in
            fn optptr => Option.map from (Pointer.fromOptVal optptr)
          end
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
