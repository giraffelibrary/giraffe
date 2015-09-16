structure AtkSelection :>
  ATK_SELECTION
    where type 'a class_t = 'a AtkSelectionClass.t
    where type 'a object_class_t = 'a AtkObjectClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_selection_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val addSelection_ = call (load_sym libatk "atk_selection_add_selection") (GObjectObjectClass.PolyML.PTR &&> FFI.Int.PolyML.VAL --> FFI.Bool.PolyML.VAL)
      val clearSelection_ = call (load_sym libatk "atk_selection_clear_selection") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getSelectionCount_ = call (load_sym libatk "atk_selection_get_selection_count") (GObjectObjectClass.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val isChildSelected_ = call (load_sym libatk "atk_selection_is_child_selected") (GObjectObjectClass.PolyML.PTR &&> FFI.Int.PolyML.VAL --> FFI.Bool.PolyML.VAL)
      val refSelection_ = call (load_sym libatk "atk_selection_ref_selection") (GObjectObjectClass.PolyML.PTR &&> FFI.Int.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val removeSelection_ = call (load_sym libatk "atk_selection_remove_selection") (GObjectObjectClass.PolyML.PTR &&> FFI.Int.PolyML.VAL --> FFI.Bool.PolyML.VAL)
      val selectAllSelection_ = call (load_sym libatk "atk_selection_select_all_selection") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
    end
    type 'a class_t = 'a AtkSelectionClass.t
    type 'a object_class_t = 'a AtkObjectClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun addSelection self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Bool.C.fromVal) addSelection_ (self & i)
    fun clearSelection self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) clearSelection_ self
    fun getSelectionCount self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getSelectionCount_ self
    fun isChildSelected self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Bool.C.fromVal) isChildSelected_ (self & i)
    fun refSelection self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> AtkObjectClass.C.fromPtr true) refSelection_ (self & i)
    fun removeSelection self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Bool.C.fromVal) removeSelection_ (self & i)
    fun selectAllSelection self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) selectAllSelection_ self
    local
      open ClosureMarshal Signal
    in
      fun selectionChangedSig f = signal "selection-changed" (void ---> ret_void) f
    end
  end
