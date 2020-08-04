structure GtkScrolledWindowClass :>
  GTK_SCROLLED_WINDOW_CLASS
    where type 'a bin_class = 'a GtkBinClass.class
    where type C.opt = GtkBinClass.C.opt
    where type C.non_opt = GtkBinClass.C.non_opt
    where type 'a C.p = 'a GtkBinClass.C.p =
  struct
    type 'a bin_class = 'a GtkBinClass.class
    open GtkBinClass
    type 'a scrolled_window = unit
    type 'a class = 'a scrolled_window class
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_scrolled_window_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
