structure GObjectObjectClass :>
  G_OBJECT_OBJECT_CLASS
    where type ('a, 'b) value_accessor_t = ('a, 'b) ValueAccessor.t =
  struct
    type notnull = CPointer.notnull
    type 'a p = 'a CPointer.p
    type ('a, 'b) r = ('a, 'b) CPointer.r

    val () =
      if GiraffeDebug.isEnabled
      then
        let
          val (_, setDebugClosure) =
            _symbol "giraffe_debug_closure" external :
              (unit -> bool) * (bool -> unit);
          val (_, setDebugRefCount) =
            _symbol "giraffe_debug_ref_count" external :
              (unit -> bool) * (bool -> unit);
        in
          setDebugClosure (GiraffeDebug.getClosure ());
          setDebugRefCount (GiraffeDebug.getRefCount ())
        end
      else ()

    val take_ =
      if GiraffeDebug.isEnabled
      then _import "giraffe_debug_object_take" : notnull p -> unit;
      else ignore

    val ref_ =
      if GiraffeDebug.isEnabled
      then _import "giraffe_debug_g_object_ref_sink" : notnull p -> notnull p;
      else _import "g_object_ref_sink" : notnull p -> notnull p;

    val unref_ =
      if GiraffeDebug.isEnabled
      then _import "giraffe_debug_g_object_unref" : notnull p -> unit;
      else _import "g_object_unref" : notnull p -> unit;

    structure C =
      struct
        structure Pointer = CPointer
        type notnull = notnull
        type 'a p = 'a p
        type ('a, 'b) r = ('a, 'b) Pointer.r

        structure PointerType =
          struct
            structure Pointer = Pointer
            type notnull = Pointer.notnull
            type 'a p = 'a Pointer.p

            type t = notnull p Finalizable.t

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

            structure CVector =
              struct
                type cvector = notnull p
                val v = let open Pointer in toNotNull (sub (null, 0w1)) end
                val free = free ~1
                val fromPointer = dup ~1
                val toPointer = dup ~1
                val fromVal = toC
                val toVal = fromC
              end
          end
      end

    type 'a class = notnull p Finalizable.t
    type t = base class
    fun toBase obj = obj

    structure FFI =
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

    val getType_ =
      _import "g_object_get_type" : unit -> GObjectType.FFI.val_;

    val getValue_ =
      _import "g_value_get_object" :
        GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.notnull FFI.p;

    val getOptValue_ =
      _import "g_value_get_object" :
        GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> unit FFI.p;

    val setValue_ =
      fn x1 & x2 =>
        (_import "g_value_set_object" :
           GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.notnull FFI.p -> unit;)
        (x1, x2)

    val setOptValue_ =
      fn x1 & x2 =>
        (_import "g_value_set_object" :
           GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * unit FFI.p -> unit;)
        (x1, x2)

    type ('a, 'b) value_accessor_t = ('a, 'b) ValueAccessor.t

    val t =
      ValueAccessor.C.createAccessor {
        getType  = (I ---> GObjectType.FFI.fromVal) getType_,
        getValue = (I ---> FFI.fromPtr false) getValue_,
        setValue = (I &&&> FFI.withPtr ---> I) setValue_
      }

    val tOpt =
      ValueAccessor.C.createAccessor {
        getType  = (I ---> GObjectType.FFI.fromVal) getType_,
        getValue = (I ---> FFI.fromOptPtr false) getOptValue_,
        setValue = (I &&&> FFI.withOptPtr ---> I) setOptValue_
      }
  end
