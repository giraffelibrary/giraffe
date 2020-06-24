structure GtkTreeModel :>
  GTK_TREE_MODEL
    where type 'a class = 'a GtkTreeModelClass.class
    where type tree_model_flags_t = GtkTreeModelFlags.t
    where type tree_iter_t = GtkTreeIterRecord.t
    where type tree_path_t = GtkTreePathRecord.t =
  struct
    val getType_ = _import "gtk_tree_model_get_type" : unit -> GObjectType.FFI.val_;
    val filterNew_ = fn x1 & x2 => (_import "gtk_tree_model_filter_new" : GtkTreeModelClass.FFI.non_opt GtkTreeModelClass.FFI.p * GtkTreePathRecord.FFI.opt GtkTreePathRecord.FFI.p -> GtkTreeModelClass.FFI.non_opt GtkTreeModelClass.FFI.p;) (x1, x2)
    val getColumnType_ = fn x1 & x2 => (_import "gtk_tree_model_get_column_type" : GtkTreeModelClass.FFI.non_opt GtkTreeModelClass.FFI.p * GInt32.FFI.val_ -> GObjectType.FFI.val_;) (x1, x2)
    val getFlags_ = _import "gtk_tree_model_get_flags" : GtkTreeModelClass.FFI.non_opt GtkTreeModelClass.FFI.p -> GtkTreeModelFlags.FFI.val_;
    val getIter_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_model_get_iter" :
              GtkTreeModelClass.FFI.non_opt GtkTreeModelClass.FFI.p
               * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p
               * GtkTreePathRecord.FFI.non_opt GtkTreePathRecord.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getIterFirst_ = fn x1 & x2 => (_import "gtk_tree_model_get_iter_first" : GtkTreeModelClass.FFI.non_opt GtkTreeModelClass.FFI.p * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val getIterFromString_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_tree_model_get_iter_from_string" :
              GtkTreeModelClass.FFI.non_opt GtkTreeModelClass.FFI.p
               * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getNColumns_ = _import "gtk_tree_model_get_n_columns" : GtkTreeModelClass.FFI.non_opt GtkTreeModelClass.FFI.p -> GInt32.FFI.val_;
    val getPath_ = fn x1 & x2 => (_import "gtk_tree_model_get_path" : GtkTreeModelClass.FFI.non_opt GtkTreeModelClass.FFI.p * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p -> GtkTreePathRecord.FFI.non_opt GtkTreePathRecord.FFI.p;) (x1, x2)
    val getStringFromIter_ = fn x1 & x2 => (_import "gtk_tree_model_get_string_from_iter" : GtkTreeModelClass.FFI.non_opt GtkTreeModelClass.FFI.p * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;) (x1, x2)
    val getValue_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_tree_model_get_value" :
              GtkTreeModelClass.FFI.non_opt GtkTreeModelClass.FFI.p
               * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p
               * GInt32.FFI.val_
               * GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p
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
              GtkTreeModelClass.FFI.non_opt GtkTreeModelClass.FFI.p
               * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p
               * GtkTreeIterRecord.FFI.opt GtkTreeIterRecord.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val iterHasChild_ = fn x1 & x2 => (_import "gtk_tree_model_iter_has_child" : GtkTreeModelClass.FFI.non_opt GtkTreeModelClass.FFI.p * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val iterNChildren_ = fn x1 & x2 => (_import "gtk_tree_model_iter_n_children" : GtkTreeModelClass.FFI.non_opt GtkTreeModelClass.FFI.p * GtkTreeIterRecord.FFI.opt GtkTreeIterRecord.FFI.p -> GInt32.FFI.val_;) (x1, x2)
    val iterNext_ = fn x1 & x2 => (_import "gtk_tree_model_iter_next" : GtkTreeModelClass.FFI.non_opt GtkTreeModelClass.FFI.p * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val iterNthChild_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_tree_model_iter_nth_child" :
              GtkTreeModelClass.FFI.non_opt GtkTreeModelClass.FFI.p
               * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p
               * GtkTreeIterRecord.FFI.opt GtkTreeIterRecord.FFI.p
               * GInt32.FFI.val_
               -> GBool.FFI.val_;
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
              GtkTreeModelClass.FFI.non_opt GtkTreeModelClass.FFI.p
               * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p
               * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val iterPrevious_ = fn x1 & x2 => (_import "gtk_tree_model_iter_previous" : GtkTreeModelClass.FFI.non_opt GtkTreeModelClass.FFI.p * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val refNode_ = fn x1 & x2 => (_import "gtk_tree_model_ref_node" : GtkTreeModelClass.FFI.non_opt GtkTreeModelClass.FFI.p * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p -> unit;) (x1, x2)
    val rowChanged_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_model_row_changed" :
              GtkTreeModelClass.FFI.non_opt GtkTreeModelClass.FFI.p
               * GtkTreePathRecord.FFI.non_opt GtkTreePathRecord.FFI.p
               * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val rowDeleted_ = fn x1 & x2 => (_import "gtk_tree_model_row_deleted" : GtkTreeModelClass.FFI.non_opt GtkTreeModelClass.FFI.p * GtkTreePathRecord.FFI.non_opt GtkTreePathRecord.FFI.p -> unit;) (x1, x2)
    val rowHasChildToggled_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_model_row_has_child_toggled" :
              GtkTreeModelClass.FFI.non_opt GtkTreeModelClass.FFI.p
               * GtkTreePathRecord.FFI.non_opt GtkTreePathRecord.FFI.p
               * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p
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
              GtkTreeModelClass.FFI.non_opt GtkTreeModelClass.FFI.p
               * GtkTreePathRecord.FFI.non_opt GtkTreePathRecord.FFI.p
               * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val rowsReordered_ =
      fn
        x1
         & x2
         & x3
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_gtk_tree_model_rows_reordered_with_length" :
              GtkTreeModelClass.FFI.non_opt GtkTreeModelClass.FFI.p
               * GtkTreePathRecord.FFI.non_opt GtkTreePathRecord.FFI.p
               * GtkTreeIterRecord.FFI.opt GtkTreeIterRecord.FFI.p
               * GInt32CArrayN.MLton.p1
               * GInt32CArrayN.FFI.non_opt GInt32CArrayN.MLton.p2
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val sortNewWithModel_ = _import "gtk_tree_model_sort_new_with_model" : GtkTreeModelClass.FFI.non_opt GtkTreeModelClass.FFI.p -> GtkTreeModelClass.FFI.non_opt GtkTreeModelClass.FFI.p;
    val unrefNode_ = fn x1 & x2 => (_import "gtk_tree_model_unref_node" : GtkTreeModelClass.FFI.non_opt GtkTreeModelClass.FFI.p * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GtkTreeModelClass.class
    type tree_model_flags_t = GtkTreeModelFlags.t
    type tree_iter_t = GtkTreeIterRecord.t
    type tree_path_t = GtkTreePathRecord.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun filterNew self root = (GtkTreeModelClass.FFI.withPtr &&&> GtkTreePathRecord.FFI.withOptPtr ---> GtkTreeModelClass.FFI.fromPtr true) filterNew_ (self & root)
    fun getColumnType self index = (GtkTreeModelClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> GObjectType.FFI.fromVal) getColumnType_ (self & index)
    fun getFlags self = (GtkTreeModelClass.FFI.withPtr ---> GtkTreeModelFlags.FFI.fromVal) getFlags_ self
    fun getIter self path =
      let
        val iter & retVal =
          (
            GtkTreeModelClass.FFI.withPtr
             &&&> GtkTreeIterRecord.FFI.withNewPtr
             &&&> GtkTreePathRecord.FFI.withPtr
             ---> GtkTreeIterRecord.FFI.fromPtr true && GBool.FFI.fromVal
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
        val iter & retVal = (GtkTreeModelClass.FFI.withPtr &&&> GtkTreeIterRecord.FFI.withNewPtr ---> GtkTreeIterRecord.FFI.fromPtr true && GBool.FFI.fromVal) getIterFirst_ (self & ())
      in
        if retVal then SOME iter else NONE
      end
    fun getIterFromString self pathString =
      let
        val iter & retVal =
          (
            GtkTreeModelClass.FFI.withPtr
             &&&> GtkTreeIterRecord.FFI.withNewPtr
             &&&> Utf8.FFI.withPtr
             ---> GtkTreeIterRecord.FFI.fromPtr true && GBool.FFI.fromVal
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
    fun getNColumns self = (GtkTreeModelClass.FFI.withPtr ---> GInt32.FFI.fromVal) getNColumns_ self
    fun getPath self iter = (GtkTreeModelClass.FFI.withPtr &&&> GtkTreeIterRecord.FFI.withPtr ---> GtkTreePathRecord.FFI.fromPtr true) getPath_ (self & iter)
    fun getStringFromIter self iter = (GtkTreeModelClass.FFI.withPtr &&&> GtkTreeIterRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getStringFromIter_ (self & iter)
    fun getValue self (iter, column) =
      let
        val value & () =
          (
            GtkTreeModelClass.FFI.withPtr
             &&&> GtkTreeIterRecord.FFI.withPtr
             &&&> GInt32.FFI.withVal
             &&&> GObjectValueRecord.FFI.withNewPtr
             ---> GObjectValueRecord.FFI.fromPtr true && I
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
            GtkTreeModelClass.FFI.withPtr
             &&&> GtkTreeIterRecord.FFI.withNewPtr
             &&&> GtkTreeIterRecord.FFI.withOptPtr
             ---> GtkTreeIterRecord.FFI.fromPtr true && GBool.FFI.fromVal
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
    fun iterHasChild self iter = (GtkTreeModelClass.FFI.withPtr &&&> GtkTreeIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) iterHasChild_ (self & iter)
    fun iterNChildren self iter = (GtkTreeModelClass.FFI.withPtr &&&> GtkTreeIterRecord.FFI.withOptPtr ---> GInt32.FFI.fromVal) iterNChildren_ (self & iter)
    fun iterNext self iter = (GtkTreeModelClass.FFI.withPtr &&&> GtkTreeIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) iterNext_ (self & iter)
    fun iterNthChild self (parent, n) =
      let
        val iter & retVal =
          (
            GtkTreeModelClass.FFI.withPtr
             &&&> GtkTreeIterRecord.FFI.withNewPtr
             &&&> GtkTreeIterRecord.FFI.withOptPtr
             &&&> GInt32.FFI.withVal
             ---> GtkTreeIterRecord.FFI.fromPtr true && GBool.FFI.fromVal
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
            GtkTreeModelClass.FFI.withPtr
             &&&> GtkTreeIterRecord.FFI.withNewPtr
             &&&> GtkTreeIterRecord.FFI.withPtr
             ---> GtkTreeIterRecord.FFI.fromPtr true && GBool.FFI.fromVal
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
    fun iterPrevious self iter = (GtkTreeModelClass.FFI.withPtr &&&> GtkTreeIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) iterPrevious_ (self & iter)
    fun refNode self iter = (GtkTreeModelClass.FFI.withPtr &&&> GtkTreeIterRecord.FFI.withPtr ---> I) refNode_ (self & iter)
    fun rowChanged self (path, iter) =
      (
        GtkTreeModelClass.FFI.withPtr
         &&&> GtkTreePathRecord.FFI.withPtr
         &&&> GtkTreeIterRecord.FFI.withPtr
         ---> I
      )
        rowChanged_
        (
          self
           & path
           & iter
        )
    fun rowDeleted self path = (GtkTreeModelClass.FFI.withPtr &&&> GtkTreePathRecord.FFI.withPtr ---> I) rowDeleted_ (self & path)
    fun rowHasChildToggled self (path, iter) =
      (
        GtkTreeModelClass.FFI.withPtr
         &&&> GtkTreePathRecord.FFI.withPtr
         &&&> GtkTreeIterRecord.FFI.withPtr
         ---> I
      )
        rowHasChildToggled_
        (
          self
           & path
           & iter
        )
    fun rowInserted self (path, iter) =
      (
        GtkTreeModelClass.FFI.withPtr
         &&&> GtkTreePathRecord.FFI.withPtr
         &&&> GtkTreeIterRecord.FFI.withPtr
         ---> I
      )
        rowInserted_
        (
          self
           & path
           & iter
        )
    fun rowsReordered
      self
      (
        path,
        iter,
        newOrder
      ) =
      let
        val length = LargeInt.fromInt (GInt32CArrayN.length newOrder)
        val () =
          (
            GtkTreeModelClass.FFI.withPtr
             &&&> GtkTreePathRecord.FFI.withPtr
             &&&> GtkTreeIterRecord.FFI.withOptPtr
             &&&> GInt32CArrayN.FFI.withPtr
             &&&> GInt32.FFI.withVal
             ---> I
          )
            rowsReordered_
            (
              self
               & path
               & iter
               & newOrder
               & length
            )
      in
        ()
      end
    fun sortNewWithModel self = (GtkTreeModelClass.FFI.withPtr ---> GtkTreeModelClass.FFI.fromPtr true) sortNewWithModel_ self
    fun unrefNode self iter = (GtkTreeModelClass.FFI.withPtr &&&> GtkTreeIterRecord.FFI.withPtr ---> I) unrefNode_ (self & iter)
    local
      open ClosureMarshal Signal
    in
      fun rowChangedSig f = signal "row-changed" (get 0w1 GtkTreePathRecord.t &&&> get 0w2 GtkTreeIterRecord.t ---> ret_void) (fn path & iter => f (path, iter))
      fun rowDeletedSig f = signal "row-deleted" (get 0w1 GtkTreePathRecord.t ---> ret_void) f
      fun rowHasChildToggledSig f = signal "row-has-child-toggled" (get 0w1 GtkTreePathRecord.t &&&> get 0w2 GtkTreeIterRecord.t ---> ret_void) (fn path & iter => f (path, iter))
      fun rowInsertedSig f = signal "row-inserted" (get 0w1 GtkTreePathRecord.t &&&> get 0w2 GtkTreeIterRecord.t ---> ret_void) (fn path & iter => f (path, iter))
    end
  end
