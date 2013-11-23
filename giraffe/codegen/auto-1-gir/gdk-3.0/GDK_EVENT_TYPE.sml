signature GDK_EVENT_TYPE =
  sig
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
    val null : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
    structure C :
      sig
        type val_
        type ref_
        val withVal :
          (val_ -> 'a)
           -> t
           -> 'a
        val withRefVal :
          (ref_ -> 'a)
           -> t
           -> (val_, 'a) pair
        val fromVal : val_ -> t
        exception Value of FFI.Enum.C.val_
      end
  end
