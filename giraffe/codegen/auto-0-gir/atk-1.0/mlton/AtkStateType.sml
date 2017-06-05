structure AtkStateType :> ATK_STATE_TYPE =
  struct
    datatype enum =
      INVALID
    | ACTIVE
    | ARMED
    | BUSY
    | CHECKED
    | DEFUNCT
    | EDITABLE
    | ENABLED
    | EXPANDABLE
    | EXPANDED
    | FOCUSABLE
    | FOCUSED
    | HORIZONTAL
    | ICONIFIED
    | MODAL
    | MULTI_LINE
    | MULTISELECTABLE
    | OPAQUE
    | PRESSED
    | RESIZABLE
    | SELECTABLE
    | SELECTED
    | SENSITIVE
    | SHOWING
    | SINGLE_LINE
    | STALE
    | TRANSIENT
    | VERTICAL
    | VISIBLE
    | MANAGES_DESCENDANTS
    | INDETERMINATE
    | TRUNCATED
    | REQUIRED
    | INVALID_ENTRY
    | SUPPORTS_AUTOCOMPLETION
    | SELECTABLE_TEXT
    | DEFAULT
    | ANIMATED
    | VISITED
    | LAST_DEFINED
    structure Enum =
      Enum(
        type enum = enum
        val null = INVALID
        val toInt =
          fn
            INVALID => 0
          | ACTIVE => 1
          | ARMED => 2
          | BUSY => 3
          | CHECKED => 4
          | DEFUNCT => 5
          | EDITABLE => 6
          | ENABLED => 7
          | EXPANDABLE => 8
          | EXPANDED => 9
          | FOCUSABLE => 10
          | FOCUSED => 11
          | HORIZONTAL => 12
          | ICONIFIED => 13
          | MODAL => 14
          | MULTI_LINE => 15
          | MULTISELECTABLE => 16
          | OPAQUE => 17
          | PRESSED => 18
          | RESIZABLE => 19
          | SELECTABLE => 20
          | SELECTED => 21
          | SENSITIVE => 22
          | SHOWING => 23
          | SINGLE_LINE => 24
          | STALE => 25
          | TRANSIENT => 26
          | VERTICAL => 27
          | VISIBLE => 28
          | MANAGES_DESCENDANTS => 29
          | INDETERMINATE => 30
          | TRUNCATED => 31
          | REQUIRED => 32
          | INVALID_ENTRY => 33
          | SUPPORTS_AUTOCOMPLETION => 34
          | SELECTABLE_TEXT => 35
          | DEFAULT => 36
          | ANIMATED => 37
          | VISITED => 38
          | LAST_DEFINED => 39
        exception Value of GInt.t
        val fromInt =
          fn
            0 => INVALID
          | 1 => ACTIVE
          | 2 => ARMED
          | 3 => BUSY
          | 4 => CHECKED
          | 5 => DEFUNCT
          | 6 => EDITABLE
          | 7 => ENABLED
          | 8 => EXPANDABLE
          | 9 => EXPANDED
          | 10 => FOCUSABLE
          | 11 => FOCUSED
          | 12 => HORIZONTAL
          | 13 => ICONIFIED
          | 14 => MODAL
          | 15 => MULTI_LINE
          | 16 => MULTISELECTABLE
          | 17 => OPAQUE
          | 18 => PRESSED
          | 19 => RESIZABLE
          | 20 => SELECTABLE
          | 21 => SELECTED
          | 22 => SENSITIVE
          | 23 => SHOWING
          | 24 => SINGLE_LINE
          | 25 => STALE
          | 26 => TRANSIENT
          | 27 => VERTICAL
          | 28 => VISIBLE
          | 29 => MANAGES_DESCENDANTS
          | 30 => INDETERMINATE
          | 31 => TRUNCATED
          | 32 => REQUIRED
          | 33 => INVALID_ENTRY
          | 34 => SUPPORTS_AUTOCOMPLETION
          | 35 => SELECTABLE_TEXT
          | 36 => DEFAULT
          | 37 => ANIMATED
          | 38 => VISITED
          | 39 => LAST_DEFINED
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "atk_state_type_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val forName_ = _import "mlton_atk_state_type_for_name" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> FFI.val_;
    val getName_ = _import "atk_state_type_get_name" : FFI.val_ -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val register_ = _import "mlton_atk_state_type_register" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> FFI.val_;
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun forName name = (Utf8.FFI.withPtr ---> FFI.fromVal) forName_ name
    fun getName type' = (FFI.withVal ---> Utf8.FFI.fromPtr 0) getName_ type'
    fun register name = (Utf8.FFI.withPtr ---> FFI.fromVal) register_ name
  end
