(* Copyright (C) 2013-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GdkEvent :> GDK_EVENT =
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
      val dup_ =
        call
          (getSymbol "gdk_event_copy")
          (cPtr --> cPtr)

      val free_ =
        call
          (getSymbol "gdk_event_free")
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

    type 'a union = non_opt p Finalizable.t
    type t = base union
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
                then ptr  (* take the existing reference *)
                else dup_ ptr
              )
          in
            Finalizable.addFinalizer (object, free_);
            object
          end

        fun fromOptPtr transfer optptr =
          Option.map (fromPtr transfer) (Pointer.fromOptVal optptr)

        val touchPtr = Finalizable.touch

        fun touchOptPtr t = Option.app touchPtr t
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

    local
      open PolyMLFFI
    in
      val getType_ =
        call
          (getSymbol "gdk_event_get_type")
          (cVoid --> GObject.Type.PolyML.cVal);

      val getValue_ =
        call
          (getSymbol "g_value_get_boxed")
          (GObject.ValueRecord.PolyML.cPtr --> PolyML.cPtr);

      val getOptValue_ =
        call
          (getSymbol "g_value_get_boxed")
          (GObject.ValueRecord.PolyML.cPtr --> PolyML.cOptPtr);

      val setValue_ =
        call
          (getSymbol "g_value_set_boxed")
          (GObject.ValueRecord.PolyML.cPtr &&> PolyML.cPtr --> cVoid);

      val setOptValue_ =
        call
          (getSymbol "g_value_set_boxed")
          (GObject.ValueRecord.PolyML.cPtr &&> PolyML.cOptPtr --> cVoid);
    end

    val t =
      ValueAccessor.C.createAccessor {
        getType  = (I ---> GObject.Type.FFI.fromVal) getType_,
        getValue = (I ---> FFI.fromPtr false) getValue_,
        setValue = (I &&&> FFI.withPtr false ---> I) setValue_
      }

    val tOpt =
      ValueAccessor.C.createAccessor {
        getType  = (I ---> GObject.Type.FFI.fromVal) getType_,
        getValue = (I ---> FFI.fromOptPtr false) getOptValue_,
        setValue = (I &&&> FFI.withOptPtr false ---> I) setOptValue_
      }
  end
