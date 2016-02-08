structure GtkRecentChooser :>
  GTK_RECENT_CHOOSER
    where type 'a class_t = 'a GtkRecentChooserClass.t
    where type recent_info_record_t = GtkRecentInfoRecord.t
    where type 'a recent_filter_class_t = 'a GtkRecentFilterClass.t
    where type 'a recent_manager_class_t = 'a GtkRecentManagerClass.t
    where type recent_sort_type_t = GtkRecentSortType.t =
  struct
    val getType_ = _import "gtk_recent_chooser_get_type" : unit -> GObjectType.C.val_;
    val addFilter_ = fn x1 & x2 => (_import "gtk_recent_chooser_add_filter" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val getCurrentItem_ = _import "gtk_recent_chooser_get_current_item" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p;
    val getCurrentUri_ = _import "gtk_recent_chooser_get_current_uri" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getFilter_ = _import "gtk_recent_chooser_get_filter" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getLimit_ = _import "gtk_recent_chooser_get_limit" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val getLocalOnly_ = _import "gtk_recent_chooser_get_local_only" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getSelectMultiple_ = _import "gtk_recent_chooser_get_select_multiple" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getShowIcons_ = _import "gtk_recent_chooser_get_show_icons" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getShowNotFound_ = _import "gtk_recent_chooser_get_show_not_found" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getShowPrivate_ = _import "gtk_recent_chooser_get_show_private" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getShowTips_ = _import "gtk_recent_chooser_get_show_tips" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getSortType_ = _import "gtk_recent_chooser_get_sort_type" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkRecentSortType.C.val_;
    val removeFilter_ = fn x1 & x2 => (_import "gtk_recent_chooser_remove_filter" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val selectAll_ = _import "gtk_recent_chooser_select_all" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val selectUri_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_recent_chooser_select_uri" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setFilter_ = fn x1 & x2 => (_import "gtk_recent_chooser_set_filter" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setLimit_ = fn x1 & x2 => (_import "gtk_recent_chooser_set_limit" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setLocalOnly_ = fn x1 & x2 => (_import "gtk_recent_chooser_set_local_only" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setSelectMultiple_ = fn x1 & x2 => (_import "gtk_recent_chooser_set_select_multiple" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setShowIcons_ = fn x1 & x2 => (_import "gtk_recent_chooser_set_show_icons" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setShowNotFound_ = fn x1 & x2 => (_import "gtk_recent_chooser_set_show_not_found" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setShowPrivate_ = fn x1 & x2 => (_import "gtk_recent_chooser_set_show_private" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setShowTips_ = fn x1 & x2 => (_import "gtk_recent_chooser_set_show_tips" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setSortType_ = fn x1 & x2 => (_import "gtk_recent_chooser_set_sort_type" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkRecentSortType.C.val_ -> unit;) (x1, x2)
    val unselectAll_ = _import "gtk_recent_chooser_unselect_all" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val unselectUri_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_recent_chooser_unselect_uri" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class_t = 'a GtkRecentChooserClass.t
    type recent_info_record_t = GtkRecentInfoRecord.t
    type 'a recent_filter_class_t = 'a GtkRecentFilterClass.t
    type 'a recent_manager_class_t = 'a GtkRecentManagerClass.t
    type recent_sort_type_t = GtkRecentSortType.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun addFilter self filter = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) addFilter_ (self & filter)
    fun getCurrentItem self = (GObjectObjectClass.C.withPtr ---> GtkRecentInfoRecord.C.fromPtr true) getCurrentItem_ self
    fun getCurrentUri self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) getCurrentUri_ self
    fun getFilter self = (GObjectObjectClass.C.withPtr ---> GtkRecentFilterClass.C.fromPtr false) getFilter_ self
    fun getLimit self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getLimit_ self
    fun getLocalOnly self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getLocalOnly_ self
    fun getSelectMultiple self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getSelectMultiple_ self
    fun getShowIcons self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowIcons_ self
    fun getShowNotFound self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowNotFound_ self
    fun getShowPrivate self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowPrivate_ self
    fun getShowTips self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowTips_ self
    fun getSortType self = (GObjectObjectClass.C.withPtr ---> GtkRecentSortType.C.fromVal) getSortType_ self
    fun removeFilter self filter = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) removeFilter_ (self & filter)
    fun selectAll self = (GObjectObjectClass.C.withPtr ---> I) selectAll_ self
    fun selectUri self uri =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withConstPtr
         &&&> GLibErrorRecord.C.handleError
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
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        setCurrentUri_
        (
          self
           & uri
           & []
        )
    fun setFilter self filter = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setFilter_ (self & filter)
    fun setLimit self limit = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setLimit_ (self & limit)
    fun setLocalOnly self localOnly = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setLocalOnly_ (self & localOnly)
    fun setSelectMultiple self selectMultiple = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSelectMultiple_ (self & selectMultiple)
    fun setShowIcons self showIcons = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowIcons_ (self & showIcons)
    fun setShowNotFound self showNotFound = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowNotFound_ (self & showNotFound)
    fun setShowPrivate self showPrivate = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowPrivate_ (self & showPrivate)
    fun setShowTips self showTips = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowTips_ (self & showTips)
    fun setSortType self sortType = (GObjectObjectClass.C.withPtr &&&> GtkRecentSortType.C.withVal ---> I) setSortType_ (self & sortType)
    fun unselectAll self = (GObjectObjectClass.C.withPtr ---> I) unselectAll_ self
    fun unselectUri self uri = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstPtr ---> I) unselectUri_ (self & uri)
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
