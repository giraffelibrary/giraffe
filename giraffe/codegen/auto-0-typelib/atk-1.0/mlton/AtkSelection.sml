structure AtkSelection :>
  ATK_SELECTION
    where type 'a class = 'a AtkSelectionClass.class
    where type 'a object_class = 'a AtkObjectClass.class =
  struct
    val getType_ = _import "atk_selection_get_type" : unit -> GObjectType.C.val_;
    val addSelection_ = fn x1 & x2 => (_import "atk_selection_add_selection" : AtkSelectionClass.C.notnull AtkSelectionClass.C.p * FFI.Int32.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val clearSelection_ = _import "atk_selection_clear_selection" : AtkSelectionClass.C.notnull AtkSelectionClass.C.p -> FFI.Bool.C.val_;
    val getSelectionCount_ = _import "atk_selection_get_selection_count" : AtkSelectionClass.C.notnull AtkSelectionClass.C.p -> FFI.Int32.C.val_;
    val isChildSelected_ = fn x1 & x2 => (_import "atk_selection_is_child_selected" : AtkSelectionClass.C.notnull AtkSelectionClass.C.p * FFI.Int32.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val refSelection_ = fn x1 & x2 => (_import "atk_selection_ref_selection" : AtkSelectionClass.C.notnull AtkSelectionClass.C.p * FFI.Int32.C.val_ -> AtkObjectClass.C.notnull AtkObjectClass.C.p;) (x1, x2)
    val removeSelection_ = fn x1 & x2 => (_import "atk_selection_remove_selection" : AtkSelectionClass.C.notnull AtkSelectionClass.C.p * FFI.Int32.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val selectAllSelection_ = _import "atk_selection_select_all_selection" : AtkSelectionClass.C.notnull AtkSelectionClass.C.p -> FFI.Bool.C.val_;
    type 'a class = 'a AtkSelectionClass.class
    type 'a object_class = 'a AtkObjectClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun addSelection self i = (AtkSelectionClass.C.withPtr &&&> FFI.Int32.C.withVal ---> FFI.Bool.C.fromVal) addSelection_ (self & i)
    fun clearSelection self = (AtkSelectionClass.C.withPtr ---> FFI.Bool.C.fromVal) clearSelection_ self
    fun getSelectionCount self = (AtkSelectionClass.C.withPtr ---> FFI.Int32.C.fromVal) getSelectionCount_ self
    fun isChildSelected self i = (AtkSelectionClass.C.withPtr &&&> FFI.Int32.C.withVal ---> FFI.Bool.C.fromVal) isChildSelected_ (self & i)
    fun refSelection self i = (AtkSelectionClass.C.withPtr &&&> FFI.Int32.C.withVal ---> AtkObjectClass.C.fromPtr true) refSelection_ (self & i)
    fun removeSelection self i = (AtkSelectionClass.C.withPtr &&&> FFI.Int32.C.withVal ---> FFI.Bool.C.fromVal) removeSelection_ (self & i)
    fun selectAllSelection self = (AtkSelectionClass.C.withPtr ---> FFI.Bool.C.fromVal) selectAllSelection_ self
    local
      open ClosureMarshal Signal
    in
      fun selectionChangedSig f = signal "selection-changed" (void ---> ret_void) f
    end
  end
