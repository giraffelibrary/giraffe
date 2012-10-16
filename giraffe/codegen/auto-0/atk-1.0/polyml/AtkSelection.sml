structure AtkSelection :>
  ATK_SELECTION
    where type 'a class_t = 'a AtkSelectionClass.t
    where type 'a objectclass_t = 'a AtkObjectClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_selection_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val addSelection_ = call (load_sym libatk "atk_selection_add_selection") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.Bool.VAL)
      val clearSelection_ = call (load_sym libatk "atk_selection_clear_selection") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getSelectionCount_ = call (load_sym libatk "atk_selection_get_selection_count") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val isChildSelected_ = call (load_sym libatk "atk_selection_is_child_selected") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.Bool.VAL)
      val refSelection_ = call (load_sym libatk "atk_selection_ref_selection") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> GObjectObjectClass.PolyML.PTR)
      val removeSelection_ = call (load_sym libatk "atk_selection_remove_selection") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.Bool.VAL)
      val selectAllSelection_ = call (load_sym libatk "atk_selection_select_all_selection") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
    end
    type 'a class_t = 'a AtkSelectionClass.t
    type 'a objectclass_t = 'a AtkObjectClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun addSelection self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.withVal ---> FFI.Bool.fromVal) addSelection_ (self & i)
    fun clearSelection self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) clearSelection_ self
    fun getSelectionCount self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getSelectionCount_ self
    fun isChildSelected self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.withVal ---> FFI.Bool.fromVal) isChildSelected_ (self & i)
    fun refSelection self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.withVal ---> AtkObjectClass.C.fromPtr true) refSelection_ (self & i)
    fun removeSelection self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.withVal ---> FFI.Bool.fromVal) removeSelection_ (self & i)
    fun selectAllSelection self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) selectAllSelection_ self
    local
      open ClosureMarshal Signal
    in
      fun selectionChangedSig f = signal "selection-changed" (void ---> ret_void) f
    end
  end
