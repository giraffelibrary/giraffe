structure GObjectClosureRecord :>
  sig
    include G_OBJECT_CLOSURE_RECORD
      where type ('a, 'b) value_accessor = ('a, 'b) GObjectValue.accessor
  end =
  struct
    type notnull = CPointer.notnull
    type 'a p = 'a CPointer.t

    val take_ =
      if GiraffeDebug.isEnabled
      then _import "giraffe_debug_closure_take" : notnull p -> unit;
      else ignore

    val ref_ = _import "g_closure_ref" : notnull p -> notnull p;

    val sink_ = _import "g_closure_sink" : notnull p -> unit;

    val refSink_ =
      if GiraffeDebug.isEnabled
      then _import "giraffe_debug_closure_ref_sink" : notnull p -> notnull p;
      else fn ptr => ref_ ptr before sink_ ptr  (* must do ref before sink *)

    val unref_ =
      if GiraffeDebug.isEnabled
      then _import "giraffe_debug_g_closure_unref" : notnull p -> unit;
      else _import "g_closure_unref" : notnull p -> unit;

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

        fun fromPtr transfer ptr =
          let
            val object =
              Finalizable.new (
                if transfer
                then (take_ ptr; ptr)  (* take the existing reference *)
                else refSink_ ptr
              )
          in
            Finalizable.addFinalizer (object, unref_);
            object
          end

        fun fromOptPtr transfer optptr =
          Option.map (fromPtr transfer) (Pointer.toOpt optptr)
      end

    val getType_ = _import "g_closure_get_type" : unit -> GObjectType.C.val_;

    val getValue_ = _import "g_value_get_boxed" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.notnull C.p;

    val getOptValue_ = _import "g_value_get_boxed" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> unit C.p;

    val setValue_ =
      fn x1 & x2 =>
        (_import "g_value_set_boxed" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.notnull C.p -> unit;)
        (x1, x2)

    val setOptValue_ =
      fn x1 & x2 =>
        (_import "g_value_set_boxed" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * unit C.p -> unit;)
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