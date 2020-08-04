structure GtkAccelLabelClass :>
  GTK_ACCEL_LABEL_CLASS
    where type 'a label_class = 'a GtkLabelClass.class
    where type C.opt = GtkLabelClass.C.opt
    where type C.non_opt = GtkLabelClass.C.non_opt
    where type 'a C.p = 'a GtkLabelClass.C.p =
  struct
    type 'a label_class = 'a GtkLabelClass.class
    open GtkLabelClass
    type 'a accel_label = unit
    type 'a class = 'a accel_label class
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_accel_label_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
          setValue = (I &&&> FFI.withPtr false ---> I) setValue_
        }
    val tOpt =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromOptPtr false) getOptValue_,
          setValue = (I &&&> FFI.withOptPtr false ---> I) setOptValue_
        }
  end
