structure GtkTreeSortable :>
  GTK_TREE_SORTABLE
    where type 'a class = 'a GtkTreeSortableClass.class
    where type sort_type_t = GtkSortType.t =
  struct
    val getType_ = _import "gtk_tree_sortable_get_type" : unit -> GObjectType.FFI.val_;
    val getSortColumnId_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_sortable_get_sort_column_id" :
              GtkTreeSortableClass.FFI.notnull GtkTreeSortableClass.FFI.p
               * GInt.FFI.ref_
               * GtkSortType.FFI.ref_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val hasDefaultSortFunc_ = _import "gtk_tree_sortable_has_default_sort_func" : GtkTreeSortableClass.FFI.notnull GtkTreeSortableClass.FFI.p -> GBool.FFI.val_;
    val setSortColumnId_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_sortable_set_sort_column_id" :
              GtkTreeSortableClass.FFI.notnull GtkTreeSortableClass.FFI.p
               * GInt.FFI.val_
               * GtkSortType.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val sortColumnChanged_ = _import "gtk_tree_sortable_sort_column_changed" : GtkTreeSortableClass.FFI.notnull GtkTreeSortableClass.FFI.p -> unit;
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
            GtkTreeSortableClass.FFI.withPtr
             &&&> GInt.FFI.withRefVal
             &&&> GtkSortType.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GtkSortType.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            getSortColumnId_
            (
              self
               & GInt.null
               & GtkSortType.null
            )
      in
        if retVal then SOME (sortColumnId, order) else NONE
      end
    fun hasDefaultSortFunc self = (GtkTreeSortableClass.FFI.withPtr ---> GBool.FFI.fromVal) hasDefaultSortFunc_ self
    fun setSortColumnId self sortColumnId order =
      (
        GtkTreeSortableClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GtkSortType.FFI.withVal
         ---> I
      )
        setSortColumnId_
        (
          self
           & sortColumnId
           & order
        )
    fun sortColumnChanged self = (GtkTreeSortableClass.FFI.withPtr ---> I) sortColumnChanged_ self
    local
      open ClosureMarshal Signal
    in
      fun sortColumnChangedSig f = signal "sort-column-changed" (void ---> ret_void) f
    end
  end
