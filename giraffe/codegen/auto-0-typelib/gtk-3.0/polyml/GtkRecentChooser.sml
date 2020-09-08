structure GtkRecentChooser :>
  GTK_RECENT_CHOOSER
    where type 'a class = 'a GtkRecentChooserClass.class
    where type recent_info_t = GtkRecentInfoRecord.t
    where type 'a recent_filter_class = 'a GtkRecentFilterClass.class
    where type 'a recent_manager_class = 'a GtkRecentManagerClass.class
    where type recent_sort_type_t = GtkRecentSortType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_recent_chooser_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val addFilter_ = call (getSymbol "gtk_recent_chooser_add_filter") (GtkRecentChooserClass.PolyML.cPtr &&> GtkRecentFilterClass.PolyML.cPtr --> cVoid)
      val getCurrentItem_ = call (getSymbol "gtk_recent_chooser_get_current_item") (GtkRecentChooserClass.PolyML.cPtr --> GtkRecentInfoRecord.PolyML.cPtr)
      val getCurrentUri_ = call (getSymbol "gtk_recent_chooser_get_current_uri") (GtkRecentChooserClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getFilter_ = call (getSymbol "gtk_recent_chooser_get_filter") (GtkRecentChooserClass.PolyML.cPtr --> GtkRecentFilterClass.PolyML.cPtr)
      val getLimit_ = call (getSymbol "gtk_recent_chooser_get_limit") (GtkRecentChooserClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getLocalOnly_ = call (getSymbol "gtk_recent_chooser_get_local_only") (GtkRecentChooserClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getSelectMultiple_ = call (getSymbol "gtk_recent_chooser_get_select_multiple") (GtkRecentChooserClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getShowIcons_ = call (getSymbol "gtk_recent_chooser_get_show_icons") (GtkRecentChooserClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getShowNotFound_ = call (getSymbol "gtk_recent_chooser_get_show_not_found") (GtkRecentChooserClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getShowPrivate_ = call (getSymbol "gtk_recent_chooser_get_show_private") (GtkRecentChooserClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getShowTips_ = call (getSymbol "gtk_recent_chooser_get_show_tips") (GtkRecentChooserClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getSortType_ = call (getSymbol "gtk_recent_chooser_get_sort_type") (GtkRecentChooserClass.PolyML.cPtr --> GtkRecentSortType.PolyML.cVal)
      val getUris_ = call (getSymbol "gtk_recent_chooser_get_uris") (GtkRecentChooserClass.PolyML.cPtr &&> GUInt64.PolyML.cRef --> Utf8CPtrArray.PolyML.cOutPtr)
      val removeFilter_ = call (getSymbol "gtk_recent_chooser_remove_filter") (GtkRecentChooserClass.PolyML.cPtr &&> GtkRecentFilterClass.PolyML.cPtr --> cVoid)
      val selectAll_ = call (getSymbol "gtk_recent_chooser_select_all") (GtkRecentChooserClass.PolyML.cPtr --> cVoid)
      val selectUri_ =
        call (getSymbol "gtk_recent_chooser_select_uri")
          (
            GtkRecentChooserClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val setCurrentUri_ =
        call (getSymbol "gtk_recent_chooser_set_current_uri")
          (
            GtkRecentChooserClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val setFilter_ = call (getSymbol "gtk_recent_chooser_set_filter") (GtkRecentChooserClass.PolyML.cPtr &&> GtkRecentFilterClass.PolyML.cOptPtr --> cVoid)
      val setLimit_ = call (getSymbol "gtk_recent_chooser_set_limit") (GtkRecentChooserClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val setLocalOnly_ = call (getSymbol "gtk_recent_chooser_set_local_only") (GtkRecentChooserClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setSelectMultiple_ = call (getSymbol "gtk_recent_chooser_set_select_multiple") (GtkRecentChooserClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setShowIcons_ = call (getSymbol "gtk_recent_chooser_set_show_icons") (GtkRecentChooserClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setShowNotFound_ = call (getSymbol "gtk_recent_chooser_set_show_not_found") (GtkRecentChooserClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setShowPrivate_ = call (getSymbol "gtk_recent_chooser_set_show_private") (GtkRecentChooserClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setShowTips_ = call (getSymbol "gtk_recent_chooser_set_show_tips") (GtkRecentChooserClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setSortType_ = call (getSymbol "gtk_recent_chooser_set_sort_type") (GtkRecentChooserClass.PolyML.cPtr &&> GtkRecentSortType.PolyML.cVal --> cVoid)
      val unselectAll_ = call (getSymbol "gtk_recent_chooser_unselect_all") (GtkRecentChooserClass.PolyML.cPtr --> cVoid)
      val unselectUri_ = call (getSymbol "gtk_recent_chooser_unselect_uri") (GtkRecentChooserClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
    end
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
    fun getLimit self = (GtkRecentChooserClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getLimit_ self
    fun getLocalOnly self = (GtkRecentChooserClass.FFI.withPtr false ---> GBool.FFI.fromVal) getLocalOnly_ self
    fun getSelectMultiple self = (GtkRecentChooserClass.FFI.withPtr false ---> GBool.FFI.fromVal) getSelectMultiple_ self
    fun getShowIcons self = (GtkRecentChooserClass.FFI.withPtr false ---> GBool.FFI.fromVal) getShowIcons_ self
    fun getShowNotFound self = (GtkRecentChooserClass.FFI.withPtr false ---> GBool.FFI.fromVal) getShowNotFound_ self
    fun getShowPrivate self = (GtkRecentChooserClass.FFI.withPtr false ---> GBool.FFI.fromVal) getShowPrivate_ self
    fun getShowTips self = (GtkRecentChooserClass.FFI.withPtr false ---> GBool.FFI.fromVal) getShowTips_ self
    fun getSortType self = (GtkRecentChooserClass.FFI.withPtr false ---> GtkRecentSortType.FFI.fromVal) getSortType_ self
    fun getUris self =
      let
        val _ & retVal = (GtkRecentChooserClass.FFI.withPtr false &&&> GUInt64.FFI.withRefVal ---> GUInt64.FFI.fromVal && Utf8CPtrArray.FFI.fromPtr ~1) getUris_ (self & GUInt64.null)
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
    fun setLimit self limit = (GtkRecentChooserClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setLimit_ (self & limit)
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
