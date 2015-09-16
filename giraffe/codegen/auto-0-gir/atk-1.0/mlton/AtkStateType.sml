structure AtkStateType :>
  sig
    include ATK_STATE_TYPE
  end =
  struct
    datatype t =
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
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            INVALID => f 0
          | ACTIVE => f 1
          | ARMED => f 2
          | BUSY => f 3
          | CHECKED => f 4
          | DEFUNCT => f 5
          | EDITABLE => f 6
          | ENABLED => f 7
          | EXPANDABLE => f 8
          | EXPANDED => f 9
          | FOCUSABLE => f 10
          | FOCUSED => f 11
          | HORIZONTAL => f 12
          | ICONIFIED => f 13
          | MODAL => f 14
          | MULTI_LINE => f 15
          | MULTISELECTABLE => f 16
          | OPAQUE => f 17
          | PRESSED => f 18
          | RESIZABLE => f 19
          | SELECTABLE => f 20
          | SELECTED => f 21
          | SENSITIVE => f 22
          | SHOWING => f 23
          | SINGLE_LINE => f 24
          | STALE => f 25
          | TRANSIENT => f 26
          | VERTICAL => f 27
          | VISIBLE => f 28
          | MANAGES_DESCENDANTS => f 29
          | INDETERMINATE => f 30
          | TRUNCATED => f 31
          | REQUIRED => f 32
          | INVALID_ENTRY => f 33
          | SUPPORTS_AUTOCOMPLETION => f 34
          | SELECTABLE_TEXT => f 35
          | DEFAULT => f 36
          | ANIMATED => f 37
          | VISITED => f 38
          | LAST_DEFINED => f 39
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
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
      end
    val getType_ = _import "atk_state_type_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = INVALID
    val forName_ = _import "mlton_atk_state_type_for_name" : cstring * unit CPointer.t -> C.val_;
    val getName_ = _import "atk_state_type_get_name" : C.val_ -> FFI.String.C.notnull FFI.String.C.out_p;
    val register_ = _import "mlton_atk_state_type_register" : cstring * unit CPointer.t -> C.val_;
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun forName name = (FFI.String.C.withConstPtr ---> C.fromVal) forName_ name
    fun getName type' = (C.withVal ---> FFI.String.C.fromPtr false) getName_ type'
    fun register name = (FFI.String.C.withConstPtr ---> C.fromVal) register_ name
  end
