structure GdkKeymap :>
  GDK_KEYMAP
    where type 'a class_t = 'a GdkKeymapClass.t
    where type 'a display_class_t = 'a GdkDisplayClass.t
    where type keymap_key_record_t = GdkKeymapKeyRecord.t
    where type modifier_type_t = GdkModifierType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_keymap_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getDefault_ = call (load_sym libgdk "gdk_keymap_get_default") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getForDisplay_ = call (load_sym libgdk "gdk_keymap_get_for_display") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val addVirtualModifiers_ = call (load_sym libgdk "gdk_keymap_add_virtual_modifiers") (GObjectObjectClass.PolyML.PTR &&> GdkModifierType.PolyML.REF --> FFI.PolyML.VOID)
      val getCapsLockState_ = call (load_sym libgdk "gdk_keymap_get_caps_lock_state") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getDirection_ = call (load_sym libgdk "gdk_keymap_get_direction") (GObjectObjectClass.PolyML.PTR --> PangoDirection.PolyML.VAL)
      val getNumLockState_ = call (load_sym libgdk "gdk_keymap_get_num_lock_state") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val haveBidiLayouts_ = call (load_sym libgdk "gdk_keymap_have_bidi_layouts") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val lookupKey_ = call (load_sym libgdk "gdk_keymap_lookup_key") (GObjectObjectClass.PolyML.PTR &&> GdkKeymapKeyRecord.PolyML.PTR --> FFI.UInt.PolyML.VAL)
      val mapVirtualModifiers_ = call (load_sym libgdk "gdk_keymap_map_virtual_modifiers") (GObjectObjectClass.PolyML.PTR &&> GdkModifierType.PolyML.REF --> FFI.Bool.PolyML.VAL)
      val translateKeyboardState_ =
        call (load_sym libgdk "gdk_keymap_translate_keyboard_state")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.UInt.PolyML.VAL
             &&> GdkModifierType.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> FFI.UInt.PolyML.REF
             &&> FFI.Int.PolyML.REF
             &&> FFI.Int.PolyML.REF
             &&> GdkModifierType.PolyML.REF
             --> FFI.Bool.PolyML.VAL
          )
    end
    type 'a class_t = 'a GdkKeymapClass.t
    type 'a display_class_t = 'a GdkDisplayClass.t
    type keymap_key_record_t = GdkKeymapKeyRecord.t
    type modifier_type_t = GdkModifierType.t
    type t = base class_t
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
