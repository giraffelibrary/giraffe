structure GtkSearchBar :>
  GTK_SEARCH_BAR
    where type 'a class = 'a GtkSearchBarClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a entry_class = 'a GtkEntryClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_search_bar_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_search_bar_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val connectEntry_ = call (getSymbol "gtk_search_bar_connect_entry") (GtkSearchBarClass.PolyML.cPtr &&> GtkEntryClass.PolyML.cPtr --> cVoid)
      val getSearchMode_ = call (getSymbol "gtk_search_bar_get_search_mode") (GtkSearchBarClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getShowCloseButton_ = call (getSymbol "gtk_search_bar_get_show_close_button") (GtkSearchBarClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val handleEvent_ = call (getSymbol "gtk_search_bar_handle_event") (GtkSearchBarClass.PolyML.cPtr &&> GdkEvent.PolyML.cPtr --> GBool.PolyML.cVal)
      val setSearchMode_ = call (getSymbol "gtk_search_bar_set_search_mode") (GtkSearchBarClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setShowCloseButton_ = call (getSymbol "gtk_search_bar_set_show_close_button") (GtkSearchBarClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkSearchBarClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a entry_class = 'a GtkEntryClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkSearchBarClass.FFI.fromPtr false) new_ ()
    fun connectEntry self entry = (GtkSearchBarClass.FFI.withPtr false &&&> GtkEntryClass.FFI.withPtr false ---> I) connectEntry_ (self & entry)
    fun getSearchMode self = (GtkSearchBarClass.FFI.withPtr false ---> GBool.FFI.fromVal) getSearchMode_ self
    fun getShowCloseButton self = (GtkSearchBarClass.FFI.withPtr false ---> GBool.FFI.fromVal) getShowCloseButton_ self
    fun handleEvent self event = (GtkSearchBarClass.FFI.withPtr false &&&> GdkEvent.FFI.withPtr false ---> GBool.FFI.fromVal) handleEvent_ (self & event)
    fun setSearchMode self searchMode = (GtkSearchBarClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setSearchMode_ (self & searchMode)
    fun setShowCloseButton self visible = (GtkSearchBarClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setShowCloseButton_ (self & visible)
    local
      open ValueAccessor
    in
      val searchModeEnabledProp =
        {
          name = "search-mode-enabled",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val showCloseButtonProp =
        {
          name = "show-close-button",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
