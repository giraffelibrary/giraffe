structure GtkHScaleClass :>
  GTK_H_SCALE_CLASS
    where type 'a scale_class = 'a GtkScaleClass.class
    where type C.opt = GtkScaleClass.C.opt
    where type C.non_opt = GtkScaleClass.C.non_opt
    where type 'a C.p = 'a GtkScaleClass.C.p =
  struct
    type 'a scale_class = 'a GtkScaleClass.class
    open GtkScaleClass
    type 'a h_scale = unit
    type 'a class = 'a h_scale class
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_hscale_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
