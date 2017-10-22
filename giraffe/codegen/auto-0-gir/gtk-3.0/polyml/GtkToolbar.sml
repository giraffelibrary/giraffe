structure GtkToolbar :>
  GTK_TOOLBAR
    where type 'a class = 'a GtkToolbarClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type 'a tool_shell_class = 'a GtkToolShellClass.class
    where type relief_style_t = GtkReliefStyle.t
    where type 'a tool_item_class = 'a GtkToolItemClass.class
    where type orientation_t = GtkOrientation.t
    where type icon_size_t = GtkIconSize.t
    where type toolbar_style_t = GtkToolbarStyle.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_toolbar_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_toolbar_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val getDropIndex_ =
        call (getSymbol "gtk_toolbar_get_drop_index")
          (
            GtkToolbarClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> GInt.PolyML.cVal
          )
      val getIconSize_ = call (getSymbol "gtk_toolbar_get_icon_size") (GtkToolbarClass.PolyML.cPtr --> GtkIconSize.PolyML.cVal)
      val getItemIndex_ = call (getSymbol "gtk_toolbar_get_item_index") (GtkToolbarClass.PolyML.cPtr &&> GtkToolItemClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getNItems_ = call (getSymbol "gtk_toolbar_get_n_items") (GtkToolbarClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getNthItem_ = call (getSymbol "gtk_toolbar_get_nth_item") (GtkToolbarClass.PolyML.cPtr &&> GInt.PolyML.cVal --> GtkToolItemClass.PolyML.cPtr)
      val getReliefStyle_ = call (getSymbol "gtk_toolbar_get_relief_style") (GtkToolbarClass.PolyML.cPtr --> GtkReliefStyle.PolyML.cVal)
      val getShowArrow_ = call (getSymbol "gtk_toolbar_get_show_arrow") (GtkToolbarClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getStyle_ = call (getSymbol "gtk_toolbar_get_style") (GtkToolbarClass.PolyML.cPtr --> GtkToolbarStyle.PolyML.cVal)
      val insert_ =
        call (getSymbol "gtk_toolbar_insert")
          (
            GtkToolbarClass.PolyML.cPtr
             &&> GtkToolItemClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val setDropHighlightItem_ =
        call (getSymbol "gtk_toolbar_set_drop_highlight_item")
          (
            GtkToolbarClass.PolyML.cPtr
             &&> GtkToolItemClass.PolyML.cOptPtr
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val setIconSize_ = call (getSymbol "gtk_toolbar_set_icon_size") (GtkToolbarClass.PolyML.cPtr &&> GtkIconSize.PolyML.cVal --> cVoid)
      val setShowArrow_ = call (getSymbol "gtk_toolbar_set_show_arrow") (GtkToolbarClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setStyle_ = call (getSymbol "gtk_toolbar_set_style") (GtkToolbarClass.PolyML.cPtr &&> GtkToolbarStyle.PolyML.cVal --> cVoid)
      val unsetIconSize_ = call (getSymbol "gtk_toolbar_unset_icon_size") (GtkToolbarClass.PolyML.cPtr --> cVoid)
      val unsetStyle_ = call (getSymbol "gtk_toolbar_unset_style") (GtkToolbarClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GtkToolbarClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type 'a tool_shell_class = 'a GtkToolShellClass.class
    type relief_style_t = GtkReliefStyle.t
    type 'a tool_item_class = 'a GtkToolItemClass.class
    type orientation_t = GtkOrientation.t
    type icon_size_t = GtkIconSize.t
    type toolbar_style_t = GtkToolbarStyle.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr ---> GtkOrientableClass.FFI.fromPtr false) I self
    fun asToolShell self = (GObjectObjectClass.FFI.withPtr ---> GtkToolShellClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkToolbarClass.FFI.fromPtr false) new_ ()
    fun getDropIndex self (x, y) =
      (
        GtkToolbarClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> GInt.FFI.fromVal
      )
        getDropIndex_
        (
          self
           & x
           & y
        )
    fun getIconSize self = (GtkToolbarClass.FFI.withPtr ---> GtkIconSize.FFI.fromVal) getIconSize_ self
    fun getItemIndex self item = (GtkToolbarClass.FFI.withPtr &&&> GtkToolItemClass.FFI.withPtr ---> GInt.FFI.fromVal) getItemIndex_ (self & item)
    fun getNItems self = (GtkToolbarClass.FFI.withPtr ---> GInt.FFI.fromVal) getNItems_ self
    fun getNthItem self n = (GtkToolbarClass.FFI.withPtr &&&> GInt.FFI.withVal ---> GtkToolItemClass.FFI.fromPtr false) getNthItem_ (self & n)
    fun getReliefStyle self = (GtkToolbarClass.FFI.withPtr ---> GtkReliefStyle.FFI.fromVal) getReliefStyle_ self
    fun getShowArrow self = (GtkToolbarClass.FFI.withPtr ---> GBool.FFI.fromVal) getShowArrow_ self
    fun getStyle self = (GtkToolbarClass.FFI.withPtr ---> GtkToolbarStyle.FFI.fromVal) getStyle_ self
    fun insert self (item, pos) =
      (
        GtkToolbarClass.FFI.withPtr
         &&&> GtkToolItemClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         ---> I
      )
        insert_
        (
          self
           & item
           & pos
        )
    fun setDropHighlightItem self (toolItem, index) =
      (
        GtkToolbarClass.FFI.withPtr
         &&&> GtkToolItemClass.FFI.withOptPtr
         &&&> GInt.FFI.withVal
         ---> I
      )
        setDropHighlightItem_
        (
          self
           & toolItem
           & index
        )
    fun setIconSize self iconSize = (GtkToolbarClass.FFI.withPtr &&&> GtkIconSize.FFI.withVal ---> I) setIconSize_ (self & iconSize)
    fun setShowArrow self showArrow = (GtkToolbarClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setShowArrow_ (self & showArrow)
    fun setStyle self style = (GtkToolbarClass.FFI.withPtr &&&> GtkToolbarStyle.FFI.withVal ---> I) setStyle_ (self & style)
    fun unsetIconSize self = (GtkToolbarClass.FFI.withPtr ---> I) unsetIconSize_ self
    fun unsetStyle self = (GtkToolbarClass.FFI.withPtr ---> I) unsetStyle_ self
    local
      open ClosureMarshal Signal
    in
      fun focusHomeOrEndSig f = signal "focus-home-or-end" (get 0w1 boolean ---> ret boolean) f
      fun orientationChangedSig f = signal "orientation-changed" (get 0w1 GtkOrientation.t ---> ret_void) f
      fun popupContextMenuSig f =
        signal "popup-context-menu"
          (
            get 0w1 int
             &&&> get 0w2 int
             &&&> get 0w3 int
             ---> ret boolean
          )
          (
            fn
              x
               & y
               & button =>
                f
                  (
                    x,
                    y,
                    button
                  )
          )
      fun styleChangedSig f = signal "style-changed" (get 0w1 GtkToolbarStyle.t ---> ret_void) f
    end
    local
      open Property
    in
      val iconSizeProp =
        {
          get = fn x => get "icon-size" GtkIconSize.t x,
          set = fn x => set "icon-size" GtkIconSize.t x
        }
      val iconSizeSetProp =
        {
          get = fn x => get "icon-size-set" boolean x,
          set = fn x => set "icon-size-set" boolean x
        }
      val showArrowProp =
        {
          get = fn x => get "show-arrow" boolean x,
          set = fn x => set "show-arrow" boolean x
        }
      val toolbarStyleProp =
        {
          get = fn x => get "toolbar-style" GtkToolbarStyle.t x,
          set = fn x => set "toolbar-style" GtkToolbarStyle.t x
        }
    end
  end
