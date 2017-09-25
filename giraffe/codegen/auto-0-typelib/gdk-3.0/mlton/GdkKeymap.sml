structure GdkKeymap :>
  GDK_KEYMAP
    where type 'a class = 'a GdkKeymapClass.class
    where type 'a display_class = 'a GdkDisplayClass.class
    where type keymap_key_t = GdkKeymapKeyRecord.t
    where type modifier_type_t = GdkModifierType.t =
  struct
    structure GdkKeymapKeyRecordCVectorNType =
      CPointerCVectorNType(
        structure CElemType = GdkKeymapKeyRecord.C.PointerType
        structure Sequence = VectorSequence
      )
    structure GdkKeymapKeyRecordCVectorN = CVectorN(GdkKeymapKeyRecordCVectorNType)
    structure GUInt32CVectorNType =
      CValueCVectorNType(
        structure CElemType = GUInt32Type
        structure ElemSequence = CValueVectorSequence(GUInt32Type)
      )
    structure GUInt32CVectorN = CVectorN(GUInt32CVectorNType)
    val getType_ = _import "gdk_keymap_get_type" : unit -> GObjectType.FFI.val_;
    val getDefault_ = _import "gdk_keymap_get_default" : unit -> GdkKeymapClass.FFI.notnull GdkKeymapClass.FFI.p;
    val getForDisplay_ = _import "gdk_keymap_get_for_display" : GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p -> GdkKeymapClass.FFI.notnull GdkKeymapClass.FFI.p;
    val addVirtualModifiers_ = fn x1 & x2 => (_import "gdk_keymap_add_virtual_modifiers" : GdkKeymapClass.FFI.notnull GdkKeymapClass.FFI.p * GdkModifierType.FFI.ref_ -> unit;) (x1, x2)
    val getCapsLockState_ = _import "gdk_keymap_get_caps_lock_state" : GdkKeymapClass.FFI.notnull GdkKeymapClass.FFI.p -> GBool.FFI.val_;
    val getDirection_ = _import "gdk_keymap_get_direction" : GdkKeymapClass.FFI.notnull GdkKeymapClass.FFI.p -> PangoDirection.FFI.val_;
    val getEntriesForKeycode_ =
      fn
        x1
         & x2
         & (x3, x4)
         & (x5, x6)
         & x7 =>
          (
            _import "mlton_gdk_keymap_get_entries_for_keycode" :
              GdkKeymapClass.FFI.notnull GdkKeymapClass.FFI.p
               * GUInt32.FFI.val_
               * GdkKeymapKeyRecordCVectorN.MLton.r1
               * (unit, GdkKeymapKeyRecordCVectorN.FFI.notnull) GdkKeymapKeyRecordCVectorN.MLton.r2
               * GUInt32CVectorN.MLton.r1
               * (unit, GUInt32CVectorN.FFI.notnull) GUInt32CVectorN.MLton.r2
               * GInt32.FFI.ref_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val getEntriesForKeyval_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_gdk_keymap_get_entries_for_keyval" :
              GdkKeymapClass.FFI.notnull GdkKeymapClass.FFI.p
               * GUInt32.FFI.val_
               * GdkKeymapKeyRecordCVectorN.MLton.r1
               * (unit, GdkKeymapKeyRecordCVectorN.FFI.notnull) GdkKeymapKeyRecordCVectorN.MLton.r2
               * GInt32.FFI.ref_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getNumLockState_ = _import "gdk_keymap_get_num_lock_state" : GdkKeymapClass.FFI.notnull GdkKeymapClass.FFI.p -> GBool.FFI.val_;
    val haveBidiLayouts_ = _import "gdk_keymap_have_bidi_layouts" : GdkKeymapClass.FFI.notnull GdkKeymapClass.FFI.p -> GBool.FFI.val_;
    val lookupKey_ = fn x1 & x2 => (_import "gdk_keymap_lookup_key" : GdkKeymapClass.FFI.notnull GdkKeymapClass.FFI.p * GdkKeymapKeyRecord.FFI.notnull GdkKeymapKeyRecord.FFI.p -> GUInt32.FFI.val_;) (x1, x2)
    val mapVirtualModifiers_ = fn x1 & x2 => (_import "gdk_keymap_map_virtual_modifiers" : GdkKeymapClass.FFI.notnull GdkKeymapClass.FFI.p * GdkModifierType.FFI.ref_ -> GBool.FFI.val_;) (x1, x2)
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
              GdkKeymapClass.FFI.notnull GdkKeymapClass.FFI.p
               * GUInt32.FFI.val_
               * GdkModifierType.FFI.val_
               * GInt32.FFI.val_
               * GUInt32.FFI.ref_
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               * GdkModifierType.FFI.ref_
               -> GBool.FFI.val_;
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
    fun getEntriesForKeycode self hardwareKeycode =
      let
        val keys
         & keyvals
         & nEntries
         & retVal =
          (
            GdkKeymapClass.FFI.withPtr
             &&&> GUInt32.FFI.withVal
             &&&> GdkKeymapKeyRecordCVectorN.FFI.withRefOptPtr
             &&&> GUInt32CVectorN.FFI.withRefOptPtr
             &&&> GInt32.FFI.withRefVal
             ---> GdkKeymapKeyRecordCVectorN.FFI.fromPtr 1
                   && GUInt32CVectorN.FFI.fromPtr 1
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
            GdkKeymapClass.FFI.withPtr
             &&&> GUInt32.FFI.withVal
             &&&> GdkKeymapKeyRecordCVectorN.FFI.withRefOptPtr
             &&&> GInt32.FFI.withRefVal
             ---> GdkKeymapKeyRecordCVectorN.FFI.fromPtr 1
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
    fun getNumLockState self = (GdkKeymapClass.FFI.withPtr ---> GBool.FFI.fromVal) getNumLockState_ self
    fun haveBidiLayouts self = (GdkKeymapClass.FFI.withPtr ---> GBool.FFI.fromVal) haveBidiLayouts_ self
    fun lookupKey self key = (GdkKeymapClass.FFI.withPtr &&&> GdkKeymapKeyRecord.FFI.withPtr ---> GUInt32.FFI.fromVal) lookupKey_ (self & key)
    fun mapVirtualModifiers self =
      let
        val state & retVal = (GdkKeymapClass.FFI.withPtr &&&> GdkModifierType.FFI.withRefVal ---> GdkModifierType.FFI.fromVal && GBool.FFI.fromVal) mapVirtualModifiers_ (self & GdkModifierType.flags [])
      in
        if retVal then SOME state else NONE
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
            GdkKeymapClass.FFI.withPtr
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
