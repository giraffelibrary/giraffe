structure GtkSourceMapClass :>
  GTK_SOURCE_MAP_CLASS
    where type 'a view_class = 'a GtkSourceViewClass.class
    where type C.opt = GtkSourceViewClass.C.opt
    where type C.non_opt = GtkSourceViewClass.C.non_opt
    where type 'a C.p = 'a GtkSourceViewClass.C.p =
  struct
    type 'a view_class = 'a GtkSourceViewClass.class
    open GtkSourceViewClass
    type 'a map = unit
    type 'a class = 'a map class
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_source_map_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
