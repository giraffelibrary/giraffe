structure GLibMatchInfoRecord :>
  sig
    include G_LIB_MATCH_INFO_RECORD

    structure PolyML :
      sig
        val PTR : C.notnull C.p PolyMLFFI.conversion
        val OPTPTR : unit C.p PolyMLFFI.conversion
        val OUTREF : (unit, C.notnull) C.r PolyMLFFI.conversion
        val INOUTREF : (C.notnull, C.notnull) C.r PolyMLFFI.conversion
      end
  end =
  struct
    type notnull = CPointer.notnull

    type 'a p = 'a CPointer.t
    val PTR = CPointer.PolyML.POINTER : notnull p PolyMLFFI.conversion
    val OPTPTR = CPointer.PolyML.POINTER : unit p PolyMLFFI.conversion

    type ('a, 'b) r = CPointer.PolyML.ref_
    val REF = CPointer.PolyML.cRef : ('a, 'b) r PolyMLFFI.conversion

    local
      open PolyMLFFI
    in
      val ref_ =
        call
          (load_sym libglib "g_match_info_ref")
          (PTR --> PTR)

      val unref_ =
        call
          (load_sym libglib "g_match_info_unref")
          (PTR --> FFI.PolyML.VOID)
    end

    type t = notnull p Finalizable.t

    structure C =
      struct
        structure Pointer = CPointer
        type notnull = notnull
        type 'a p = 'a p

        fun withPtr f x = Finalizable.withValue (x, f)

        fun withOptPtr f =
          fn
            SOME ptr => withPtr (f o Pointer.toOptNull) ptr
          | NONE     => f Pointer.null


        type ('a, 'b) r = ('a, 'b) r

        fun withRefPtr f = withPtr (Pointer.PolyML.withRef f)

        fun withRefOptPtr f = withOptPtr (Pointer.PolyML.withRef f)


        fun fromPtr transfer ptr =
          let
            val object =
              Finalizable.new (
                if transfer
                then ptr  (* take the existing reference *)
                else ref_ ptr
              )
          in
            Finalizable.addFinalizer (object, unref_);
            object
          end

        fun fromOptPtr transfer optptr =
          Option.map (fromPtr transfer) (Pointer.toOpt optptr)
      end

    structure PolyML =
      struct
        val PTR = PTR
        val OPTPTR = OPTPTR
        val OUTREF = REF
        val INOUTREF = REF
      end
  end
