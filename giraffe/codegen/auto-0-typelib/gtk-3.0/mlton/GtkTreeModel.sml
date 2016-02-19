structure GtkTreeModel :>
  GTK_TREE_MODEL
    where type 'a class_t = 'a GtkTreeModelClass.t
    where type tree_model_flags_t = GtkTreeModelFlags.t
    where type tree_iter_record_t = GtkTreeIterRecord.t
    where type tree_path_record_t = GtkTreePathRecord.t =
  struct
    val getType_ = _import "gtk_tree_model_get_type" : unit -> GObjectType.C.val_;
    val filterNew_ = fn x1 & x2 => (_import "gtk_tree_model_filter_new" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GtkTreePathRecord.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getFlags_ = _import "gtk_tree_model_get_flags" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkTreeModelFlags.C.val_;
    val getIter_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_model_get_iter" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getIterFirst_ = fn x1 & x2 => (_import "gtk_tree_model_get_iter_first" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val getIterFromString_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_tree_model_get_iter_from_string" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getNColumns_ = _import "gtk_tree_model_get_n_columns" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.C.val_;
    val getPath_ = fn x1 & x2 => (_import "gtk_tree_model_get_path" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p -> GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p;) (x1, x2)
    val getStringFromIter_ = fn x1 & x2 => (_import "gtk_tree_model_get_string_from_iter" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p -> Utf8.C.notnull Utf8.C.out_p;) (x1, x2)
    val getValue_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_tree_model_get_value" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               * FFI.Int32.C.val_
               * GObjectValueRecord.C.notnull GObjectValueRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val iterChildren_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_model_iter_children" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               * unit GtkTreeIterRecord.C.p
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val iterHasChild_ = fn x1 & x2 => (_import "gtk_tree_model_iter_has_child" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val iterNChildren_ = fn x1 & x2 => (_import "gtk_tree_model_iter_n_children" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GtkTreeIterRecord.C.p -> FFI.Int32.C.val_;) (x1, x2)
    val iterNext_ = fn x1 & x2 => (_import "gtk_tree_model_iter_next" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val iterNthChild_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_tree_model_iter_nth_child" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               * unit GtkTreeIterRecord.C.p
               * FFI.Int32.C.val_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val iterParent_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_model_iter_parent" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val iterPrevious_ = fn x1 & x2 => (_import "gtk_tree_model_iter_previous" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val refNode_ = fn x1 & x2 => (_import "gtk_tree_model_ref_node" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p -> unit;) (x1, x2)
    val rowChanged_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_model_row_changed" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val rowDeleted_ = fn x1 & x2 => (_import "gtk_tree_model_row_deleted" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p -> unit;) (x1, x2)
    val rowHasChildToggled_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_model_row_has_child_toggled" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val rowInserted_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_model_row_inserted" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val sortNewWithModel_ = _import "gtk_tree_model_sort_new_with_model" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val unrefNode_ = fn x1 & x2 => (_import "gtk_tree_model_unref_node" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p -> unit;) (x1, x2)
    type 'a class_t = 'a GtkTreeModelClass.t
    type tree_model_flags_t = GtkTreeModelFlags.t
    type tree_iter_record_t = GtkTreeIterRecord.t
    type tree_path_record_t = GtkTreePathRecord.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun filterNew self root = (GObjectObjectClass.C.withPtr &&&> GtkTreePathRecord.C.withOptPtr ---> GtkTreeModelClass.C.fromPtr true) filterNew_ (self & root)
    fun getFlags self = (GObjectObjectClass.C.withPtr ---> GtkTreeModelFlags.C.fromVal) getFlags_ self
    fun getIter self path =
      let
        val iter & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> GtkTreeIterRecord.C.withNewPtr
             &&&> GtkTreePathRecord.C.withPtr
             ---> GtkTreeIterRecord.C.fromPtr true && FFI.Bool.C.fromVal
          )
            getIter_
            (
              self
               & ()
               & path
            )
      in
        if retVal then SOME iter else NONE
      end
    fun getIterFirst self =
      let
        val iter & retVal = (GObjectObjectClass.C.withPtr &&&> GtkTreeIterRecord.C.withNewPtr ---> GtkTreeIterRecord.C.fromPtr true && FFI.Bool.C.fromVal) getIterFirst_ (self & ())
      in
        if retVal then SOME iter else NONE
      end
    fun getIterFromString self pathString =
      let
        val iter & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> GtkTreeIterRecord.C.withNewPtr
             &&&> Utf8.C.withPtr
             ---> GtkTreeIterRecord.C.fromPtr true && FFI.Bool.C.fromVal
          )
            getIterFromString_
            (
              self
               & ()
               & pathString
            )
      in
        if retVal then SOME iter else NONE
      end
    fun getNColumns self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getNColumns_ self
    fun getPath self iter = (GObjectObjectClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> GtkTreePathRecord.C.fromPtr true) getPath_ (self & iter)
    fun getStringFromIter self iter = (GObjectObjectClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> Utf8.C.fromPtr true) getStringFromIter_ (self & iter)
    fun getValue self iter column =
      let
        val value & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> GtkTreeIterRecord.C.withPtr
             &&&> FFI.Int32.C.withVal
             &&&> GObjectValueRecord.C.withNewPtr
             ---> GObjectValueRecord.C.fromPtr true && I
          )
            getValue_
            (
              self
               & iter
               & column
               & ()
            )
      in
        value
      end
    fun iterChildren self parent =
      let
        val iter & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> GtkTreeIterRecord.C.withNewPtr
             &&&> GtkTreeIterRecord.C.withOptPtr
             ---> GtkTreeIterRecord.C.fromPtr true && FFI.Bool.C.fromVal
          )
            iterChildren_
            (
              self
               & ()
               & parent
            )
      in
        if retVal then SOME iter else NONE
      end
    fun iterHasChild self iter = (GObjectObjectClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) iterHasChild_ (self & iter)
    fun iterNChildren self iter = (GObjectObjectClass.C.withPtr &&&> GtkTreeIterRecord.C.withOptPtr ---> FFI.Int32.C.fromVal) iterNChildren_ (self & iter)
    fun iterNext self iter = (GObjectObjectClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) iterNext_ (self & iter)
    fun iterNthChild self parent n =
      let
        val iter & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> GtkTreeIterRecord.C.withNewPtr
             &&&> GtkTreeIterRecord.C.withOptPtr
             &&&> FFI.Int32.C.withVal
             ---> GtkTreeIterRecord.C.fromPtr true && FFI.Bool.C.fromVal
          )
            iterNthChild_
            (
              self
               & ()
               & parent
               & n
            )
      in
        if retVal then SOME iter else NONE
      end
    fun iterParent self child =
      let
        val iter & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> GtkTreeIterRecord.C.withNewPtr
             &&&> GtkTreeIterRecord.C.withPtr
             ---> GtkTreeIterRecord.C.fromPtr true && FFI.Bool.C.fromVal
          )
            iterParent_
            (
              self
               & ()
               & child
            )
      in
        if retVal then SOME iter else NONE
      end
    fun iterPrevious self iter = (GObjectObjectClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) iterPrevious_ (self & iter)
    fun refNode self iter = (GObjectObjectClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> I) refNode_ (self & iter)
    fun rowChanged self path iter =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkTreePathRecord.C.withPtr
         &&&> GtkTreeIterRecord.C.withPtr
         ---> I
      )
        rowChanged_
        (
          self
           & path
           & iter
        )
    fun rowDeleted self path = (GObjectObjectClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> I) rowDeleted_ (self & path)
    fun rowHasChildToggled self path iter =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkTreePathRecord.C.withPtr
         &&&> GtkTreeIterRecord.C.withPtr
         ---> I
      )
        rowHasChildToggled_
        (
          self
           & path
           & iter
        )
    fun rowInserted self path iter =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkTreePathRecord.C.withPtr
         &&&> GtkTreeIterRecord.C.withPtr
         ---> I
      )
        rowInserted_
        (
          self
           & path
           & iter
        )
    fun sortNewWithModel self = (GObjectObjectClass.C.withPtr ---> GtkTreeModelClass.C.fromPtr true) sortNewWithModel_ self
    fun unrefNode self iter = (GObjectObjectClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> I) unrefNode_ (self & iter)
    local
      open ClosureMarshal Signal
    in
      fun rowChangedSig f = signal "row-changed" (get 0w1 GtkTreePathRecord.t &&&> get 0w2 GtkTreeIterRecord.t ---> ret_void) (fn path & iter => f path iter)
      fun rowDeletedSig f = signal "row-deleted" (get 0w1 GtkTreePathRecord.t ---> ret_void) f
      fun rowHasChildToggledSig f = signal "row-has-child-toggled" (get 0w1 GtkTreePathRecord.t &&&> get 0w2 GtkTreeIterRecord.t ---> ret_void) (fn path & iter => f path iter)
      fun rowInsertedSig f = signal "row-inserted" (get 0w1 GtkTreePathRecord.t &&&> get 0w2 GtkTreeIterRecord.t ---> ret_void) (fn path & iter => f path iter)
    end
  end
