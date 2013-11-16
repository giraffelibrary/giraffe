structure GObjectParamSpecClass :>
  sig
    include G_OBJECT_PARAM_SPEC_CLASS
      where type ('a, 'b) value_accessor = ('a, 'b) GObjectValue.accessor
  end =
  struct
    type notnull = CPointer.notnull
    type 'a p = 'a CPointer.t

    val refSink_ = _import "g_param_spec_ref_sink" : notnull p -> notnull p;

    val unref_ = _import "g_param_spec_unref" : notnull p -> unit;

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


        type ('a, 'b) r = unit p ref

        fun withRef f x =
          let
            val a = ref (Pointer.toOptNull x)
            val r = f a
          in
            ! (Pointer.MLton.unsafeRefConv a) & r
          end

        fun withRefPtr f = withPtr (withRef f)

        fun withRefOptPtr f = withOptPtr (withRef f)
	

        fun fromPtr transfer ptr =
          let
            val object =
              Finalizable.new (
                if transfer
                then ptr  (* take the existing reference *)
                else refSink_ ptr
              )
          in
            Finalizable.addFinalizer (object, unref_);
            object
          end

        fun fromOptPtr transfer optptr =
          Option.map (fromPtr transfer) (Pointer.toOpt optptr)
      end

    val getType_ =
      _import "giraffe_g_param_get_type" : unit -> GObjectType.C.val_;

    val getValue_ =
      _import "g_value_get_param" :
        GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.notnull C.p;

    val getOptValue_ =
      _import "g_value_get_param" :
        GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> unit C.p;

    val setValue_ =
      fn x1 & x2 =>
        (_import "g_value_set_param" :
           GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.notnull C.p -> unit;)
        (x1, x2)

    val setOptValue_ =
      fn x1 & x2 =>
        (_import "g_value_set_param" :
           GObjectValueRecord.C.notnull GObjectValueRecord.C.p * unit C.p -> unit;)
        (x1, x2)

    type ('a, 'b) value_accessor = ('a, 'b) GObjectValue.accessor

    val t =
      GObjectValue.C.createAccessor {
        getType  = (I ---> GObjectType.C.fromVal) getType_,
        getValue = (I ---> C.fromPtr false) getValue_,
        setValue = (I &&&> C.withPtr ---> I) setValue_
      }

    val tOpt =
      GObjectValue.C.createAccessor {
        getType  = (I ---> GObjectType.C.fromVal) getType_,
        getValue = (I ---> C.fromOptPtr false) getOptValue_,
        setValue = (I &&&> C.withOptPtr ---> I) setOptValue_
      }
  end
