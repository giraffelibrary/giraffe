structure GtkTargetEntryRecord :> GTK_TARGET_ENTRY_RECORD =
  struct
    structure Pointer = CPointer(GMemory)
    type opt = Pointer.opt
    type non_opt = Pointer.non_opt
    type 'a p = 'a Pointer.p
    val size_ = _import "giraffe_gtk_target_entry_size" : unit -> GSize.FFI.val_;
    val copy_ = fn x1 & x2 => (_import "giraffe_gtk_target_entry_copy" : non_opt p * non_opt p -> unit;) (x1, x2)
    val clear_ = _import "giraffe_gtk_target_entry_clear" : non_opt p -> unit;
    structure Record =
      BoxedValueRecord(
        structure Pointer = Pointer
        type opt = opt
        type non_opt = non_opt
        type 'a p = 'a p
        val copy_ = copy_
        val clear_ = clear_
        val size_ = size_
      )
    open Record
    val getType_ = _import "gtk_target_entry_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_boxed" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.non_opt FFI.p;
    val getOptValue_ = _import "g_value_get_boxed" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.opt FFI.p;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_boxed" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.non_opt FFI.p -> unit;) (x1, x2)
    val setOptValue_ = fn x1 & x2 => (_import "g_value_set_boxed" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.opt FFI.p -> unit;) (x1, x2)
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
