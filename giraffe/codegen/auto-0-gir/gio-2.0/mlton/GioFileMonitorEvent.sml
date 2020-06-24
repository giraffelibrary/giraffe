structure GioFileMonitorEvent :> GIO_FILE_MONITOR_EVENT =
  struct
    datatype enum =
      CHANGED
    | CHANGES_DONE_HINT
    | DELETED
    | CREATED
    | ATTRIBUTE_CHANGED
    | PRE_UNMOUNT
    | UNMOUNTED
    | MOVED
    | RENAMED
    | MOVED_IN
    | MOVED_OUT
    structure Enum =
      Enum(
        type enum = enum
        val null = CHANGED
        val toInt =
          fn
            CHANGED => 0
          | CHANGES_DONE_HINT => 1
          | DELETED => 2
          | CREATED => 3
          | ATTRIBUTE_CHANGED => 4
          | PRE_UNMOUNT => 5
          | UNMOUNTED => 6
          | MOVED => 7
          | RENAMED => 8
          | MOVED_IN => 9
          | MOVED_OUT => 10
        exception Value of GInt.t
        val fromInt =
          fn
            0 => CHANGED
          | 1 => CHANGES_DONE_HINT
          | 2 => DELETED
          | 3 => CREATED
          | 4 => ATTRIBUTE_CHANGED
          | 5 => PRE_UNMOUNT
          | 6 => UNMOUNTED
          | 7 => MOVED
          | 8 => RENAMED
          | 9 => MOVED_IN
          | 10 => MOVED_OUT
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "g_file_monitor_event_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
