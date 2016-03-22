structure GdkKeymap :>
  GDK_KEYMAP
    where type 'a class = 'a GdkKeymapClass.class
    where type 'a display_class = 'a GdkDisplayClass.class
    where type keymap_key_t = GdkKeymapKeyRecord.t
    where type modifier_type_t = GdkModifierType.t =
  struct
    val getType_ = _import "gdk_keymap_get_type" : unit -> GObjectType.C.val_;
    val getDefault_ = _import "gdk_keymap_get_default" : unit -> GdkKeymapClass.C.notnull GdkKeymapClass.C.p;
    val getForDisplay_ = _import "gdk_keymap_get_for_display" : GdkDisplayClass.C.notnull GdkDisplayClass.C.p -> GdkKeymapClass.C.notnull GdkKeymapClass.C.p;
    val addVirtualModifiers_ = fn x1 & x2 => (_import "gdk_keymap_add_virtual_modifiers" : GdkKeymapClass.C.notnull GdkKeymapClass.C.p * GdkModifierType.C.ref_ -> unit;) (x1, x2)
    val getCapsLockState_ = _import "gdk_keymap_get_caps_lock_state" : GdkKeymapClass.C.notnull GdkKeymapClass.C.p -> FFI.Bool.C.val_;
    val getDirection_ = _import "gdk_keymap_get_direction" : GdkKeymapClass.C.notnull GdkKeymapClass.C.p -> PangoDirection.C.val_;
    val getNumLockState_ = _import "gdk_keymap_get_num_lock_state" : GdkKeymapClass.C.notnull GdkKeymapClass.C.p -> FFI.Bool.C.val_;
    val haveBidiLayouts_ = _import "gdk_keymap_have_bidi_layouts" : GdkKeymapClass.C.notnull GdkKeymapClass.C.p -> FFI.Bool.C.val_;
    val lookupKey_ = fn x1 & x2 => (_import "gdk_keymap_lookup_key" : GdkKeymapClass.C.notnull GdkKeymapClass.C.p * GdkKeymapKeyRecord.C.notnull GdkKeymapKeyRecord.C.p -> FFI.UInt32.C.val_;) (x1, x2)
    val mapVirtualModifiers_ = fn x1 & x2 => (_import "gdk_keymap_map_virtual_modifiers" : GdkKeymapClass.C.notnull GdkKeymapClass.C.p * GdkModifierType.C.ref_ -> FFI.Bool.C.val_;) (x1, x2)
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
              GdkKeymapClass.C.notnull GdkKeymapClass.C.p
               * FFI.UInt32.C.val_
               * GdkModifierType.C.val_
               * FFI.Int32.C.val_
               * FFI.UInt32.C.ref_
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
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
    type 'a class = 'a GdkKeymapClass.class
    type 'a display_class = 'a GdkDisplayClass.class
    type keymap_key_t = GdkKeymapKeyRecord.t
    type modifier_type_t = GdkModifierType.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getDefault () = (I ---> GdkKeymapClass.C.fromPtr false) getDefault_ ()
    fun getForDisplay display = (GdkDisplayClass.C.withPtr ---> GdkKeymapClass.C.fromPtr false) getForDisplay_ display
    fun addVirtualModifiers self =
      let
        val state & () = (GdkKeymapClass.C.withPtr &&&> GdkModifierType.C.withRefVal ---> GdkModifierType.C.fromVal && I) addVirtualModifiers_ (self & GdkModifierType.flags [])
      in
        state
      end
    fun getCapsLockState self = (GdkKeymapClass.C.withPtr ---> FFI.Bool.C.fromVal) getCapsLockState_ self
    fun getDirection self = (GdkKeymapClass.C.withPtr ---> PangoDirection.C.fromVal) getDirection_ self
    fun getNumLockState self = (GdkKeymapClass.C.withPtr ---> FFI.Bool.C.fromVal) getNumLockState_ self
    fun haveBidiLayouts self = (GdkKeymapClass.C.withPtr ---> FFI.Bool.C.fromVal) haveBidiLayouts_ self
    fun lookupKey self key = (GdkKeymapClass.C.withPtr &&&> GdkKeymapKeyRecord.C.withPtr ---> FFI.UInt32.C.fromVal) lookupKey_ (self & key)
    fun mapVirtualModifiers self =
      let
        val state & retVal = (GdkKeymapClass.C.withPtr &&&> GdkModifierType.C.withRefVal ---> GdkModifierType.C.fromVal && FFI.Bool.C.fromVal) mapVirtualModifiers_ (self & GdkModifierType.flags [])
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
            GdkKeymapClass.C.withPtr
             &&&> FFI.UInt32.C.withVal
             &&&> GdkModifierType.C.withVal
             &&&> FFI.Int32.C.withVal
             &&&> FFI.UInt32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             &&&> GdkModifierType.C.withRefVal
             ---> FFI.UInt32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && GdkModifierType.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            translateKeyboardState_
            (
              self
               & hardwareKeycode
               & state
               & group
               & FFI.UInt32.null
               & FFI.Int32.null
               & FFI.Int32.null
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
