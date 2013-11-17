structure GtkTreeSortable :>
  GTK_TREE_SORTABLE
    where type 'a class_t = 'a GtkTreeSortableClass.t
    where type sorttype_t = GtkSortType.t =
  struct
    val getType_ = _import "gtk_tree_sortable_get_type" : unit -> GObjectType.C.val_;
    val getSortColumnId_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_sortable_get_sort_column_id" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.C.ref_
               * GtkSortType.C.ref_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val hasDefaultSortFunc_ = _import "gtk_tree_sortable_has_default_sort_func" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val setSortColumnId_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_sortable_set_sort_column_id" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.C.val_
               * GtkSortType.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val sortColumnChanged_ = _import "gtk_tree_sortable_sort_column_changed" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    type 'a class_t = 'a GtkTreeSortableClass.t
    type sorttype_t = GtkSortType.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getSortColumnId self =
      let
        val sortColumnId
         & order
         & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> GtkSortType.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && GtkSortType.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            getSortColumnId_
            (
              self
               & 0
               & GtkSortType.null
            )
      in
        if retVal then SOME (sortColumnId, order) else NONE
      end
    fun hasDefaultSortFunc self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) hasDefaultSortFunc_ self
    fun setSortColumnId self sortColumnId order =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> GtkSortType.C.withVal
         ---> I
      )
        setSortColumnId_
        (
          self
           & sortColumnId
           & order
        )
    fun sortColumnChanged self = (GObjectObjectClass.C.withPtr ---> I) sortColumnChanged_ self
    local
      open ClosureMarshal Signal
    in
      fun sortColumnChangedSig f = signal "sort-column-changed" (void ---> ret_void) f
    end
  end
