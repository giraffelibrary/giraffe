structure GtkSearchBar :>
  GTK_SEARCH_BAR
    where type 'a class = 'a GtkSearchBarClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a entry_class = 'a GtkEntryClass.class =
  struct
    val getType_ = _import "gtk_search_bar_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_search_bar_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val connectEntry_ = fn x1 & x2 => (_import "gtk_search_bar_connect_entry" : GtkSearchBarClass.FFI.non_opt GtkSearchBarClass.FFI.p * GtkEntryClass.FFI.non_opt GtkEntryClass.FFI.p -> unit;) (x1, x2)
    val getSearchMode_ = _import "gtk_search_bar_get_search_mode" : GtkSearchBarClass.FFI.non_opt GtkSearchBarClass.FFI.p -> GBool.FFI.val_;
    val getShowCloseButton_ = _import "gtk_search_bar_get_show_close_button" : GtkSearchBarClass.FFI.non_opt GtkSearchBarClass.FFI.p -> GBool.FFI.val_;
    val handleEvent_ = fn x1 & x2 => (_import "gtk_search_bar_handle_event" : GtkSearchBarClass.FFI.non_opt GtkSearchBarClass.FFI.p * GdkEvent.FFI.non_opt GdkEvent.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val setSearchMode_ = fn x1 & x2 => (_import "gtk_search_bar_set_search_mode" : GtkSearchBarClass.FFI.non_opt GtkSearchBarClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setShowCloseButton_ = fn x1 & x2 => (_import "gtk_search_bar_set_show_close_button" : GtkSearchBarClass.FFI.non_opt GtkSearchBarClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkSearchBarClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a entry_class = 'a GtkEntryClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkSearchBarClass.FFI.fromPtr false) new_ ()
    fun connectEntry self entry = (GtkSearchBarClass.FFI.withPtr &&&> GtkEntryClass.FFI.withPtr ---> I) connectEntry_ (self & entry)
    fun getSearchMode self = (GtkSearchBarClass.FFI.withPtr ---> GBool.FFI.fromVal) getSearchMode_ self
    fun getShowCloseButton self = (GtkSearchBarClass.FFI.withPtr ---> GBool.FFI.fromVal) getShowCloseButton_ self
    fun handleEvent self event = (GtkSearchBarClass.FFI.withPtr &&&> GdkEvent.FFI.withPtr ---> GBool.FFI.fromVal) handleEvent_ (self & event)
    fun setSearchMode self searchMode = (GtkSearchBarClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setSearchMode_ (self & searchMode)
    fun setShowCloseButton self visible = (GtkSearchBarClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setShowCloseButton_ (self & visible)
    local
      open Property
    in
      val searchModeEnabledProp =
        {
          get = fn x => get "search-mode-enabled" boolean x,
          set = fn x => set "search-mode-enabled" boolean x,
          new = fn x => new "search-mode-enabled" boolean x
        }
      val showCloseButtonProp =
        {
          get = fn x => get "show-close-button" boolean x,
          set = fn x => set "show-close-button" boolean x,
          new = fn x => new "show-close-button" boolean x
        }
    end
  end
