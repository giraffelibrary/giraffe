structure GtkRecentFilterInfoRecord :>
  sig
    include GTK_RECENT_FILTER_INFO_RECORD

    structure PolyML :
      sig
        val PTR : C.notnull C.p PolyMLFFI.conversion
        val OPTPTR : unit C.p PolyMLFFI.conversion
      end
  end =
  struct
    type notnull = CPointer.notnull
    type 'a p = 'a CPointer.t
    val PTR = CPointer.PolyML.POINTER : notnull p PolyMLFFI.conversion
    val OPTPTR = CPointer.PolyML.POINTER : unit p PolyMLFFI.conversion

    local
      open PolyMLFFI
    in
      val new_ =
        call
          (load_sym libgiraffegtk "giraffe_gtk_recent_filter_info_new")
          (FFI.PolyML.VOID --> PTR)

      val copy_ =
        call
          (load_sym libgiraffegtk "giraffe_gtk_recent_filter_info_copy")
          (PTR --> PTR)

      val free_ =
        call
          (load_sym libgiraffegtk "giraffe_gtk_recent_filter_info_free")
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
            Finalizable.addFinalizer (object, free_);
            object
          end

        fun fromOptPtr transfer optptr =
          Option.map (fromPtr transfer) (Pointer.toOpt optptr)
      end

    structure PolyML =
      struct
        val PTR = PTR
        val OPTPTR = OPTPTR
      end
  end
