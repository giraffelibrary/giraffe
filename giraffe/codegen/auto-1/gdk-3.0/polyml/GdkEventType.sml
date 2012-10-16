structure GdkEventType :>
  sig
    include GDK_EVENT_TYPE
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      NOTHING
    | DELETE
    | DESTROY
    | EXPOSE
    | MOTIONNOTIFY
    | BUTTONPRESS
    | TWOBUTTONPRESS
    | THREEBUTTONPRESS
    | BUTTONRELEASE
    | KEYPRESS
    | KEYRELEASE
    | ENTERNOTIFY
    | LEAVENOTIFY
    | FOCUSCHANGE
    | CONFIGURE
    | MAP
    | UNMAP
    | PROPERTYNOTIFY
    | SELECTIONCLEAR
    | SELECTIONREQUEST
    | SELECTIONNOTIFY
    | PROXIMITYIN
    | PROXIMITYOUT
    | DRAGENTER
    | DRAGLEAVE
    | DRAGMOTION
    | DRAGSTATUS
    | DROPSTART
    | DROPFINISHED
    | CLIENTEVENT
    | VISIBILITYNOTIFY
    | SCROLL
    | WINDOWSTATE
    | SETTING
    | OWNERCHANGE
    | GRABBROKEN
    | DAMAGE
    | EVENTLAST
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            NOTHING => f ~1
          | DELETE => f 0
          | DESTROY => f 1
          | EXPOSE => f 2
          | MOTIONNOTIFY => f 3
          | BUTTONPRESS => f 4
          | TWOBUTTONPRESS => f 5
          | THREEBUTTONPRESS => f 6
          | BUTTONRELEASE => f 7
          | KEYPRESS => f 8
          | KEYRELEASE => f 9
          | ENTERNOTIFY => f 10
          | LEAVENOTIFY => f 11
          | FOCUSCHANGE => f 12
          | CONFIGURE => f 13
          | MAP => f 14
          | UNMAP => f 15
          | PROPERTYNOTIFY => f 16
          | SELECTIONCLEAR => f 17
          | SELECTIONREQUEST => f 18
          | SELECTIONNOTIFY => f 19
          | PROXIMITYIN => f 20
          | PROXIMITYOUT => f 21
          | DRAGENTER => f 22
          | DRAGLEAVE => f 23
          | DRAGMOTION => f 24
          | DRAGSTATUS => f 25
          | DROPSTART => f 26
          | DROPFINISHED => f 27
          | CLIENTEVENT => f 28
          | VISIBILITYNOTIFY => f 29
          | SCROLL => f 31
          | WINDOWSTATE => f 32
          | SETTING => f 33
          | OWNERCHANGE => f 34
          | GRABBROKEN => f 35
          | DAMAGE => f 36
          | EVENTLAST => f 37
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            ~1 => NOTHING
          | 0 => DELETE
          | 1 => DESTROY
          | 2 => EXPOSE
          | 3 => MOTIONNOTIFY
          | 4 => BUTTONPRESS
          | 5 => TWOBUTTONPRESS
          | 6 => THREEBUTTONPRESS
          | 7 => BUTTONRELEASE
          | 8 => KEYPRESS
          | 9 => KEYRELEASE
          | 10 => ENTERNOTIFY
          | 11 => LEAVENOTIFY
          | 12 => FOCUSCHANGE
          | 13 => CONFIGURE
          | 14 => MAP
          | 15 => UNMAP
          | 16 => PROPERTYNOTIFY
          | 17 => SELECTIONCLEAR
          | 18 => SELECTIONREQUEST
          | 19 => SELECTIONNOTIFY
          | 20 => PROXIMITYIN
          | 21 => PROXIMITYOUT
          | 22 => DRAGENTER
          | 23 => DRAGLEAVE
          | 24 => DRAGMOTION
          | 25 => DRAGSTATUS
          | 26 => DROPSTART
          | 27 => DROPFINISHED
          | 28 => CLIENTEVENT
          | 29 => VISIBILITYNOTIFY
          | 31 => SCROLL
          | 32 => WINDOWSTATE
          | 33 => SETTING
          | 34 => OWNERCHANGE
          | 35 => GRABBROKEN
          | 36 => DAMAGE
          | 37 => EVENTLAST
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.PolyML.Enum.VAL
        val REF = FFI.PolyML.Enum.REF
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_event_type_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.PTR --> PolyML.VAL)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.PTR &&> PolyML.VAL --> FFI.PolyML.VOID)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = NOTHING
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
