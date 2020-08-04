structure GtkLockButtonAccessibleClass :>
  GTK_LOCK_BUTTON_ACCESSIBLE_CLASS
    where type 'a button_accessible_class = 'a GtkButtonAccessibleClass.class
    where type C.opt = GtkButtonAccessibleClass.C.opt
    where type C.non_opt = GtkButtonAccessibleClass.C.non_opt
    where type 'a C.p = 'a GtkButtonAccessibleClass.C.p =
  struct
    type 'a button_accessible_class = 'a GtkButtonAccessibleClass.class
    open GtkButtonAccessibleClass
    type 'a lock_button_accessible = unit
    type 'a class = 'a lock_button_accessible class
    val getType_ = _import "gtk_lock_button_accessible_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_object" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.non_opt FFI.p;
    val getOptValue_ = _import "g_value_get_object" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.opt FFI.p;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_object" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.non_opt FFI.p -> unit;) (x1, x2)
    val setOptValue_ = fn x1 & x2 => (_import "g_value_set_object" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.opt FFI.p -> unit;) (x1, x2)
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
