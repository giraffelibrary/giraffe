structure GtkTreeSortable :>
  GTK_TREE_SORTABLE
    where type 'a class = 'a GtkTreeSortableClass.class
    where type sort_type_t = GtkSortType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_tree_sortable_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getSortColumnId_ =
        call (getSymbol "gtk_tree_sortable_get_sort_column_id")
          (
            GtkTreeSortableClass.PolyML.cPtr
             &&> GInt32.PolyML.cRef
             &&> GtkSortType.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val hasDefaultSortFunc_ = call (getSymbol "gtk_tree_sortable_has_default_sort_func") (GtkTreeSortableClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setSortColumnId_ =
        call (getSymbol "gtk_tree_sortable_set_sort_column_id")
          (
            GtkTreeSortableClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GtkSortType.PolyML.cVal
             --> cVoid
          )
      val sortColumnChanged_ = call (getSymbol "gtk_tree_sortable_sort_column_changed") (GtkTreeSortableClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GtkTreeSortableClass.class
    type sort_type_t = GtkSortType.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getSortColumnId self =
      let
        val sortColumnId
         & order
         & retVal =
          (
            GtkTreeSortableClass.FFI.withPtr false
             &&&> GInt32.FFI.withRefVal
             &&&> GtkSortType.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GtkSortType.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            getSortColumnId_
            (
              self
               & GInt32.null
               & GtkSortType.null
            )
      in
        if retVal then SOME (sortColumnId, order) else NONE
      end
    fun hasDefaultSortFunc self = (GtkTreeSortableClass.FFI.withPtr false ---> GBool.FFI.fromVal) hasDefaultSortFunc_ self
    fun setSortColumnId self (sortColumnId, order) =
      (
        GtkTreeSortableClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GtkSortType.FFI.withVal
         ---> I
      )
        setSortColumnId_
        (
          self
           & sortColumnId
           & order
        )
    fun sortColumnChanged self = (GtkTreeSortableClass.FFI.withPtr false ---> I) sortColumnChanged_ self
    local
      open ClosureMarshal Signal
    in
      fun sortColumnChangedSig f = signal "sort-column-changed" (void ---> ret_void) f
    end
  end
