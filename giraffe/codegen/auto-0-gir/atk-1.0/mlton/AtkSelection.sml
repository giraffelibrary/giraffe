structure AtkSelection :>
  ATK_SELECTION
    where type 'a class = 'a AtkSelectionClass.class
    where type 'a object_class = 'a AtkObjectClass.class =
  struct
    val getType_ = _import "atk_selection_get_type" : unit -> GObjectType.FFI.val_;
    val addSelection_ = fn x1 & x2 => (_import "atk_selection_add_selection" : AtkSelectionClass.FFI.notnull AtkSelectionClass.FFI.p * GInt.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val clearSelection_ = _import "atk_selection_clear_selection" : AtkSelectionClass.FFI.notnull AtkSelectionClass.FFI.p -> GBool.FFI.val_;
    val getSelectionCount_ = _import "atk_selection_get_selection_count" : AtkSelectionClass.FFI.notnull AtkSelectionClass.FFI.p -> GInt.FFI.val_;
    val isChildSelected_ = fn x1 & x2 => (_import "atk_selection_is_child_selected" : AtkSelectionClass.FFI.notnull AtkSelectionClass.FFI.p * GInt.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val refSelection_ = fn x1 & x2 => (_import "atk_selection_ref_selection" : AtkSelectionClass.FFI.notnull AtkSelectionClass.FFI.p * GInt.FFI.val_ -> AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p;) (x1, x2)
    val removeSelection_ = fn x1 & x2 => (_import "atk_selection_remove_selection" : AtkSelectionClass.FFI.notnull AtkSelectionClass.FFI.p * GInt.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val selectAllSelection_ = _import "atk_selection_select_all_selection" : AtkSelectionClass.FFI.notnull AtkSelectionClass.FFI.p -> GBool.FFI.val_;
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
