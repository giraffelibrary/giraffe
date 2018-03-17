structure GtkSpinButtonAccessibleClass :>
  GTK_SPIN_BUTTON_ACCESSIBLE_CLASS
    where type 'a entry_accessible_class = 'a GtkEntryAccessibleClass.class
    where type C.notnull = GtkEntryAccessibleClass.C.notnull
    where type 'a C.p = 'a GtkEntryAccessibleClass.C.p =
  struct
    type 'a entry_accessible_class = 'a GtkEntryAccessibleClass.class
    open GtkEntryAccessibleClass
    type 'a spin_button_accessible = unit
    type 'a class = 'a spin_button_accessible class
    val getType_ = _import "gtk_spin_button_accessible_get_type" : unit -> GObjectType.FFI.val_;
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
