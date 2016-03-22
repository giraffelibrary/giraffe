structure GtkRecentChooser :>
  GTK_RECENT_CHOOSER
    where type 'a class = 'a GtkRecentChooserClass.class
    where type recent_info_t = GtkRecentInfoRecord.t
    where type 'a recent_filter_class = 'a GtkRecentFilterClass.class
    where type 'a recent_manager_class = 'a GtkRecentManagerClass.class
    where type recent_sort_type_t = GtkRecentSortType.t =
  struct
    val getType_ = _import "gtk_recent_chooser_get_type" : unit -> GObjectType.C.val_;
    val addFilter_ = fn x1 & x2 => (_import "gtk_recent_chooser_add_filter" : GtkRecentChooserClass.C.notnull GtkRecentChooserClass.C.p * GtkRecentFilterClass.C.notnull GtkRecentFilterClass.C.p -> unit;) (x1, x2)
    val getCurrentItem_ = _import "gtk_recent_chooser_get_current_item" : GtkRecentChooserClass.C.notnull GtkRecentChooserClass.C.p -> GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p;
    val getCurrentUri_ = _import "gtk_recent_chooser_get_current_uri" : GtkRecentChooserClass.C.notnull GtkRecentChooserClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getFilter_ = _import "gtk_recent_chooser_get_filter" : GtkRecentChooserClass.C.notnull GtkRecentChooserClass.C.p -> GtkRecentFilterClass.C.notnull GtkRecentFilterClass.C.p;
    val getLimit_ = _import "gtk_recent_chooser_get_limit" : GtkRecentChooserClass.C.notnull GtkRecentChooserClass.C.p -> FFI.Int.C.val_;
    val getLocalOnly_ = _import "gtk_recent_chooser_get_local_only" : GtkRecentChooserClass.C.notnull GtkRecentChooserClass.C.p -> FFI.Bool.C.val_;
    val getSelectMultiple_ = _import "gtk_recent_chooser_get_select_multiple" : GtkRecentChooserClass.C.notnull GtkRecentChooserClass.C.p -> FFI.Bool.C.val_;
    val getShowIcons_ = _import "gtk_recent_chooser_get_show_icons" : GtkRecentChooserClass.C.notnull GtkRecentChooserClass.C.p -> FFI.Bool.C.val_;
    val getShowNotFound_ = _import "gtk_recent_chooser_get_show_not_found" : GtkRecentChooserClass.C.notnull GtkRecentChooserClass.C.p -> FFI.Bool.C.val_;
    val getShowPrivate_ = _import "gtk_recent_chooser_get_show_private" : GtkRecentChooserClass.C.notnull GtkRecentChooserClass.C.p -> FFI.Bool.C.val_;
    val getShowTips_ = _import "gtk_recent_chooser_get_show_tips" : GtkRecentChooserClass.C.notnull GtkRecentChooserClass.C.p -> FFI.Bool.C.val_;
    val getSortType_ = _import "gtk_recent_chooser_get_sort_type" : GtkRecentChooserClass.C.notnull GtkRecentChooserClass.C.p -> GtkRecentSortType.C.val_;
    val removeFilter_ = fn x1 & x2 => (_import "gtk_recent_chooser_remove_filter" : GtkRecentChooserClass.C.notnull GtkRecentChooserClass.C.p * GtkRecentFilterClass.C.notnull GtkRecentFilterClass.C.p -> unit;) (x1, x2)
    val selectAll_ = _import "gtk_recent_chooser_select_all" : GtkRecentChooserClass.C.notnull GtkRecentChooserClass.C.p -> unit;
    val selectUri_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_recent_chooser_select_uri" :
              GtkRecentChooserClass.C.notnull GtkRecentChooserClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GtkRecentChooserClass.C.notnull GtkRecentChooserClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setFilter_ = fn x1 & x2 => (_import "gtk_recent_chooser_set_filter" : GtkRecentChooserClass.C.notnull GtkRecentChooserClass.C.p * GtkRecentFilterClass.C.notnull GtkRecentFilterClass.C.p -> unit;) (x1, x2)
    val setLimit_ = fn x1 & x2 => (_import "gtk_recent_chooser_set_limit" : GtkRecentChooserClass.C.notnull GtkRecentChooserClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setLocalOnly_ = fn x1 & x2 => (_import "gtk_recent_chooser_set_local_only" : GtkRecentChooserClass.C.notnull GtkRecentChooserClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setSelectMultiple_ = fn x1 & x2 => (_import "gtk_recent_chooser_set_select_multiple" : GtkRecentChooserClass.C.notnull GtkRecentChooserClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setShowIcons_ = fn x1 & x2 => (_import "gtk_recent_chooser_set_show_icons" : GtkRecentChooserClass.C.notnull GtkRecentChooserClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setShowNotFound_ = fn x1 & x2 => (_import "gtk_recent_chooser_set_show_not_found" : GtkRecentChooserClass.C.notnull GtkRecentChooserClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setShowPrivate_ = fn x1 & x2 => (_import "gtk_recent_chooser_set_show_private" : GtkRecentChooserClass.C.notnull GtkRecentChooserClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setShowTips_ = fn x1 & x2 => (_import "gtk_recent_chooser_set_show_tips" : GtkRecentChooserClass.C.notnull GtkRecentChooserClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setSortType_ = fn x1 & x2 => (_import "gtk_recent_chooser_set_sort_type" : GtkRecentChooserClass.C.notnull GtkRecentChooserClass.C.p * GtkRecentSortType.C.val_ -> unit;) (x1, x2)
    val unselectAll_ = _import "gtk_recent_chooser_unselect_all" : GtkRecentChooserClass.C.notnull GtkRecentChooserClass.C.p -> unit;
    val unselectUri_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_recent_chooser_unselect_uri" :
              GtkRecentChooserClass.C.notnull GtkRecentChooserClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun addFilter self filter = (GtkRecentChooserClass.C.withPtr &&&> GtkRecentFilterClass.C.withPtr ---> I) addFilter_ (self & filter)
    fun getCurrentItem self = (GtkRecentChooserClass.C.withPtr ---> GtkRecentInfoRecord.C.fromPtr true) getCurrentItem_ self
    fun getCurrentUri self = (GtkRecentChooserClass.C.withPtr ---> Utf8.C.fromPtr true) getCurrentUri_ self
    fun getFilter self = (GtkRecentChooserClass.C.withPtr ---> GtkRecentFilterClass.C.fromPtr false) getFilter_ self
    fun getLimit self = (GtkRecentChooserClass.C.withPtr ---> FFI.Int.C.fromVal) getLimit_ self
    fun getLocalOnly self = (GtkRecentChooserClass.C.withPtr ---> FFI.Bool.C.fromVal) getLocalOnly_ self
    fun getSelectMultiple self = (GtkRecentChooserClass.C.withPtr ---> FFI.Bool.C.fromVal) getSelectMultiple_ self
    fun getShowIcons self = (GtkRecentChooserClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowIcons_ self
    fun getShowNotFound self = (GtkRecentChooserClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowNotFound_ self
    fun getShowPrivate self = (GtkRecentChooserClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowPrivate_ self
    fun getShowTips self = (GtkRecentChooserClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowTips_ self
    fun getSortType self = (GtkRecentChooserClass.C.withPtr ---> GtkRecentSortType.C.fromVal) getSortType_ self
    fun removeFilter self filter = (GtkRecentChooserClass.C.withPtr &&&> GtkRecentFilterClass.C.withPtr ---> I) removeFilter_ (self & filter)
    fun selectAll self = (GtkRecentChooserClass.C.withPtr ---> I) selectAll_ self
    fun selectUri self uri =
      (
        GtkRecentChooserClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        selectUri_
        (
          self
           & uri
           & []
        )
    fun setCurrentUri self uri =
      (
        GtkRecentChooserClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        setCurrentUri_
        (
          self
           & uri
           & []
        )
    fun setFilter self filter = (GtkRecentChooserClass.C.withPtr &&&> GtkRecentFilterClass.C.withPtr ---> I) setFilter_ (self & filter)
    fun setLimit self limit = (GtkRecentChooserClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setLimit_ (self & limit)
    fun setLocalOnly self localOnly = (GtkRecentChooserClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setLocalOnly_ (self & localOnly)
    fun setSelectMultiple self selectMultiple = (GtkRecentChooserClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSelectMultiple_ (self & selectMultiple)
    fun setShowIcons self showIcons = (GtkRecentChooserClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowIcons_ (self & showIcons)
    fun setShowNotFound self showNotFound = (GtkRecentChooserClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowNotFound_ (self & showNotFound)
    fun setShowPrivate self showPrivate = (GtkRecentChooserClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowPrivate_ (self & showPrivate)
    fun setShowTips self showTips = (GtkRecentChooserClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowTips_ (self & showTips)
    fun setSortType self sortType = (GtkRecentChooserClass.C.withPtr &&&> GtkRecentSortType.C.withVal ---> I) setSortType_ (self & sortType)
    fun unselectAll self = (GtkRecentChooserClass.C.withPtr ---> I) unselectAll_ self
    fun unselectUri self uri = (GtkRecentChooserClass.C.withPtr &&&> Utf8.C.withPtr ---> I) unselectUri_ (self & uri)
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
          set = fn x => set "filter" GtkRecentFilterClass.tOpt x
        }
      val limitProp =
        {
          get = fn x => get "limit" int x,
          set = fn x => set "limit" int x
        }
      val localOnlyProp =
        {
          get = fn x => get "local-only" boolean x,
          set = fn x => set "local-only" boolean x
        }
      val recentManagerProp = {set = fn x => set "recent-manager" GtkRecentManagerClass.tOpt x}
      val selectMultipleProp =
        {
          get = fn x => get "select-multiple" boolean x,
          set = fn x => set "select-multiple" boolean x
        }
      val showIconsProp =
        {
          get = fn x => get "show-icons" boolean x,
          set = fn x => set "show-icons" boolean x
        }
      val showNotFoundProp =
        {
          get = fn x => get "show-not-found" boolean x,
          set = fn x => set "show-not-found" boolean x
        }
      val showPrivateProp =
        {
          get = fn x => get "show-private" boolean x,
          set = fn x => set "show-private" boolean x
        }
      val showTipsProp =
        {
          get = fn x => get "show-tips" boolean x,
          set = fn x => set "show-tips" boolean x
        }
      val sortTypeProp =
        {
          get = fn x => get "sort-type" GtkRecentSortType.t x,
          set = fn x => set "sort-type" GtkRecentSortType.t x
        }
    end
  end
