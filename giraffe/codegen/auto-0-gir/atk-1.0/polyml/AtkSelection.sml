structure AtkSelection :>
  ATK_SELECTION
    where type 'a class = 'a AtkSelectionClass.class
    where type 'a object_class = 'a AtkObjectClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "atk_selection_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val addSelection_ = call (getSymbol "atk_selection_add_selection") (AtkSelectionClass.PolyML.cPtr &&> GInt.PolyML.cVal --> GBool.PolyML.cVal)
      val clearSelection_ = call (getSymbol "atk_selection_clear_selection") (AtkSelectionClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getSelectionCount_ = call (getSymbol "atk_selection_get_selection_count") (AtkSelectionClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val isChildSelected_ = call (getSymbol "atk_selection_is_child_selected") (AtkSelectionClass.PolyML.cPtr &&> GInt.PolyML.cVal --> GBool.PolyML.cVal)
      val refSelection_ = call (getSymbol "atk_selection_ref_selection") (AtkSelectionClass.PolyML.cPtr &&> GInt.PolyML.cVal --> AtkObjectClass.PolyML.cPtr)
      val removeSelection_ = call (getSymbol "atk_selection_remove_selection") (AtkSelectionClass.PolyML.cPtr &&> GInt.PolyML.cVal --> GBool.PolyML.cVal)
      val selectAllSelection_ = call (getSymbol "atk_selection_select_all_selection") (AtkSelectionClass.PolyML.cPtr --> GBool.PolyML.cVal)
    end
    type 'a class = 'a AtkSelectionClass.class
    type 'a object_class = 'a AtkObjectClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun addSelection self i = (AtkSelectionClass.FFI.withPtr &&&> GInt.FFI.withVal ---> GBool.FFI.fromVal) addSelection_ (self & i)
    fun clearSelection self = (AtkSelectionClass.FFI.withPtr ---> GBool.FFI.fromVal) clearSelection_ self
    fun getSelectionCount self = (AtkSelectionClass.FFI.withPtr ---> GInt.FFI.fromVal) getSelectionCount_ self
    fun isChildSelected self i = (AtkSelectionClass.FFI.withPtr &&&> GInt.FFI.withVal ---> GBool.FFI.fromVal) isChildSelected_ (self & i)
    fun refSelection self i = (AtkSelectionClass.FFI.withPtr &&&> GInt.FFI.withVal ---> AtkObjectClass.FFI.fromPtr true) refSelection_ (self & i)
    fun removeSelection self i = (AtkSelectionClass.FFI.withPtr &&&> GInt.FFI.withVal ---> GBool.FFI.fromVal) removeSelection_ (self & i)
    fun selectAllSelection self = (AtkSelectionClass.FFI.withPtr ---> GBool.FFI.fromVal) selectAllSelection_ self
    local
      open ClosureMarshal Signal
    in
      fun selectionChangedSig f = signal "selection-changed" (void ---> ret_void) f
    end
  end
