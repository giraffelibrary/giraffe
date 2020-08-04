structure GtkTreeModel :>
  GTK_TREE_MODEL
    where type 'a class = 'a GtkTreeModelClass.class
    where type tree_model_flags_t = GtkTreeModelFlags.t
    where type tree_iter_t = GtkTreeIterRecord.t
    where type tree_path_t = GtkTreePathRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_tree_model_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val filterNew_ = call (getSymbol "gtk_tree_model_filter_new") (GtkTreeModelClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cOptPtr --> GtkTreeModelClass.PolyML.cPtr)
      val getColumnType_ = call (getSymbol "gtk_tree_model_get_column_type") (GtkTreeModelClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> GObjectType.PolyML.cVal)
      val getFlags_ = call (getSymbol "gtk_tree_model_get_flags") (GtkTreeModelClass.PolyML.cPtr --> GtkTreeModelFlags.PolyML.cVal)
      val getIter_ =
        call (getSymbol "gtk_tree_model_get_iter")
          (
            GtkTreeModelClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
      val getIterFirst_ = call (getSymbol "gtk_tree_model_get_iter_first") (GtkTreeModelClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getIterFromString_ =
        call (getSymbol "gtk_tree_model_get_iter_from_string")
          (
            GtkTreeModelClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             --> GBool.PolyML.cVal
          )
      val getNColumns_ = call (getSymbol "gtk_tree_model_get_n_columns") (GtkTreeModelClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getPath_ = call (getSymbol "gtk_tree_model_get_path") (GtkTreeModelClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cPtr --> GtkTreePathRecord.PolyML.cPtr)
      val getStringFromIter_ = call (getSymbol "gtk_tree_model_get_string_from_iter") (GtkTreeModelClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getValue_ =
        call (getSymbol "gtk_tree_model_get_value")
          (
            GtkTreeModelClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GObjectValueRecord.PolyML.cPtr
             --> cVoid
          )
      val iterChildren_ =
        call (getSymbol "gtk_tree_model_iter_children")
          (
            GtkTreeModelClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cOptPtr
             --> GBool.PolyML.cVal
          )
      val iterHasChild_ = call (getSymbol "gtk_tree_model_iter_has_child") (GtkTreeModelClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val iterNChildren_ = call (getSymbol "gtk_tree_model_iter_n_children") (GtkTreeModelClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cOptPtr --> GInt32.PolyML.cVal)
      val iterNext_ = call (getSymbol "gtk_tree_model_iter_next") (GtkTreeModelClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val iterNthChild_ =
        call (getSymbol "gtk_tree_model_iter_nth_child")
          (
            GtkTreeModelClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cOptPtr
             &&> GInt32.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val iterParent_ =
        call (getSymbol "gtk_tree_model_iter_parent")
          (
            GtkTreeModelClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
      val iterPrevious_ = call (getSymbol "gtk_tree_model_iter_previous") (GtkTreeModelClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val refNode_ = call (getSymbol "gtk_tree_model_ref_node") (GtkTreeModelClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cPtr --> cVoid)
      val rowChanged_ =
        call (getSymbol "gtk_tree_model_row_changed")
          (
            GtkTreeModelClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             --> cVoid
          )
      val rowDeleted_ = call (getSymbol "gtk_tree_model_row_deleted") (GtkTreeModelClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> cVoid)
      val rowHasChildToggled_ =
        call (getSymbol "gtk_tree_model_row_has_child_toggled")
          (
            GtkTreeModelClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             --> cVoid
          )
      val rowInserted_ =
        call (getSymbol "gtk_tree_model_row_inserted")
          (
            GtkTreeModelClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             --> cVoid
          )
      val rowsReordered_ =
        call (getSymbol "gtk_tree_model_rows_reordered_with_length")
          (
            GtkTreeModelClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cOptPtr
             &&> GInt32CArrayN.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val sortNewWithModel_ = call (getSymbol "gtk_tree_model_sort_new_with_model") (GtkTreeModelClass.PolyML.cPtr --> GtkTreeModelClass.PolyML.cPtr)
      val unrefNode_ = call (getSymbol "gtk_tree_model_unref_node") (GtkTreeModelClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GtkTreeModelClass.class
    type tree_model_flags_t = GtkTreeModelFlags.t
    type tree_iter_t = GtkTreeIterRecord.t
    type tree_path_t = GtkTreePathRecord.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun filterNew self root = (GtkTreeModelClass.FFI.withPtr false &&&> GtkTreePathRecord.FFI.withOptPtr false ---> GtkTreeModelClass.FFI.fromPtr true) filterNew_ (self & root)
    fun getColumnType self index = (GtkTreeModelClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> GObjectType.FFI.fromVal) getColumnType_ (self & index)
    fun getFlags self = (GtkTreeModelClass.FFI.withPtr false ---> GtkTreeModelFlags.FFI.fromVal) getFlags_ self
    fun getIter self path =
      let
        val iter & retVal =
          (
            GtkTreeModelClass.FFI.withPtr false
             &&&> GtkTreeIterRecord.FFI.withNewPtr
             &&&> GtkTreePathRecord.FFI.withPtr false
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
        val iter & retVal = (GtkTreeModelClass.FFI.withPtr false &&&> GtkTreeIterRecord.FFI.withNewPtr ---> GtkTreeIterRecord.FFI.fromPtr true && GBool.FFI.fromVal) getIterFirst_ (self & ())
      in
        if retVal then SOME iter else NONE
      end
    fun getIterFromString self pathString =
      let
        val iter & retVal =
          (
            GtkTreeModelClass.FFI.withPtr false
             &&&> GtkTreeIterRecord.FFI.withNewPtr
             &&&> Utf8.FFI.withPtr 0
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
    fun getNColumns self = (GtkTreeModelClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getNColumns_ self
    fun getPath self iter = (GtkTreeModelClass.FFI.withPtr false &&&> GtkTreeIterRecord.FFI.withPtr false ---> GtkTreePathRecord.FFI.fromPtr true) getPath_ (self & iter)
    fun getStringFromIter self iter = (GtkTreeModelClass.FFI.withPtr false &&&> GtkTreeIterRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) getStringFromIter_ (self & iter)
    fun getValue self (iter, column) =
      let
        val value & () =
          (
            GtkTreeModelClass.FFI.withPtr false
             &&&> GtkTreeIterRecord.FFI.withPtr false
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
            GtkTreeModelClass.FFI.withPtr false
             &&&> GtkTreeIterRecord.FFI.withNewPtr
             &&&> GtkTreeIterRecord.FFI.withOptPtr false
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
    fun iterHasChild self iter = (GtkTreeModelClass.FFI.withPtr false &&&> GtkTreeIterRecord.FFI.withPtr false ---> GBool.FFI.fromVal) iterHasChild_ (self & iter)
    fun iterNChildren self iter = (GtkTreeModelClass.FFI.withPtr false &&&> GtkTreeIterRecord.FFI.withOptPtr false ---> GInt32.FFI.fromVal) iterNChildren_ (self & iter)
    fun iterNext self iter = (GtkTreeModelClass.FFI.withPtr false &&&> GtkTreeIterRecord.FFI.withPtr false ---> GBool.FFI.fromVal) iterNext_ (self & iter)
    fun iterNthChild self (parent, n) =
      let
        val iter & retVal =
          (
            GtkTreeModelClass.FFI.withPtr false
             &&&> GtkTreeIterRecord.FFI.withNewPtr
             &&&> GtkTreeIterRecord.FFI.withOptPtr false
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
            GtkTreeModelClass.FFI.withPtr false
             &&&> GtkTreeIterRecord.FFI.withNewPtr
             &&&> GtkTreeIterRecord.FFI.withPtr false
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
    fun iterPrevious self iter = (GtkTreeModelClass.FFI.withPtr false &&&> GtkTreeIterRecord.FFI.withPtr false ---> GBool.FFI.fromVal) iterPrevious_ (self & iter)
    fun refNode self iter = (GtkTreeModelClass.FFI.withPtr false &&&> GtkTreeIterRecord.FFI.withPtr false ---> I) refNode_ (self & iter)
    fun rowChanged self (path, iter) =
      (
        GtkTreeModelClass.FFI.withPtr false
         &&&> GtkTreePathRecord.FFI.withPtr false
         &&&> GtkTreeIterRecord.FFI.withPtr false
         ---> I
      )
        rowChanged_
        (
          self
           & path
           & iter
        )
    fun rowDeleted self path = (GtkTreeModelClass.FFI.withPtr false &&&> GtkTreePathRecord.FFI.withPtr false ---> I) rowDeleted_ (self & path)
    fun rowHasChildToggled self (path, iter) =
      (
        GtkTreeModelClass.FFI.withPtr false
         &&&> GtkTreePathRecord.FFI.withPtr false
         &&&> GtkTreeIterRecord.FFI.withPtr false
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
        GtkTreeModelClass.FFI.withPtr false
         &&&> GtkTreePathRecord.FFI.withPtr false
         &&&> GtkTreeIterRecord.FFI.withPtr false
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
            GtkTreeModelClass.FFI.withPtr false
             &&&> GtkTreePathRecord.FFI.withPtr false
             &&&> GtkTreeIterRecord.FFI.withOptPtr false
             &&&> GInt32CArrayN.FFI.withPtr 0
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
    fun sortNewWithModel self = (GtkTreeModelClass.FFI.withPtr false ---> GtkTreeModelClass.FFI.fromPtr true) sortNewWithModel_ self
    fun unrefNode self iter = (GtkTreeModelClass.FFI.withPtr false &&&> GtkTreeIterRecord.FFI.withPtr false ---> I) unrefNode_ (self & iter)
    local
      open ClosureMarshal Signal
    in
      fun rowChangedSig f = signal "row-changed" (get 0w1 GtkTreePathRecord.t &&&> get 0w2 GtkTreeIterRecord.t ---> ret_void) (fn path & iter => f (path, iter))
      fun rowDeletedSig f = signal "row-deleted" (get 0w1 GtkTreePathRecord.t ---> ret_void) f
      fun rowHasChildToggledSig f = signal "row-has-child-toggled" (get 0w1 GtkTreePathRecord.t &&&> get 0w2 GtkTreeIterRecord.t ---> ret_void) (fn path & iter => f (path, iter))
      fun rowInsertedSig f = signal "row-inserted" (get 0w1 GtkTreePathRecord.t &&&> get 0w2 GtkTreeIterRecord.t ---> ret_void) (fn path & iter => f (path, iter))
    end
  end
