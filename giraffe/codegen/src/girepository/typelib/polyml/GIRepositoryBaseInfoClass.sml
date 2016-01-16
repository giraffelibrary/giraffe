structure GIRepositoryBaseInfoClass :>
  sig
    include G_I_REPOSITORY_BASE_INFO_CLASS

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
      val take_ = ignore

      val ref_ =
        call
          (load_sym libgirepository "g_base_info_ref")
          (PTR --> PTR);

      val unref_ =
        call
          (load_sym libgirepository "g_base_info_unref")
          (PTR --> FFI.PolyML.VOID)
    end

    type 'a t = notnull p Finalizable.t
    fun toBase obj = obj

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

        fun fromPtr transfer ptr =
          let
            val object =
              Finalizable.new (
                if transfer
                then (take_ ptr; ptr)  (* take the existing reference *)
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
      end
  end
