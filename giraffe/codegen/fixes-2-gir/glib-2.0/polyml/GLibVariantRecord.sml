structure GLibVariantRecord :> G_LIB_VARIANT_RECORD =
  struct
    structure Pointer = CPointerInternal
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p
    val cPtr = Pointer.PolyML.cVal
    local
      open PolyMLFFI
    in
      val dup_ = call (getSymbol "g_variant_ref_sink") (cPtr --> cPtr)
      val free_ = call (getSymbol "g_variant_unref") (cPtr --> PolyMLFFI.cVoid)
    end
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
    local
      open PolyMLFFI
    in
      val getValue_ = call (getSymbol "g_value_get_variant") (GObjectValueRecord.PolyML.cPtr --> PolyML.cPtr)
      val getOptValue_ = call (getSymbol "g_value_get_variant") (GObjectValueRecord.PolyML.cPtr --> PolyML.cOptPtr)
      val setValue_ = call (getSymbol "g_value_set_variant") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cPtr --> PolyMLFFI.cVoid)
      val setOptValue_ = call (getSymbol "g_value_set_variant") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cOptPtr --> PolyMLFFI.cVoid)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = GObject.Type.variant,
          getValue = (I ---> FFI.fromPtr false) getValue_,
          setValue = (I &&&> FFI.withPtr ---> I) setValue_
        }
    val tOpt =
      GObjectValue.C.createAccessor
        {
          getType = GObject.Type.variant,
          getValue = (I ---> FFI.fromOptPtr false) getOptValue_,
          setValue = (I &&&> FFI.withOptPtr ---> I) setOptValue_
        }
  end
