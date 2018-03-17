structure GtkAspectFrameClass :>
  GTK_ASPECT_FRAME_CLASS
    where type 'a frame_class = 'a GtkFrameClass.class
    where type C.notnull = GtkFrameClass.C.notnull
    where type 'a C.p = 'a GtkFrameClass.C.p =
  struct
    type 'a frame_class = 'a GtkFrameClass.class
    open GtkFrameClass
    type 'a aspect_frame = unit
    type 'a class = 'a aspect_frame class
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_aspect_frame_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_object") (GObjectValueRecord.PolyML.cPtr --> PolyML.cPtr)
      val getOptValue_ = call (getSymbol "g_value_get_object") (GObjectValueRecord.PolyML.cPtr --> PolyML.cOptPtr)
      val setValue_ = call (getSymbol "g_value_set_object") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cPtr --> cVoid)
      val setOptValue_ = call (getSymbol "g_value_set_object") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cOptPtr --> cVoid)
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
