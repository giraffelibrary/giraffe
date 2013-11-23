structure GdkKeymap :>
  GDK_KEYMAP
    where type 'a class_t = 'a GdkKeymapClass.t
    where type 'a displayclass_t = 'a GdkDisplayClass.t
    where type keymapkeyrecord_t = GdkKeymapKeyRecord.t
    where type modifiertype_t = GdkModifierType.t =
  struct
    val getType_ = _import "gdk_keymap_get_type" : unit -> GObjectType.C.val_;
    val getDefault_ = _import "gdk_keymap_get_default" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getForDisplay_ = _import "gdk_keymap_get_for_display" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val addVirtualModifiers_ = fn x1 & x2 => (_import "gdk_keymap_add_virtual_modifiers" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GdkModifierType.C.ref_ -> unit;) (x1, x2)
    val getCapsLockState_ = _import "gdk_keymap_get_caps_lock_state" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getDirection_ = _import "gdk_keymap_get_direction" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> PangoDirection.C.val_;
    val getNumLockState_ = _import "gdk_keymap_get_num_lock_state" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val haveBidiLayouts_ = _import "gdk_keymap_have_bidi_layouts" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val lookupKey_ = fn x1 & x2 => (_import "gdk_keymap_lookup_key" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GdkKeymapKeyRecord.C.notnull GdkKeymapKeyRecord.C.p -> FFI.UInt.C.val_;) (x1, x2)
    val mapVirtualModifiers_ = fn x1 & x2 => (_import "gdk_keymap_map_virtual_modifiers" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GdkModifierType.C.ref_ -> FFI.Bool.C.val_;) (x1, x2)
    val translateKeyboardState_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & x7
         & x8 =>
          (
            _import "gdk_keymap_translate_keyboard_state" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.UInt.C.val_
               * GdkModifierType.C.val_
               * FFI.Int.C.val_
               * FFI.UInt.C.ref_
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
               * GdkModifierType.C.ref_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    type 'a class_t = 'a GdkKeymapClass.t
    type 'a displayclass_t = 'a GdkDisplayClass.t
    type keymapkeyrecord_t = GdkKeymapKeyRecord.t
    type modifiertype_t = GdkModifierType.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getDefault () = (I ---> GdkKeymapClass.C.fromPtr false) getDefault_ ()
    fun getForDisplay display = (GObjectObjectClass.C.withPtr ---> GdkKeymapClass.C.fromPtr false) getForDisplay_ display
    fun addVirtualModifiers self =
      let
        val state & () = (GObjectObjectClass.C.withPtr &&&> GdkModifierType.C.withRefVal ---> GdkModifierType.C.fromVal && I) addVirtualModifiers_ (self & GdkModifierType.flags [])
      in
        state
      end
    fun getCapsLockState self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getCapsLockState_ self
    fun getDirection self = (GObjectObjectClass.C.withPtr ---> PangoDirection.C.fromVal) getDirection_ self
    fun getNumLockState self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getNumLockState_ self
    fun haveBidiLayouts self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) haveBidiLayouts_ self
    fun lookupKey self key = (GObjectObjectClass.C.withPtr &&&> GdkKeymapKeyRecord.C.withPtr ---> FFI.UInt.C.fromVal) lookupKey_ (self & key)
    fun mapVirtualModifiers self =
      let
        val state & retVal = (GObjectObjectClass.C.withPtr &&&> GdkModifierType.C.withRefVal ---> GdkModifierType.C.fromVal && FFI.Bool.C.fromVal) mapVirtualModifiers_ (self & GdkModifierType.flags [])
      in
        if retVal then SOME state else NONE
      end
    fun translateKeyboardState self hardwareKeycode state group =
      let
        val keyval
         & effectiveGroup
         & level
         & consumedModifiers
         & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.UInt.C.withVal
             &&&> GdkModifierType.C.withVal
             &&&> FFI.Int.C.withVal
             &&&> FFI.UInt.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             &&&> GdkModifierType.C.withRefVal
             ---> FFI.UInt.C.fromVal
                   && FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && GdkModifierType.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            translateKeyboardState_
            (
              self
               & hardwareKeycode
               & state
               & group
               & FFI.UInt.null
               & FFI.Int.null
               & FFI.Int.null
               & GdkModifierType.flags []
            )
      in
        if retVal
        then
          SOME
            (
              keyval,
              effectiveGroup,
              level,
              consumedModifiers
            )
        else NONE
      end
    local
      open ClosureMarshal Signal
    in
      fun directionChangedSig f = signal "direction-changed" (void ---> ret_void) f
      fun keysChangedSig f = signal "keys-changed" (void ---> ret_void) f
      fun stateChangedSig f = signal "state-changed" (void ---> ret_void) f
    end
  end
