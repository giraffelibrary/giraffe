structure GtkFileChooserNativeClass :>
  GTK_FILE_CHOOSER_NATIVE_CLASS
    where type 'a native_dialog_class = 'a GtkNativeDialogClass.class
    where type C.opt = GtkNativeDialogClass.C.opt
    where type C.non_opt = GtkNativeDialogClass.C.non_opt
    where type 'a C.p = 'a GtkNativeDialogClass.C.p =
  struct
    type 'a native_dialog_class = 'a GtkNativeDialogClass.class
    open GtkNativeDialogClass
    type 'a file_chooser_native = unit
    type 'a class = 'a file_chooser_native class
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_file_chooser_native_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
