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
    | MULTILINE
    | MULTISELECTABLE
    | OPAQUE
    | PRESSED
    | RESIZABLE
    | SELECTABLE
    | SELECTED
    | SENSITIVE
    | SHOWING
    | SINGLELINE
    | STALE
    | TRANSIENT
    | VERTICAL
    | VISIBLE
    | MANAGESDESCENDANTS
    | INDETERMINATE
    | TRUNCATED
    | REQUIRED
    | INVALIDENTRY
    | SUPPORTSAUTOCOMPLETION
    | SELECTABLETEXT
    | DEFAULT
    | ANIMATED
    | VISITED
    | LASTDEFINED
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
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
          | MULTILINE => f 15
          | MULTISELECTABLE => f 16
          | OPAQUE => f 17
          | PRESSED => f 18
          | RESIZABLE => f 19
          | SELECTABLE => f 20
          | SELECTED => f 21
          | SENSITIVE => f 22
          | SHOWING => f 23
          | SINGLELINE => f 24
          | STALE => f 25
          | TRANSIENT => f 26
          | VERTICAL => f 27
          | VISIBLE => f 28
          | MANAGESDESCENDANTS => f 29
          | INDETERMINATE => f 30
          | TRUNCATED => f 31
          | REQUIRED => f 32
          | INVALIDENTRY => f 33
          | SUPPORTSAUTOCOMPLETION => f 34
          | SELECTABLETEXT => f 35
          | DEFAULT => f 36
          | ANIMATED => f 37
          | VISITED => f 38
          | LASTDEFINED => f 39
        fun withRefVal f = withVal (FFI.Enum.withRef f)
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
          | 15 => MULTILINE
          | 16 => MULTISELECTABLE
          | 17 => OPAQUE
          | 18 => PRESSED
          | 19 => RESIZABLE
          | 20 => SELECTABLE
          | 21 => SELECTED
          | 22 => SENSITIVE
          | 23 => SHOWING
          | 24 => SINGLELINE
          | 25 => STALE
          | 26 => TRANSIENT
          | 27 => VERTICAL
          | 28 => VISIBLE
          | 29 => MANAGESDESCENDANTS
          | 30 => INDETERMINATE
          | 31 => TRUNCATED
          | 32 => REQUIRED
          | 33 => INVALIDENTRY
          | 34 => SUPPORTSAUTOCOMPLETION
          | 35 => SELECTABLETEXT
          | 36 => DEFAULT
          | 37 => ANIMATED
          | 38 => VISITED
          | 39 => LASTDEFINED
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
    val getName_ = _import "atk_state_type_get_name" : C.val_ -> FFI.String.notnull FFI.String.out_p;
    val register_ = _import "mlton_atk_state_type_register" : cstring * unit CPointer.t -> C.val_;
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun forName name = (FFI.String.withConstPtr ---> C.fromVal) forName_ name
    fun getName type' = (C.withVal ---> FFI.String.fromPtr false) getName_ type'
    fun register name = (FFI.String.withConstPtr ---> C.fromVal) register_ name
  end
