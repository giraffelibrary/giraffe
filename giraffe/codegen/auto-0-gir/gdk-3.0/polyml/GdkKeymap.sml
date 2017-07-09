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
      val getType_ = call (getSymbol "gdk_keymap_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getDefault_ = call (getSymbol "gdk_keymap_get_default") (cVoid --> GdkKeymapClass.PolyML.cPtr)
      val getForDisplay_ = call (getSymbol "gdk_keymap_get_for_display") (GdkDisplayClass.PolyML.cPtr --> GdkKeymapClass.PolyML.cPtr)
      val addVirtualModifiers_ = call (getSymbol "gdk_keymap_add_virtual_modifiers") (GdkKeymapClass.PolyML.cPtr &&> GdkModifierType.PolyML.cRef --> cVoid)
      val getCapsLockState_ = call (getSymbol "gdk_keymap_get_caps_lock_state") (GdkKeymapClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getDirection_ = call (getSymbol "gdk_keymap_get_direction") (GdkKeymapClass.PolyML.cPtr --> PangoDirection.PolyML.cVal)
      val getNumLockState_ = call (getSymbol "gdk_keymap_get_num_lock_state") (GdkKeymapClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val haveBidiLayouts_ = call (getSymbol "gdk_keymap_have_bidi_layouts") (GdkKeymapClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val lookupKey_ = call (getSymbol "gdk_keymap_lookup_key") (GdkKeymapClass.PolyML.cPtr &&> GdkKeymapKeyRecord.PolyML.cPtr --> GUInt.PolyML.cVal)
      val mapVirtualModifiers_ = call (getSymbol "gdk_keymap_map_virtual_modifiers") (GdkKeymapClass.PolyML.cPtr &&> GdkModifierType.PolyML.cRef --> GBool.PolyML.cVal)
      val translateKeyboardState_ =
        call (getSymbol "gdk_keymap_translate_keyboard_state")
          (
            GdkKeymapClass.PolyML.cPtr
             &&> GUInt.PolyML.cVal
             &&> GdkModifierType.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GUInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             &&> GdkModifierType.PolyML.cRef
             --> GBool.PolyML.cVal
          )
    end
    type 'a class = 'a GdkKeymapClass.class
    type 'a display_class = 'a GdkDisplayClass.class
    type keymap_key_t = GdkKeymapKeyRecord.t
    type modifier_type_t = GdkModifierType.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getDefault () = (I ---> GdkKeymapClass.FFI.fromPtr false) getDefault_ ()
    fun getForDisplay display = (GdkDisplayClass.FFI.withPtr ---> GdkKeymapClass.FFI.fromPtr false) getForDisplay_ display
    fun addVirtualModifiers self =
      let
        val state & () = (GdkKeymapClass.FFI.withPtr &&&> GdkModifierType.FFI.withRefVal ---> GdkModifierType.FFI.fromVal && I) addVirtualModifiers_ (self & GdkModifierType.flags [])
      in
        state
      end
    fun getCapsLockState self = (GdkKeymapClass.FFI.withPtr ---> GBool.FFI.fromVal) getCapsLockState_ self
    fun getDirection self = (GdkKeymapClass.FFI.withPtr ---> PangoDirection.FFI.fromVal) getDirection_ self
    fun getNumLockState self = (GdkKeymapClass.FFI.withPtr ---> GBool.FFI.fromVal) getNumLockState_ self
    fun haveBidiLayouts self = (GdkKeymapClass.FFI.withPtr ---> GBool.FFI.fromVal) haveBidiLayouts_ self
    fun lookupKey self key = (GdkKeymapClass.FFI.withPtr &&&> GdkKeymapKeyRecord.FFI.withPtr ---> GUInt.FFI.fromVal) lookupKey_ (self & key)
    fun mapVirtualModifiers self =
      let
        val state & retVal = (GdkKeymapClass.FFI.withPtr &&&> GdkModifierType.FFI.withRefVal ---> GdkModifierType.FFI.fromVal && GBool.FFI.fromVal) mapVirtualModifiers_ (self & GdkModifierType.flags [])
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
            GdkKeymapClass.FFI.withPtr
             &&&> GUInt.FFI.withVal
             &&&> GdkModifierType.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> GUInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             &&&> GdkModifierType.FFI.withRefVal
             ---> GUInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && GdkModifierType.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            translateKeyboardState_
            (
              self
               & hardwareKeycode
               & state
               & group
               & GUInt.null
               & GInt.null
               & GInt.null
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
