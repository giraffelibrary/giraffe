structure GtkIMContextSimpleClass :>
  GTK_I_M_CONTEXT_SIMPLE_CLASS
    where type 'a i_m_context_class = 'a GtkIMContextClass.class
    where type C.opt = GtkIMContextClass.C.opt
    where type C.non_opt = GtkIMContextClass.C.non_opt
    where type 'a C.p = 'a GtkIMContextClass.C.p =
  struct
    type 'a i_m_context_class = 'a GtkIMContextClass.class
    open GtkIMContextClass
    type 'a i_m_context_simple = unit
    type 'a class = 'a i_m_context_simple class
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_im_context_simple_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
