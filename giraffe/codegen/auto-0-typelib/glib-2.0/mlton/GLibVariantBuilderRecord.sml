structure GLibVariantBuilderRecord :> G_LIB_VARIANT_BUILDER_RECORD =
  struct
    structure Pointer = CPointerInternal
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p
    val dup_ = _import "g_variant_builder_ref" : notnull p -> notnull p;
    val free_ = _import "g_variant_builder_unref" : notnull p -> unit;
    structure Record =
      BoxedRecord(
        structure Pointer = Pointer
        type notnull = notnull
        type 'a p = 'a p
        val dup_ = dup_
        val take_ = ignore
        val free_ = free_
      )
    open Record
    val getType_ = _import "g_variant_builder_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_boxed" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.notnull FFI.p;
    val getOptValue_ = _import "g_value_get_boxed" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> unit FFI.p;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_boxed" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.notnull FFI.p -> unit;) (x1, x2)
    val setOptValue_ = fn x1 & x2 => (_import "g_value_set_boxed" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * unit FFI.p -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromPtr false) getValue_,
          setValue = (I &&&> FFI.withPtr ---> I) setValue_
        }
    val tOpt =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromOptPtr false) getOptValue_,
          setValue = (I &&&> FFI.withOptPtr ---> I) setOptValue_
        }
  end
