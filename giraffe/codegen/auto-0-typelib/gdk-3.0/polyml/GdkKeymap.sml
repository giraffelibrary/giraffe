structure GdkKeymap :>
  GDK_KEYMAP
    where type 'a class = 'a GdkKeymapClass.class
    where type 'a display_class = 'a GdkDisplayClass.class
    where type keymap_key_t = GdkKeymapKeyRecord.t
    where type modifier_type_t = GdkModifierType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_keymap_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getDefault_ = call (load_sym libgdk "gdk_keymap_get_default") (PolyMLFFI.cVoid --> GdkKeymapClass.PolyML.cPtr)
      val getForDisplay_ = call (load_sym libgdk "gdk_keymap_get_for_display") (GdkDisplayClass.PolyML.cPtr --> GdkKeymapClass.PolyML.cPtr)
      val addVirtualModifiers_ = call (load_sym libgdk "gdk_keymap_add_virtual_modifiers") (GdkKeymapClass.PolyML.cPtr &&> GdkModifierType.PolyML.cRef --> PolyMLFFI.cVoid)
      val getCapsLockState_ = call (load_sym libgdk "gdk_keymap_get_caps_lock_state") (GdkKeymapClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getDirection_ = call (load_sym libgdk "gdk_keymap_get_direction") (GdkKeymapClass.PolyML.cPtr --> PangoDirection.PolyML.cVal)
      val getNumLockState_ = call (load_sym libgdk "gdk_keymap_get_num_lock_state") (GdkKeymapClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val haveBidiLayouts_ = call (load_sym libgdk "gdk_keymap_have_bidi_layouts") (GdkKeymapClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val lookupKey_ = call (load_sym libgdk "gdk_keymap_lookup_key") (GdkKeymapClass.PolyML.cPtr &&> GdkKeymapKeyRecord.PolyML.cPtr --> FFI.UInt32.PolyML.cVal)
      val mapVirtualModifiers_ = call (load_sym libgdk "gdk_keymap_map_virtual_modifiers") (GdkKeymapClass.PolyML.cPtr &&> GdkModifierType.PolyML.cRef --> FFI.Bool.PolyML.cVal)
      val translateKeyboardState_ =
        call (load_sym libgdk "gdk_keymap_translate_keyboard_state")
          (
            GdkKeymapClass.PolyML.cPtr
             &&> FFI.UInt32.PolyML.cVal
             &&> GdkModifierType.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.UInt32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             &&> GdkModifierType.PolyML.cRef
             --> FFI.Bool.PolyML.cVal
          )
    end
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
