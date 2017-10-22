structure GdkRectangleRecord :> GDK_RECTANGLE_RECORD =
  struct
    structure Pointer = CPointerInternal
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p
    val cPtr = Pointer.PolyML.cVal
    local
      open PolyMLFFI
    in
      val new_ = call (getSymbol "giraffe_gdk_rectangle_new") (cVoid --> cPtr)
      val copy_ = call (getSymbol "giraffe_gdk_rectangle_copy") (cPtr &&> cPtr --> cVoid)
      val free_ = call (getSymbol "giraffe_gdk_rectangle_free") (cPtr --> cVoid)
      val size_ = call (getSymbol "giraffe_gdk_rectangle_size") (cVoid --> GUInt.PolyML.cVal)
    end
    structure Record =
      BoxedValueRecord(
        structure Pointer = Pointer
        type notnull = notnull
        type 'a p = 'a p
        val new_ = new_
        val copy_ = copy_
        val take_ = ignore
        val clear_ = ignore
        val free_ = free_
        val size_ = size_
      )
    open Record
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_rectangle_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
