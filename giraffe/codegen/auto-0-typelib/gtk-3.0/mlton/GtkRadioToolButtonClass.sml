structure GtkRadioToolButtonClass :>
  GTK_RADIO_TOOL_BUTTON_CLASS
    where type 'a toggle_tool_button_class = 'a GtkToggleToolButtonClass.class
    where type C.notnull = GtkToggleToolButtonClass.C.notnull
    where type 'a C.p = 'a GtkToggleToolButtonClass.C.p =
  struct
    type 'a toggle_tool_button_class = 'a GtkToggleToolButtonClass.class
    open GtkToggleToolButtonClass
    type 'a radio_tool_button = unit
    type 'a class = 'a radio_tool_button class
    val getType_ = _import "gtk_radio_tool_button_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_object" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.notnull FFI.p;
    val getOptValue_ = _import "g_value_get_object" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> unit FFI.p;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_object" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.notnull FFI.p -> unit;) (x1, x2)
    val setOptValue_ = fn x1 & x2 => (_import "g_value_set_object" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * unit FFI.p -> unit;) (x1, x2)
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
