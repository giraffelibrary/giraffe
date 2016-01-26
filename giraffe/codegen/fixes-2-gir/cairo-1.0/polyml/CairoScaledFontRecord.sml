structure CairoScaledFontRecord :>
  sig
    include CAIRO_SCALED_FONT_RECORD

    structure PolyML :
      sig
        val PTR : C.notnull C.p PolyMLFFI.conversion
        val OPTPTR : unit C.p PolyMLFFI.conversion
      end
  end =
  struct
    type notnull = CPointer.notnull
    type 'a p = 'a CPointer.p

    val PTR = CPointer.PolyML.cVal : notnull p PolyMLFFI.conversion
    val OPTPTR = CPointer.PolyML.cOptVal : unit p PolyMLFFI.conversion

    local
      open PolyMLFFI
    in
      val ref_ =
        call
          (load_sym libcairo "cairo_scaled_font_reference")
          (PTR --> PTR)

      val unref_ =
        call
          (load_sym libcairo "cairo_scaled_font_destroy")
          (PTR --> FFI.PolyML.VOID)
    end

    type t = notnull p Finalizable.t

    structure C =
      struct
        structure Pointer = CPointer
        type notnull = notnull
        type 'a p = 'a p

        fun withPtr f ptr = Finalizable.withValue (ptr, Pointer.withVal f)

        fun withOptPtr f =
          fn
            SOME ptr => Finalizable.withValue (ptr, Pointer.withOptVal f o SOME)
          | NONE     => Pointer.withOptVal f NONE

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
      end
  end
