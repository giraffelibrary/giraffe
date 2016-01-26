structure GLibIOChannelRecord :>
  sig
    include G_LIB_I_O_CHANNEL_RECORD

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
    type 'a p = 'a CPointer.p
    type ('a, 'b) r = ('a, 'b) CPointer.r

    val PTR = CPointer.PolyML.cVal : notnull p PolyMLFFI.conversion
    val OPTPTR = CPointer.PolyML.cOptVal : unit p PolyMLFFI.conversion
    val OUTREF = CPointer.PolyML.cRefOut : (unit, notnull) r PolyMLFFI.conversion
    val INOUTREF = CPointer.PolyML.cRefInOut : (notnull, notnull) r PolyMLFFI.conversion

    local
      open PolyMLFFI
    in
      val ref_ =
        call
          (load_sym libglib "g_io_channel_ref")
          (PTR --> PTR)

      val unref_ =
        call
          (load_sym libglib "g_io_channel_unref")
          (PTR --> FFI.PolyML.VOID)
    end

    type t = notnull p Finalizable.t

    structure C =
      struct
        structure Pointer = CPointer
        type notnull = notnull
        type 'a p = 'a p
        type ('a, 'b) r = ('a, 'b) r

        fun withPtr f ptr = Finalizable.withValue (ptr, Pointer.withVal f)

        fun withOptPtr f =
          fn
            SOME ptr => Finalizable.withValue (ptr, Pointer.withOptVal f o SOME)
          | NONE     => Pointer.withOptVal f NONE

        fun withRefPtr f ptr = Finalizable.withValue (ptr, Pointer.withRefVal f)

        fun withRefOptPtr f =
          fn
            SOME ptr => Finalizable.withValue (ptr, Pointer.withRefOptVal f o SOME)
          | NONE     => Pointer.withRefOptVal f NONE

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
          Option.map (fromPtr transfer) (Pointer.fromOptVal optptr)
      end

    structure PolyML =
      struct
        val PTR = PTR
        val OPTPTR = OPTPTR
        val OUTREF = OUTREF
        val INOUTREF = INOUTREF
      end
  end
