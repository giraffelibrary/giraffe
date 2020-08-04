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

      val dup_ =
        call
          (getSymbol "g_base_info_ref")
          (cPtr --> cPtr);

      val free_ =
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

            fun dup d = if d <> 0 then dup_ else Fn.id

            fun free d = if d <> 0 then free_ else ignore

            fun toC p = (* FFI.withPtr false (dup ~1) p *)
              Finalizable.withValue (p, Pointer.withVal dup_)

            fun fromC p = (* FFI.fromPtr false p *)
              let
                val object = Finalizable.new (dup_ p)
              in
                Finalizable.addFinalizer (object, free_);
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
          fun withPointer free f p =
            Pointer.withVal f p handle e => (free p; raise e)

          fun withOptPointer free f optptr =
            Pointer.withOptVal f optptr
              handle e => (Option.app free optptr; raise e)
        in
          fun withPtr transfer =
            if not transfer
            then
              fn f =>
              fn
                ptr => Finalizable.withValue (ptr, withPointer ignore f)
            else
              fn f =>
              fn
                ptr => Finalizable.withValue (ptr, withPointer free_ f o dup_)

          fun withOptPtr transfer =
            if not transfer
            then
              fn f =>
              fn
                SOME ptr => Finalizable.withValue (ptr, withOptPointer ignore f o SOME)
              | NONE     => withOptPointer ignore f NONE
            else
              fn f =>
              fn
                SOME ptr => Finalizable.withValue (ptr, withOptPointer free_ f o SOME o dup_)
              | NONE     => withOptPointer ignore f NONE
        end

        local
          fun withRefPointer free f p =
            Pointer.withRefVal f p handle e => (free p; raise e)

          fun withRefOptPointer free f optptr =
            Pointer.withRefOptVal f optptr
              handle e => (Option.app free optptr; raise e)
        in
          fun withRefPtr transfer =
            if not transfer
            then
              fn f =>
              fn
                ptr => Finalizable.withValue (ptr, withRefPointer ignore f)
            else
              fn f =>
              fn
                ptr => Finalizable.withValue (ptr, withRefPointer free_ f o dup_)

          fun withRefOptPtr transfer =
            if not transfer
            then
              fn f =>
              fn
                SOME ptr => Finalizable.withValue (ptr, withRefOptPointer ignore f o SOME)
              | NONE     => withRefOptPointer ignore f NONE
            else
              fn f =>
              fn
                SOME ptr => Finalizable.withValue (ptr, withRefOptPointer free_ f o SOME o dup_)
              | NONE     => withRefOptPointer ignore f NONE
        end

        fun fromPtr transfer ptr =
          let
            val object =
              Finalizable.new (
                if transfer
                then (take_ ptr; ptr)  (* take the existing reference *)
                else dup_ ptr
              )
          in
            Finalizable.addFinalizer (object, free_);
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
