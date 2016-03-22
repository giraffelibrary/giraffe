structure GtkTreeModel :>
  GTK_TREE_MODEL
    where type 'a class = 'a GtkTreeModelClass.class
    where type tree_model_flags_t = GtkTreeModelFlags.t
    where type tree_iter_t = GtkTreeIterRecord.t
    where type tree_path_t = GtkTreePathRecord.t =
  struct
    val getType_ = _import "gtk_tree_model_get_type" : unit -> GObjectType.C.val_;
    val filterNew_ = fn x1 & x2 => (_import "gtk_tree_model_filter_new" : GtkTreeModelClass.C.notnull GtkTreeModelClass.C.p * unit GtkTreePathRecord.C.p -> GtkTreeModelClass.C.notnull GtkTreeModelClass.C.p;) (x1, x2)
    val getFlags_ = _import "gtk_tree_model_get_flags" : GtkTreeModelClass.C.notnull GtkTreeModelClass.C.p -> GtkTreeModelFlags.C.val_;
    val getIter_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_model_get_iter" :
              GtkTreeModelClass.C.notnull GtkTreeModelClass.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getIterFirst_ = fn x1 & x2 => (_import "gtk_tree_model_get_iter_first" : GtkTreeModelClass.C.notnull GtkTreeModelClass.C.p * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val getIterFromString_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_tree_model_get_iter_from_string" :
              GtkTreeModelClass.C.notnull GtkTreeModelClass.C.p
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
    val getNColumns_ = _import "gtk_tree_model_get_n_columns" : GtkTreeModelClass.C.notnull GtkTreeModelClass.C.p -> FFI.Int32.C.val_;
    val getPath_ = fn x1 & x2 => (_import "gtk_tree_model_get_path" : GtkTreeModelClass.C.notnull GtkTreeModelClass.C.p * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p -> GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p;) (x1, x2)
    val getStringFromIter_ = fn x1 & x2 => (_import "gtk_tree_model_get_string_from_iter" : GtkTreeModelClass.C.notnull GtkTreeModelClass.C.p * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p -> Utf8.C.notnull Utf8.C.out_p;) (x1, x2)
    val getValue_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_tree_model_get_value" :
              GtkTreeModelClass.C.notnull GtkTreeModelClass.C.p
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
              GtkTreeModelClass.C.notnull GtkTreeModelClass.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               * unit GtkTreeIterRecord.C.p
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val iterHasChild_ = fn x1 & x2 => (_import "gtk_tree_model_iter_has_child" : GtkTreeModelClass.C.notnull GtkTreeModelClass.C.p * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val iterNChildren_ = fn x1 & x2 => (_import "gtk_tree_model_iter_n_children" : GtkTreeModelClass.C.notnull GtkTreeModelClass.C.p * unit GtkTreeIterRecord.C.p -> FFI.Int32.C.val_;) (x1, x2)
    val iterNext_ = fn x1 & x2 => (_import "gtk_tree_model_iter_next" : GtkTreeModelClass.C.notnull GtkTreeModelClass.C.p * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val iterNthChild_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_tree_model_iter_nth_child" :
              GtkTreeModelClass.C.notnull GtkTreeModelClass.C.p
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
              GtkTreeModelClass.C.notnull GtkTreeModelClass.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val iterPrevious_ = fn x1 & x2 => (_import "gtk_tree_model_iter_previous" : GtkTreeModelClass.C.notnull GtkTreeModelClass.C.p * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val refNode_ = fn x1 & x2 => (_import "gtk_tree_model_ref_node" : GtkTreeModelClass.C.notnull GtkTreeModelClass.C.p * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p -> unit;) (x1, x2)
    val rowChanged_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_model_row_changed" :
              GtkTreeModelClass.C.notnull GtkTreeModelClass.C.p
               * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val rowDeleted_ = fn x1 & x2 => (_import "gtk_tree_model_row_deleted" : GtkTreeModelClass.C.notnull GtkTreeModelClass.C.p * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p -> unit;) (x1, x2)
    val rowHasChildToggled_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_model_row_has_child_toggled" :
              GtkTreeModelClass.C.notnull GtkTreeModelClass.C.p
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
              GtkTreeModelClass.C.notnull GtkTreeModelClass.C.p
               * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val sortNewWithModel_ = _import "gtk_tree_model_sort_new_with_model" : GtkTreeModelClass.C.notnull GtkTreeModelClass.C.p -> GtkTreeModelClass.C.notnull GtkTreeModelClass.C.p;
    val unrefNode_ = fn x1 & x2 => (_import "gtk_tree_model_unref_node" : GtkTreeModelClass.C.notnull GtkTreeModelClass.C.p * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p -> unit;) (x1, x2)
    type 'a class = 'a GtkTreeModelClass.class
    type tree_model_flags_t = GtkTreeModelFlags.t
    type tree_iter_t = GtkTreeIterRecord.t
    type tree_path_t = GtkTreePathRecord.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun filterNew self root = (GtkTreeModelClass.C.withPtr &&&> GtkTreePathRecord.C.withOptPtr ---> GtkTreeModelClass.C.fromPtr true) filterNew_ (self & root)
    fun getFlags self = (GtkTreeModelClass.C.withPtr ---> GtkTreeModelFlags.C.fromVal) getFlags_ self
    fun getIter self path =
      let
        val iter & retVal =
          (
            GtkTreeModelClass.C.withPtr
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
        val iter & retVal = (GtkTreeModelClass.C.withPtr &&&> GtkTreeIterRecord.C.withNewPtr ---> GtkTreeIterRecord.C.fromPtr true && FFI.Bool.C.fromVal) getIterFirst_ (self & ())
      in
        if retVal then SOME iter else NONE
      end
    fun getIterFromString self pathString =
      let
        val iter & retVal =
          (
            GtkTreeModelClass.C.withPtr
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
    fun getNColumns self = (GtkTreeModelClass.C.withPtr ---> FFI.Int32.C.fromVal) getNColumns_ self
    fun getPath self iter = (GtkTreeModelClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> GtkTreePathRecord.C.fromPtr true) getPath_ (self & iter)
    fun getStringFromIter self iter = (GtkTreeModelClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> Utf8.C.fromPtr true) getStringFromIter_ (self & iter)
    fun getValue self iter column =
      let
        val value & () =
          (
            GtkTreeModelClass.C.withPtr
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
            GtkTreeModelClass.C.withPtr
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
    fun iterHasChild self iter = (GtkTreeModelClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) iterHasChild_ (self & iter)
    fun iterNChildren self iter = (GtkTreeModelClass.C.withPtr &&&> GtkTreeIterRecord.C.withOptPtr ---> FFI.Int32.C.fromVal) iterNChildren_ (self & iter)
    fun iterNext self iter = (GtkTreeModelClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) iterNext_ (self & iter)
    fun iterNthChild self parent n =
      let
        val iter & retVal =
          (
            GtkTreeModelClass.C.withPtr
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
            GtkTreeModelClass.C.withPtr
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
    fun iterPrevious self iter = (GtkTreeModelClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) iterPrevious_ (self & iter)
    fun refNode self iter = (GtkTreeModelClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> I) refNode_ (self & iter)
    fun rowChanged self path iter =
      (
        GtkTreeModelClass.C.withPtr
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
    fun rowDeleted self path = (GtkTreeModelClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> I) rowDeleted_ (self & path)
    fun rowHasChildToggled self path iter =
      (
        GtkTreeModelClass.C.withPtr
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
        GtkTreeModelClass.C.withPtr
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
    fun sortNewWithModel self = (GtkTreeModelClass.C.withPtr ---> GtkTreeModelClass.C.fromPtr true) sortNewWithModel_ self
    fun unrefNode self iter = (GtkTreeModelClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> I) unrefNode_ (self & iter)
    local
      open ClosureMarshal Signal
    in
      fun rowChangedSig f = signal "row-changed" (get 0w1 GtkTreePathRecord.t &&&> get 0w2 GtkTreeIterRecord.t ---> ret_void) (fn path & iter => f path iter)
      fun rowDeletedSig f = signal "row-deleted" (get 0w1 GtkTreePathRecord.t ---> ret_void) f
      fun rowHasChildToggledSig f = signal "row-has-child-toggled" (get 0w1 GtkTreePathRecord.t &&&> get 0w2 GtkTreeIterRecord.t ---> ret_void) (fn path & iter => f path iter)
      fun rowInsertedSig f = signal "row-inserted" (get 0w1 GtkTreePathRecord.t &&&> get 0w2 GtkTreeIterRecord.t ---> ret_void) (fn path & iter => f path iter)
    end
  end
