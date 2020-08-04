structure GtkHSeparatorClass :>
  GTK_H_SEPARATOR_CLASS
    where type 'a separator_class = 'a GtkSeparatorClass.class
    where type C.opt = GtkSeparatorClass.C.opt
    where type C.non_opt = GtkSeparatorClass.C.non_opt
    where type 'a C.p = 'a GtkSeparatorClass.C.p =
  struct
    type 'a separator_class = 'a GtkSeparatorClass.class
    open GtkSeparatorClass
    type 'a h_separator = unit
    type 'a class = 'a h_separator class
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_hseparator_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
