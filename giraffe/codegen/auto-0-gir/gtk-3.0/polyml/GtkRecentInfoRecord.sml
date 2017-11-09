structure GtkRecentInfoRecord :> GTK_RECENT_INFO_RECORD =
  struct
    structure Pointer = CPointerInternal
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p
    val cPtr = Pointer.PolyML.cVal
    local
      open PolyMLFFI
    in
      val dup_ = call (getSymbol "gtk_recent_info_ref") (cPtr --> cPtr)
      val free_ = call (getSymbol "gtk_recent_info_unref") (cPtr --> cVoid)
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
      val getType_ = call (getSymbol "gtk_recent_info_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_boxed") (GObjectValueRecord.PolyML.cPtr --> PolyML.cPtr)
      val getOptValue_ = call (getSymbol "g_value_get_boxed") (GObjectValueRecord.PolyML.cPtr --> PolyML.cOptPtr)
      val setValue_ = call (getSymbol "g_value_set_boxed") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cPtr --> cVoid)
      val setOptValue_ = call (getSymbol "g_value_set_boxed") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cOptPtr --> cVoid)
    end
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
