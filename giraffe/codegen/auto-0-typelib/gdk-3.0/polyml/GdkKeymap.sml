structure GdkKeymap :>
  GDK_KEYMAP
    where type 'a class = 'a GdkKeymapClass.class
    where type 'a display_class = 'a GdkDisplayClass.class
    where type keymap_key_record_c_array_n_t = GdkKeymapKeyRecordCArrayN.t
    where type modifier_intent_t = GdkModifierIntent.t
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
      val getEntriesForKeycode_ =
        call (getSymbol "gdk_keymap_get_entries_for_keycode")
          (
            GdkKeymapClass.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             &&> GdkKeymapKeyRecordCArrayN.PolyML.cOutRef
             &&> GUInt32CArrayN.PolyML.cOutRef
             &&> GInt32.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val getEntriesForKeyval_ =
        call (getSymbol "gdk_keymap_get_entries_for_keyval")
          (
            GdkKeymapClass.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             &&> GdkKeymapKeyRecordCArrayN.PolyML.cOutRef
             &&> GInt32.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val getModifierMask_ = call (getSymbol "gdk_keymap_get_modifier_mask") (GdkKeymapClass.PolyML.cPtr &&> GdkModifierIntent.PolyML.cVal --> GdkModifierType.PolyML.cVal)
      val getModifierState_ = call (getSymbol "gdk_keymap_get_modifier_state") (GdkKeymapClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getNumLockState_ = call (getSymbol "gdk_keymap_get_num_lock_state") (GdkKeymapClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getScrollLockState_ = call (getSymbol "gdk_keymap_get_scroll_lock_state") (GdkKeymapClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val haveBidiLayouts_ = call (getSymbol "gdk_keymap_have_bidi_layouts") (GdkKeymapClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val lookupKey_ = call (getSymbol "gdk_keymap_lookup_key") (GdkKeymapClass.PolyML.cPtr &&> GdkKeymapKeyRecord.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val mapVirtualModifiers_ = call (getSymbol "gdk_keymap_map_virtual_modifiers") (GdkKeymapClass.PolyML.cPtr &&> GdkModifierType.PolyML.cRef --> GBool.PolyML.cVal)
      val translateKeyboardState_ =
        call (getSymbol "gdk_keymap_translate_keyboard_state")
          (
            GdkKeymapClass.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             &&> GdkModifierType.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GUInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             &&> GdkModifierType.PolyML.cRef
             --> GBool.PolyML.cVal
          )
    end
    type 'a class = 'a GdkKeymapClass.class
    type 'a display_class = 'a GdkDisplayClass.class
    type keymap_key_record_c_array_n_t = GdkKeymapKeyRecordCArrayN.t
    type modifier_intent_t = GdkModifierIntent.t
    type keymap_key_t = GdkKeymapKeyRecord.t
    type modifier_type_t = GdkModifierType.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getDefault () = (I ---> GdkKeymapClass.FFI.fromPtr false) getDefault_ ()
    fun getForDisplay display = (GdkDisplayClass.FFI.withPtr false ---> GdkKeymapClass.FFI.fromPtr false) getForDisplay_ display before GdkDisplayClass.FFI.touchPtr display
    fun addVirtualModifiers self state =
      let
        val state & () = (GdkKeymapClass.FFI.withPtr false &&&> GdkModifierType.FFI.withRefVal ---> GdkModifierType.FFI.fromVal && I) addVirtualModifiers_ (self & state)
      in
        state
      end
    fun getCapsLockState self = (GdkKeymapClass.FFI.withPtr false ---> GBool.FFI.fromVal) getCapsLockState_ self
    fun getDirection self = (GdkKeymapClass.FFI.withPtr false ---> PangoDirection.FFI.fromVal) getDirection_ self
    fun getEntriesForKeycode self hardwareKeycode =
      let
        val keys
         & keyvals
         & nEntries
         & retVal =
          (
            GdkKeymapClass.FFI.withPtr false
             &&&> GUInt32.FFI.withVal
             &&&> GdkKeymapKeyRecordCArrayN.FFI.withRefOptPtr 0
             &&&> GUInt32CArrayN.FFI.withRefOptPtr 0
             &&&> GInt32.FFI.withRefVal
             ---> GdkKeymapKeyRecordCArrayN.FFI.fromPtr ~1
                   && GUInt32CArrayN.FFI.fromPtr ~1
                   && GInt32.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            getEntriesForKeycode_
            (
              self
               & hardwareKeycode
               & NONE
               & NONE
               & GInt32.null
            )
      in
        if retVal then SOME (keys (LargeInt.toInt nEntries), keyvals (LargeInt.toInt nEntries)) else NONE
      end
    fun getEntriesForKeyval self keyval =
      let
        val keys
         & nKeys
         & retVal =
          (
            GdkKeymapClass.FFI.withPtr false
             &&&> GUInt32.FFI.withVal
             &&&> GdkKeymapKeyRecordCArrayN.FFI.withRefOptPtr 0
             &&&> GInt32.FFI.withRefVal
             ---> GdkKeymapKeyRecordCArrayN.FFI.fromPtr ~1
                   && GInt32.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            getEntriesForKeyval_
            (
              self
               & keyval
               & NONE
               & GInt32.null
            )
      in
        if retVal then SOME (keys (LargeInt.toInt nKeys)) else NONE
      end
    fun getModifierMask self intent = (GdkKeymapClass.FFI.withPtr false &&&> GdkModifierIntent.FFI.withVal ---> GdkModifierType.FFI.fromVal) getModifierMask_ (self & intent)
    fun getModifierState self = (GdkKeymapClass.FFI.withPtr false ---> GUInt32.FFI.fromVal) getModifierState_ self
    fun getNumLockState self = (GdkKeymapClass.FFI.withPtr false ---> GBool.FFI.fromVal) getNumLockState_ self
    fun getScrollLockState self = (GdkKeymapClass.FFI.withPtr false ---> GBool.FFI.fromVal) getScrollLockState_ self
    fun haveBidiLayouts self = (GdkKeymapClass.FFI.withPtr false ---> GBool.FFI.fromVal) haveBidiLayouts_ self
    fun lookupKey self key = (GdkKeymapClass.FFI.withPtr false &&&> GdkKeymapKeyRecord.FFI.withPtr false ---> GUInt32.FFI.fromVal) lookupKey_ (self & key)
    fun mapVirtualModifiers self state =
      let
        val state & retVal = (GdkKeymapClass.FFI.withPtr false &&&> GdkModifierType.FFI.withRefVal ---> GdkModifierType.FFI.fromVal && GBool.FFI.fromVal) mapVirtualModifiers_ (self & state)
      in
        (retVal, state)
      end
    fun translateKeyboardState
      self
      (
        hardwareKeycode,
        state,
        group
      ) =
      let
        val keyval
         & effectiveGroup
         & level
         & consumedModifiers
         & retVal =
          (
            GdkKeymapClass.FFI.withPtr false
             &&&> GUInt32.FFI.withVal
             &&&> GdkModifierType.FFI.withVal
             &&&> GInt32.FFI.withVal
             &&&> GUInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             &&&> GdkModifierType.FFI.withRefVal
             ---> GUInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GdkModifierType.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            translateKeyboardState_
            (
              self
               & hardwareKeycode
               & state
               & group
               & GUInt32.null
               & GInt32.null
               & GInt32.null
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
