structure GtkRecentChooser :>
  GTK_RECENT_CHOOSER
    where type 'a class = 'a GtkRecentChooserClass.class
    where type recent_info_t = GtkRecentInfoRecord.t
    where type 'a recent_filter_class = 'a GtkRecentFilterClass.class
    where type 'a recent_manager_class = 'a GtkRecentManagerClass.class
    where type recent_sort_type_t = GtkRecentSortType.t =
  struct
    val getType_ = _import "gtk_recent_chooser_get_type" : unit -> GObjectType.FFI.val_;
    val addFilter_ = fn x1 & x2 => (_import "gtk_recent_chooser_add_filter" : GtkRecentChooserClass.FFI.non_opt GtkRecentChooserClass.FFI.p * GtkRecentFilterClass.FFI.non_opt GtkRecentFilterClass.FFI.p -> unit;) (x1, x2)
    val getCurrentItem_ = _import "gtk_recent_chooser_get_current_item" : GtkRecentChooserClass.FFI.non_opt GtkRecentChooserClass.FFI.p -> GtkRecentInfoRecord.FFI.non_opt GtkRecentInfoRecord.FFI.p;
    val getCurrentUri_ = _import "gtk_recent_chooser_get_current_uri" : GtkRecentChooserClass.FFI.non_opt GtkRecentChooserClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getFilter_ = _import "gtk_recent_chooser_get_filter" : GtkRecentChooserClass.FFI.non_opt GtkRecentChooserClass.FFI.p -> GtkRecentFilterClass.FFI.non_opt GtkRecentFilterClass.FFI.p;
    val getLimit_ = _import "gtk_recent_chooser_get_limit" : GtkRecentChooserClass.FFI.non_opt GtkRecentChooserClass.FFI.p -> GInt.FFI.val_;
    val getLocalOnly_ = _import "gtk_recent_chooser_get_local_only" : GtkRecentChooserClass.FFI.non_opt GtkRecentChooserClass.FFI.p -> GBool.FFI.val_;
    val getSelectMultiple_ = _import "gtk_recent_chooser_get_select_multiple" : GtkRecentChooserClass.FFI.non_opt GtkRecentChooserClass.FFI.p -> GBool.FFI.val_;
    val getShowIcons_ = _import "gtk_recent_chooser_get_show_icons" : GtkRecentChooserClass.FFI.non_opt GtkRecentChooserClass.FFI.p -> GBool.FFI.val_;
    val getShowNotFound_ = _import "gtk_recent_chooser_get_show_not_found" : GtkRecentChooserClass.FFI.non_opt GtkRecentChooserClass.FFI.p -> GBool.FFI.val_;
    val getShowPrivate_ = _import "gtk_recent_chooser_get_show_private" : GtkRecentChooserClass.FFI.non_opt GtkRecentChooserClass.FFI.p -> GBool.FFI.val_;
    val getShowTips_ = _import "gtk_recent_chooser_get_show_tips" : GtkRecentChooserClass.FFI.non_opt GtkRecentChooserClass.FFI.p -> GBool.FFI.val_;
    val getSortType_ = _import "gtk_recent_chooser_get_sort_type" : GtkRecentChooserClass.FFI.non_opt GtkRecentChooserClass.FFI.p -> GtkRecentSortType.FFI.val_;
    val getUris_ = fn x1 & x2 => (_import "gtk_recent_chooser_get_uris" : GtkRecentChooserClass.FFI.non_opt GtkRecentChooserClass.FFI.p * GSize.FFI.ref_ -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;) (x1, x2)
    val removeFilter_ = fn x1 & x2 => (_import "gtk_recent_chooser_remove_filter" : GtkRecentChooserClass.FFI.non_opt GtkRecentChooserClass.FFI.p * GtkRecentFilterClass.FFI.non_opt GtkRecentFilterClass.FFI.p -> unit;) (x1, x2)
    val selectAll_ = _import "gtk_recent_chooser_select_all" : GtkRecentChooserClass.FFI.non_opt GtkRecentChooserClass.FFI.p -> unit;
    val selectUri_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_recent_chooser_select_uri" :
              GtkRecentChooserClass.FFI.non_opt GtkRecentChooserClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GtkRecentChooserClass.FFI.non_opt GtkRecentChooserClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setFilter_ = fn x1 & x2 => (_import "gtk_recent_chooser_set_filter" : GtkRecentChooserClass.FFI.non_opt GtkRecentChooserClass.FFI.p * GtkRecentFilterClass.FFI.opt GtkRecentFilterClass.FFI.p -> unit;) (x1, x2)
    val setLimit_ = fn x1 & x2 => (_import "gtk_recent_chooser_set_limit" : GtkRecentChooserClass.FFI.non_opt GtkRecentChooserClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setLocalOnly_ = fn x1 & x2 => (_import "gtk_recent_chooser_set_local_only" : GtkRecentChooserClass.FFI.non_opt GtkRecentChooserClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setSelectMultiple_ = fn x1 & x2 => (_import "gtk_recent_chooser_set_select_multiple" : GtkRecentChooserClass.FFI.non_opt GtkRecentChooserClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setShowIcons_ = fn x1 & x2 => (_import "gtk_recent_chooser_set_show_icons" : GtkRecentChooserClass.FFI.non_opt GtkRecentChooserClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setShowNotFound_ = fn x1 & x2 => (_import "gtk_recent_chooser_set_show_not_found" : GtkRecentChooserClass.FFI.non_opt GtkRecentChooserClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setShowPrivate_ = fn x1 & x2 => (_import "gtk_recent_chooser_set_show_private" : GtkRecentChooserClass.FFI.non_opt GtkRecentChooserClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setShowTips_ = fn x1 & x2 => (_import "gtk_recent_chooser_set_show_tips" : GtkRecentChooserClass.FFI.non_opt GtkRecentChooserClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setSortType_ = fn x1 & x2 => (_import "gtk_recent_chooser_set_sort_type" : GtkRecentChooserClass.FFI.non_opt GtkRecentChooserClass.FFI.p * GtkRecentSortType.FFI.val_ -> unit;) (x1, x2)
    val unselectAll_ = _import "gtk_recent_chooser_unselect_all" : GtkRecentChooserClass.FFI.non_opt GtkRecentChooserClass.FFI.p -> unit;
    val unselectUri_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_recent_chooser_unselect_uri" :
              GtkRecentChooserClass.FFI.non_opt GtkRecentChooserClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
    fun addFilter self filter = (GtkRecentChooserClass.FFI.withPtr false &&&> GtkRecentFilterClass.FFI.withPtr false ---> I) addFilter_ (self & filter)
    fun getCurrentItem self = (GtkRecentChooserClass.FFI.withPtr false ---> GtkRecentInfoRecord.FFI.fromPtr true) getCurrentItem_ self
    fun getCurrentUri self = (GtkRecentChooserClass.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) getCurrentUri_ self
    fun getFilter self = (GtkRecentChooserClass.FFI.withPtr false ---> GtkRecentFilterClass.FFI.fromPtr false) getFilter_ self
    fun getLimit self = (GtkRecentChooserClass.FFI.withPtr false ---> GInt.FFI.fromVal) getLimit_ self
    fun getLocalOnly self = (GtkRecentChooserClass.FFI.withPtr false ---> GBool.FFI.fromVal) getLocalOnly_ self
    fun getSelectMultiple self = (GtkRecentChooserClass.FFI.withPtr false ---> GBool.FFI.fromVal) getSelectMultiple_ self
    fun getShowIcons self = (GtkRecentChooserClass.FFI.withPtr false ---> GBool.FFI.fromVal) getShowIcons_ self
    fun getShowNotFound self = (GtkRecentChooserClass.FFI.withPtr false ---> GBool.FFI.fromVal) getShowNotFound_ self
    fun getShowPrivate self = (GtkRecentChooserClass.FFI.withPtr false ---> GBool.FFI.fromVal) getShowPrivate_ self
    fun getShowTips self = (GtkRecentChooserClass.FFI.withPtr false ---> GBool.FFI.fromVal) getShowTips_ self
    fun getSortType self = (GtkRecentChooserClass.FFI.withPtr false ---> GtkRecentSortType.FFI.fromVal) getSortType_ self
    fun getUris self =
      let
        val _ & retVal = (GtkRecentChooserClass.FFI.withPtr false &&&> GSize.FFI.withRefVal ---> GSize.FFI.fromVal && Utf8CPtrArray.FFI.fromPtr ~1) getUris_ (self & GSize.null)
      in
        retVal
      end
    fun removeFilter self filter = (GtkRecentChooserClass.FFI.withPtr false &&&> GtkRecentFilterClass.FFI.withPtr false ---> I) removeFilter_ (self & filter)
    fun selectAll self = (GtkRecentChooserClass.FFI.withPtr false ---> I) selectAll_ self
    fun selectUri self uri =
      (
        GtkRecentChooserClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
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
        GtkRecentChooserClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        setCurrentUri_
        (
          self
           & uri
           & []
        )
    fun setFilter self filter = (GtkRecentChooserClass.FFI.withPtr false &&&> GtkRecentFilterClass.FFI.withOptPtr false ---> I) setFilter_ (self & filter)
    fun setLimit self limit = (GtkRecentChooserClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setLimit_ (self & limit)
    fun setLocalOnly self localOnly = (GtkRecentChooserClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setLocalOnly_ (self & localOnly)
    fun setSelectMultiple self selectMultiple = (GtkRecentChooserClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setSelectMultiple_ (self & selectMultiple)
    fun setShowIcons self showIcons = (GtkRecentChooserClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setShowIcons_ (self & showIcons)
    fun setShowNotFound self showNotFound = (GtkRecentChooserClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setShowNotFound_ (self & showNotFound)
    fun setShowPrivate self showPrivate = (GtkRecentChooserClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setShowPrivate_ (self & showPrivate)
    fun setShowTips self showTips = (GtkRecentChooserClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setShowTips_ (self & showTips)
    fun setSortType self sortType = (GtkRecentChooserClass.FFI.withPtr false &&&> GtkRecentSortType.FFI.withVal ---> I) setSortType_ (self & sortType)
    fun unselectAll self = (GtkRecentChooserClass.FFI.withPtr false ---> I) unselectAll_ self
    fun unselectUri self uri = (GtkRecentChooserClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) unselectUri_ (self & uri)
    local
      open ClosureMarshal Signal
    in
      fun itemActivatedSig f = signal "item-activated" (void ---> ret_void) f
      fun selectionChangedSig f = signal "selection-changed" (void ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val filterProp =
        {
          name = "filter",
          gtype = fn () => C.gtype GtkRecentFilterClass.tOpt (),
          get = fn x => fn () => C.get GtkRecentFilterClass.tOpt x,
          set = fn x => C.set GtkRecentFilterClass.tOpt x,
          init = fn x => C.set GtkRecentFilterClass.tOpt x
        }
      val limitProp =
        {
          name = "limit",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val localOnlyProp =
        {
          name = "local-only",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val recentManagerProp =
        {
          name = "recent-manager",
          gtype = fn () => C.gtype GtkRecentManagerClass.tOpt (),
          get = ignore,
          set = ignore,
          init = fn x => C.set GtkRecentManagerClass.tOpt x
        }
      val selectMultipleProp =
        {
          name = "select-multiple",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val showIconsProp =
        {
          name = "show-icons",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val showNotFoundProp =
        {
          name = "show-not-found",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val showPrivateProp =
        {
          name = "show-private",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val showTipsProp =
        {
          name = "show-tips",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val sortTypeProp =
        {
          name = "sort-type",
          gtype = fn () => C.gtype GtkRecentSortType.t (),
          get = fn x => fn () => C.get GtkRecentSortType.t x,
          set = fn x => C.set GtkRecentSortType.t x,
          init = fn x => C.set GtkRecentSortType.t x
        }
    end
  end
