structure GObjectValueRecord :>
  sig
    include G_OBJECT_VALUE_RECORD

    structure PolyML :
      sig
        val PTR : C.notnull C.p CInterface.Conversion
        val OPTPTR : unit C.p CInterface.Conversion
        structure Array :
          sig
            val PTR : C.notnull C.Array.p CInterface.Conversion
          end
      end
  end =
  struct
    type notnull = CPointer.notnull
    type 'a p = 'a CPointer.t
    val PTR = CPointer.PolyML.POINTER : notnull p CInterface.Conversion
    val OPTPTR = CPointer.PolyML.POINTER : unit p CInterface.Conversion

    local
      open PolyMLFFI
    in
      val new_ =
        call
          (load_sym libgiraffegobject "giraffe_g_value_new")
          (FFI.PolyML.VOID --> PTR);

      val copy_ =
        call
          (load_sym libgiraffegobject "giraffe_g_value_copy")
          (PTR --> PTR);

      val free_sym = load_sym libgiraffegobject "giraffe_g_value_free";
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

        fun withNewPtr f () =
          let
            val ptr = new_ ()
          in
            ptr & f ptr
          end

        fun fromPtr transfer ptr =
          let
            val object =
              Finalizable.new (
                if transfer
                then ptr  (* take the existing reference *)
                else copy_ ptr
              )
          in
            Finalizable.addFinalizer (object, free_sym);
            object
          end

        fun fromOptPtr transfer optptr =
          Option.map (fromPtr transfer) (Pointer.toOpt optptr)

        structure Array =
          struct
            type 'a p = 'a p
          end
      end

    structure PolyML =
      struct
        val PTR = PTR
        val OPTPTR = OPTPTR
        structure Array =
          struct
            val PTR = PTR
          end
      end
  end
