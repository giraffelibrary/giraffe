structure AtkSelection :>
  ATK_SELECTION
    where type 'a class = 'a AtkSelectionClass.class
    where type 'a object_class = 'a AtkObjectClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_selection_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val addSelection_ = call (load_sym libatk "atk_selection_add_selection") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val clearSelection_ = call (load_sym libatk "atk_selection_clear_selection") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getSelectionCount_ = call (load_sym libatk "atk_selection_get_selection_count") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val isChildSelected_ = call (load_sym libatk "atk_selection_is_child_selected") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val refSelection_ = call (load_sym libatk "atk_selection_ref_selection") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> GObjectObjectClass.PolyML.cPtr)
      val removeSelection_ = call (load_sym libatk "atk_selection_remove_selection") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val selectAllSelection_ = call (load_sym libatk "atk_selection_select_all_selection") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
    end
    type 'a class = 'a AtkSelectionClass.class
    type 'a object_class = 'a AtkObjectClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun addSelection self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> FFI.Bool.C.fromVal) addSelection_ (self & i)
    fun clearSelection self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) clearSelection_ self
    fun getSelectionCount self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getSelectionCount_ self
    fun isChildSelected self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> FFI.Bool.C.fromVal) isChildSelected_ (self & i)
    fun refSelection self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> AtkObjectClass.C.fromPtr true) refSelection_ (self & i)
    fun removeSelection self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> FFI.Bool.C.fromVal) removeSelection_ (self & i)
    fun selectAllSelection self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) selectAllSelection_ self
    local
      open ClosureMarshal Signal
    in
      fun selectionChangedSig f = signal "selection-changed" (void ---> ret_void) f
    end
  end
