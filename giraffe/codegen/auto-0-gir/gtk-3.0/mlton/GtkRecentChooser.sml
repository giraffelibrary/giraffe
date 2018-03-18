structure GtkRecentChooser :>
  GTK_RECENT_CHOOSER
    where type 'a class = 'a GtkRecentChooserClass.class
    where type recent_info_t = GtkRecentInfoRecord.t
    where type 'a recent_filter_class = 'a GtkRecentFilterClass.class
    where type 'a recent_manager_class = 'a GtkRecentManagerClass.class
    where type recent_sort_type_t = GtkRecentSortType.t =
  struct
    structure Utf8CVectorNType =
      CPointerCVectorNType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVectorN = CVectorN(Utf8CVectorNType)
    val getType_ = _import "gtk_recent_chooser_get_type" : unit -> GObjectType.FFI.val_;
    val addFilter_ = fn x1 & x2 => (_import "gtk_recent_chooser_add_filter" : GtkRecentChooserClass.FFI.notnull GtkRecentChooserClass.FFI.p * GtkRecentFilterClass.FFI.notnull GtkRecentFilterClass.FFI.p -> unit;) (x1, x2)
    val getCurrentItem_ = _import "gtk_recent_chooser_get_current_item" : GtkRecentChooserClass.FFI.notnull GtkRecentChooserClass.FFI.p -> GtkRecentInfoRecord.FFI.notnull GtkRecentInfoRecord.FFI.p;
    val getCurrentUri_ = _import "gtk_recent_chooser_get_current_uri" : GtkRecentChooserClass.FFI.notnull GtkRecentChooserClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getFilter_ = _import "gtk_recent_chooser_get_filter" : GtkRecentChooserClass.FFI.notnull GtkRecentChooserClass.FFI.p -> GtkRecentFilterClass.FFI.notnull GtkRecentFilterClass.FFI.p;
    val getLimit_ = _import "gtk_recent_chooser_get_limit" : GtkRecentChooserClass.FFI.notnull GtkRecentChooserClass.FFI.p -> GInt.FFI.val_;
    val getLocalOnly_ = _import "gtk_recent_chooser_get_local_only" : GtkRecentChooserClass.FFI.notnull GtkRecentChooserClass.FFI.p -> GBool.FFI.val_;
    val getSelectMultiple_ = _import "gtk_recent_chooser_get_select_multiple" : GtkRecentChooserClass.FFI.notnull GtkRecentChooserClass.FFI.p -> GBool.FFI.val_;
    val getShowIcons_ = _import "gtk_recent_chooser_get_show_icons" : GtkRecentChooserClass.FFI.notnull GtkRecentChooserClass.FFI.p -> GBool.FFI.val_;
    val getShowNotFound_ = _import "gtk_recent_chooser_get_show_not_found" : GtkRecentChooserClass.FFI.notnull GtkRecentChooserClass.FFI.p -> GBool.FFI.val_;
    val getShowPrivate_ = _import "gtk_recent_chooser_get_show_private" : GtkRecentChooserClass.FFI.notnull GtkRecentChooserClass.FFI.p -> GBool.FFI.val_;
    val getShowTips_ = _import "gtk_recent_chooser_get_show_tips" : GtkRecentChooserClass.FFI.notnull GtkRecentChooserClass.FFI.p -> GBool.FFI.val_;
    val getSortType_ = _import "gtk_recent_chooser_get_sort_type" : GtkRecentChooserClass.FFI.notnull GtkRecentChooserClass.FFI.p -> GtkRecentSortType.FFI.val_;
    val getUris_ = fn x1 & x2 => (_import "gtk_recent_chooser_get_uris" : GtkRecentChooserClass.FFI.notnull GtkRecentChooserClass.FFI.p * GSize.FFI.ref_ -> Utf8CVectorN.FFI.notnull Utf8CVectorN.FFI.out_p;) (x1, x2)
    val removeFilter_ = fn x1 & x2 => (_import "gtk_recent_chooser_remove_filter" : GtkRecentChooserClass.FFI.notnull GtkRecentChooserClass.FFI.p * GtkRecentFilterClass.FFI.notnull GtkRecentFilterClass.FFI.p -> unit;) (x1, x2)
    val selectAll_ = _import "gtk_recent_chooser_select_all" : GtkRecentChooserClass.FFI.notnull GtkRecentChooserClass.FFI.p -> unit;
    val selectUri_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_recent_chooser_select_uri" :
              GtkRecentChooserClass.FFI.notnull GtkRecentChooserClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setCurrentUri_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_recent_chooser_set_current_uri" :
              GtkRecentChooserClass.FFI.notnull GtkRecentChooserClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setFilter_ = fn x1 & x2 => (_import "gtk_recent_chooser_set_filter" : GtkRecentChooserClass.FFI.notnull GtkRecentChooserClass.FFI.p * unit GtkRecentFilterClass.FFI.p -> unit;) (x1, x2)
    val setLimit_ = fn x1 & x2 => (_import "gtk_recent_chooser_set_limit" : GtkRecentChooserClass.FFI.notnull GtkRecentChooserClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setLocalOnly_ = fn x1 & x2 => (_import "gtk_recent_chooser_set_local_only" : GtkRecentChooserClass.FFI.notnull GtkRecentChooserClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setSelectMultiple_ = fn x1 & x2 => (_import "gtk_recent_chooser_set_select_multiple" : GtkRecentChooserClass.FFI.notnull GtkRecentChooserClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setShowIcons_ = fn x1 & x2 => (_import "gtk_recent_chooser_set_show_icons" : GtkRecentChooserClass.FFI.notnull GtkRecentChooserClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setShowNotFound_ = fn x1 & x2 => (_import "gtk_recent_chooser_set_show_not_found" : GtkRecentChooserClass.FFI.notnull GtkRecentChooserClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setShowPrivate_ = fn x1 & x2 => (_import "gtk_recent_chooser_set_show_private" : GtkRecentChooserClass.FFI.notnull GtkRecentChooserClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setShowTips_ = fn x1 & x2 => (_import "gtk_recent_chooser_set_show_tips" : GtkRecentChooserClass.FFI.notnull GtkRecentChooserClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setSortType_ = fn x1 & x2 => (_import "gtk_recent_chooser_set_sort_type" : GtkRecentChooserClass.FFI.notnull GtkRecentChooserClass.FFI.p * GtkRecentSortType.FFI.val_ -> unit;) (x1, x2)
    val unselectAll_ = _import "gtk_recent_chooser_unselect_all" : GtkRecentChooserClass.FFI.notnull GtkRecentChooserClass.FFI.p -> unit;
    val unselectUri_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_recent_chooser_unselect_uri" :
              GtkRecentChooserClass.FFI.notnull GtkRecentChooserClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkRecentChooserClass.class
    type recent_info_t = GtkRecentInfoRecord.t
    type 'a recent_filter_class = 'a GtkRecentFilterClass.class
    type 'a recent_manager_class = 'a GtkRecentManagerClass.class
    type recent_sort_type_t = GtkRecentSortType.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun addFilter self filter = (GtkRecentChooserClass.FFI.withPtr &&&> GtkRecentFilterClass.FFI.withPtr ---> I) addFilter_ (self & filter)
    fun getCurrentItem self = (GtkRecentChooserClass.FFI.withPtr ---> GtkRecentInfoRecord.FFI.fromPtr true) getCurrentItem_ self
    fun getCurrentUri self = (GtkRecentChooserClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getCurrentUri_ self
    fun getFilter self = (GtkRecentChooserClass.FFI.withPtr ---> GtkRecentFilterClass.FFI.fromPtr false) getFilter_ self
    fun getLimit self = (GtkRecentChooserClass.FFI.withPtr ---> GInt.FFI.fromVal) getLimit_ self
    fun getLocalOnly self = (GtkRecentChooserClass.FFI.withPtr ---> GBool.FFI.fromVal) getLocalOnly_ self
    fun getSelectMultiple self = (GtkRecentChooserClass.FFI.withPtr ---> GBool.FFI.fromVal) getSelectMultiple_ self
    fun getShowIcons self = (GtkRecentChooserClass.FFI.withPtr ---> GBool.FFI.fromVal) getShowIcons_ self
    fun getShowNotFound self = (GtkRecentChooserClass.FFI.withPtr ---> GBool.FFI.fromVal) getShowNotFound_ self
    fun getShowPrivate self = (GtkRecentChooserClass.FFI.withPtr ---> GBool.FFI.fromVal) getShowPrivate_ self
    fun getShowTips self = (GtkRecentChooserClass.FFI.withPtr ---> GBool.FFI.fromVal) getShowTips_ self
    fun getSortType self = (GtkRecentChooserClass.FFI.withPtr ---> GtkRecentSortType.FFI.fromVal) getSortType_ self
    fun getUris self =
      let
        val length & retVal = (GtkRecentChooserClass.FFI.withPtr &&&> GSize.FFI.withRefVal ---> GSize.FFI.fromVal && Utf8CVectorN.FFI.fromPtr 2) getUris_ (self & GSize.null)
      in
        retVal (LargeInt.toInt length)
      end
    fun removeFilter self filter = (GtkRecentChooserClass.FFI.withPtr &&&> GtkRecentFilterClass.FFI.withPtr ---> I) removeFilter_ (self & filter)
    fun selectAll self = (GtkRecentChooserClass.FFI.withPtr ---> I) selectAll_ self
    fun selectUri self uri =
      (
        GtkRecentChooserClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        selectUri_
        (
          self
           & uri
           & []
        )
    fun setCurrentUri self uri =
      (
        GtkRecentChooserClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        setCurrentUri_
        (
          self
           & uri
           & []
        )
    fun setFilter self filter = (GtkRecentChooserClass.FFI.withPtr &&&> GtkRecentFilterClass.FFI.withOptPtr ---> I) setFilter_ (self & filter)
    fun setLimit self limit = (GtkRecentChooserClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setLimit_ (self & limit)
    fun setLocalOnly self localOnly = (GtkRecentChooserClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setLocalOnly_ (self & localOnly)
    fun setSelectMultiple self selectMultiple = (GtkRecentChooserClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setSelectMultiple_ (self & selectMultiple)
    fun setShowIcons self showIcons = (GtkRecentChooserClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setShowIcons_ (self & showIcons)
    fun setShowNotFound self showNotFound = (GtkRecentChooserClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setShowNotFound_ (self & showNotFound)
    fun setShowPrivate self showPrivate = (GtkRecentChooserClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setShowPrivate_ (self & showPrivate)
    fun setShowTips self showTips = (GtkRecentChooserClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setShowTips_ (self & showTips)
    fun setSortType self sortType = (GtkRecentChooserClass.FFI.withPtr &&&> GtkRecentSortType.FFI.withVal ---> I) setSortType_ (self & sortType)
    fun unselectAll self = (GtkRecentChooserClass.FFI.withPtr ---> I) unselectAll_ self
    fun unselectUri self uri = (GtkRecentChooserClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) unselectUri_ (self & uri)
    local
      open ClosureMarshal Signal
    in
      fun itemActivatedSig f = signal "item-activated" (void ---> ret_void) f
      fun selectionChangedSig f = signal "selection-changed" (void ---> ret_void) f
    end
    local
      open Property
    in
      val filterProp =
        {
          get = fn x => get "filter" GtkRecentFilterClass.tOpt x,
          set = fn x => set "filter" GtkRecentFilterClass.tOpt x,
          new = fn x => new "filter" GtkRecentFilterClass.tOpt x
        }
      val limitProp =
        {
          get = fn x => get "limit" int x,
          set = fn x => set "limit" int x,
          new = fn x => new "limit" int x
        }
      val localOnlyProp =
        {
          get = fn x => get "local-only" boolean x,
          set = fn x => set "local-only" boolean x,
          new = fn x => new "local-only" boolean x
        }
      val recentManagerProp = {new = fn x => new "recent-manager" GtkRecentManagerClass.tOpt x}
      val selectMultipleProp =
        {
          get = fn x => get "select-multiple" boolean x,
          set = fn x => set "select-multiple" boolean x,
          new = fn x => new "select-multiple" boolean x
        }
      val showIconsProp =
        {
          get = fn x => get "show-icons" boolean x,
          set = fn x => set "show-icons" boolean x,
          new = fn x => new "show-icons" boolean x
        }
      val showNotFoundProp =
        {
          get = fn x => get "show-not-found" boolean x,
          set = fn x => set "show-not-found" boolean x,
          new = fn x => new "show-not-found" boolean x
        }
      val showPrivateProp =
        {
          get = fn x => get "show-private" boolean x,
          set = fn x => set "show-private" boolean x,
          new = fn x => new "show-private" boolean x
        }
      val showTipsProp =
        {
          get = fn x => get "show-tips" boolean x,
          set = fn x => set "show-tips" boolean x,
          new = fn x => new "show-tips" boolean x
        }
      val sortTypeProp =
        {
          get = fn x => get "sort-type" GtkRecentSortType.t x,
          set = fn x => set "sort-type" GtkRecentSortType.t x,
          new = fn x => new "sort-type" GtkRecentSortType.t x
        }
    end
  end
