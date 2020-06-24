structure GtkHButtonBoxClass :>
  GTK_H_BUTTON_BOX_CLASS
    where type 'a button_box_class = 'a GtkButtonBoxClass.class
    where type C.opt = GtkButtonBoxClass.C.opt
    where type C.non_opt = GtkButtonBoxClass.C.non_opt
    where type 'a C.p = 'a GtkButtonBoxClass.C.p =
  struct
    type 'a button_box_class = 'a GtkButtonBoxClass.class
    open GtkButtonBoxClass
    type 'a h_button_box = unit
    type 'a class = 'a h_button_box class
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_hbutton_box_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
