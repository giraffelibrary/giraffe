structure GIRepositoryBaseInfoClass :> G_I_REPOSITORY_BASE_INFO_CLASS =
  struct
    structure Pointer = CPointer(GMemory)
    type opt = Pointer.opt
    type non_opt = Pointer.non_opt
    type 'a p = 'a Pointer.p
    type ('a, 'b) r = ('a, 'b) Pointer.r

    val cPtr = Pointer.PolyML.cVal : non_opt p PolyMLFFI.conversion
    val cOptPtr = Pointer.PolyML.cOptVal : opt p PolyMLFFI.conversion
    val cOutRef = Pointer.PolyML.cRef : ('a, non_opt) r PolyMLFFI.conversion
    val cOutOptRef = Pointer.PolyML.cOptOutRef : ('a, opt) r PolyMLFFI.conversion
    val cInOutRef = Pointer.PolyML.cInRef : (non_opt, non_opt) r PolyMLFFI.conversion
    val cInOutOptRef = Pointer.PolyML.cOptOutRef : (opt, opt) r PolyMLFFI.conversion

    local
      open PolyMLFFI
    in
      val take_ = ignore

      val ref_ =
        call
          (getSymbol "g_base_info_ref")
          (cPtr --> cPtr);

      val unref_ =
        call
          (getSymbol "g_base_info_unref")
          (cPtr --> cVoid)
    end

    structure C =
      struct
        structure Pointer = Pointer
        type opt = Pointer.opt
        type non_opt = Pointer.non_opt
        type 'a p = 'a Pointer.p
        type ('a, 'b) r = ('a, 'b) Pointer.r

        structure PointerType =
          struct
            structure Pointer = Pointer
            type opt = Pointer.opt
            type non_opt = Pointer.non_opt
            type 'a p = 'a Pointer.p

            type t = non_opt p Finalizable.t

            fun dup d = if d <> 0 then ref_ else Fn.id

            fun free d = if d <> 0 then unref_ else ignore

            fun toC p = (* FFI.withPtr (dup ~1) p *)
              Finalizable.withValue (p, Pointer.withVal ref_)

            fun fromC p = (* FFI.fromPtr false p *)
              let
                val object = Finalizable.new (ref_ p)
              in
                Finalizable.addFinalizer (object, unref_);
                object
              end
          end
      end

    type 'a class = non_opt p Finalizable.t
    type t = base class
    fun toBase obj = obj

    structure FFI =
      struct
        structure Pointer = C.Pointer
        type opt = Pointer.opt
        type non_opt = Pointer.non_opt
        type 'a p = 'a Pointer.p
        type ('a, 'b) r = ('a, 'b) Pointer.r

        local
          fun withPointer f = Pointer.withVal f

          fun withOptPointer f = Pointer.withOptVal f

          fun withDupPointer free f p =
            withPointer f p handle e => (free p; raise e)

          fun withDupOptPointer free f optptr =
            withOptPointer f optptr
              handle e => (Option.app free optptr; raise e)
        in
          fun withPtr f ptr =
            Finalizable.withValue (ptr, withPointer f)

          fun withDupPtr f ptr =
            Finalizable.withValue (ptr, withDupPointer unref_ f o ref_)

          fun withOptPtr f =
            fn
              SOME ptr => Finalizable.withValue (ptr, withOptPointer f o SOME)
            | NONE     => withOptPointer f NONE

          fun withDupOptPtr f =
            fn
              SOME ptr => Finalizable.withValue (ptr, withDupOptPointer unref_ f o SOME o ref_)
            | NONE     => withDupOptPointer ignore f NONE
        end

        local
          fun withRefPointer f = Pointer.withRefVal f

          fun withRefOptPointer f = Pointer.withRefOptVal f

          fun withRefDupPointer free f p =
            withRefPointer f p handle e => (free p; raise e)

          fun withRefDupOptPointer free f optptr =
            withRefOptPointer f optptr
              handle e => (Option.app free optptr; raise e)
        in
          fun withRefPtr f ptr =
            Finalizable.withValue (ptr, withRefPointer f)

          fun withRefDupPtr f ptr =
            Finalizable.withValue (ptr, withRefDupPointer unref_ f o ref_)

          fun withRefOptPtr f =
            fn
              SOME ptr => Finalizable.withValue (ptr, withRefOptPointer f o SOME)
            | NONE     => withRefOptPointer f NONE

          fun withRefDupOptPtr f =
            fn
              SOME ptr => Finalizable.withValue (ptr, withRefDupOptPointer unref_ f o SOME o ref_)
            | NONE     => withRefDupOptPointer ignore f NONE
        end

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
          Option.map (fromPtr transfer) (Pointer.fromOptVal optptr)
      end

    structure PolyML =
      struct
        val cPtr = cPtr
        val cOptPtr = cOptPtr
        val cOutRef = cOutRef
        val cOutOptRef = cOutOptRef
        val cInOutRef = cInOutRef
        val cInOutOptRef = cInOutOptRef
      end
  end
