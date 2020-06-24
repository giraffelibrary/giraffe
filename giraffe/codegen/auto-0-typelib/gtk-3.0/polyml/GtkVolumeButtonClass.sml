structure GtkVolumeButtonClass :>
  GTK_VOLUME_BUTTON_CLASS
    where type 'a scale_button_class = 'a GtkScaleButtonClass.class
    where type C.opt = GtkScaleButtonClass.C.opt
    where type C.non_opt = GtkScaleButtonClass.C.non_opt
    where type 'a C.p = 'a GtkScaleButtonClass.C.p =
  struct
    type 'a scale_button_class = 'a GtkScaleButtonClass.class
    open GtkScaleButtonClass
    type 'a volume_button = unit
    type 'a class = 'a volume_button class
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_volume_button_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
