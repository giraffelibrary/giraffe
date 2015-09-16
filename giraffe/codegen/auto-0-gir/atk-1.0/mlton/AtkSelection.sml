structure AtkSelection :>
  ATK_SELECTION
    where type 'a class_t = 'a AtkSelectionClass.t
    where type 'a object_class_t = 'a AtkObjectClass.t =
  struct
    val getType_ = _import "atk_selection_get_type" : unit -> GObjectType.C.val_;
    val addSelection_ = fn x1 & x2 => (_import "atk_selection_add_selection" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val clearSelection_ = _import "atk_selection_clear_selection" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getSelectionCount_ = _import "atk_selection_get_selection_count" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val isChildSelected_ = fn x1 & x2 => (_import "atk_selection_is_child_selected" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val refSelection_ = fn x1 & x2 => (_import "atk_selection_ref_selection" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val removeSelection_ = fn x1 & x2 => (_import "atk_selection_remove_selection" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val selectAllSelection_ = _import "atk_selection_select_all_selection" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
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
