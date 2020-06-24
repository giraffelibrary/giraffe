structure GtkWidgetAccessibleClass :>
  GTK_WIDGET_ACCESSIBLE_CLASS
    where type 'a accessible_class = 'a GtkAccessibleClass.class
    where type C.opt = GtkAccessibleClass.C.opt
    where type C.non_opt = GtkAccessibleClass.C.non_opt
    where type 'a C.p = 'a GtkAccessibleClass.C.p =
  struct
    type 'a accessible_class = 'a GtkAccessibleClass.class
    open GtkAccessibleClass
    type 'a widget_accessible = unit
    type 'a class = 'a widget_accessible class
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_widget_accessible_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
