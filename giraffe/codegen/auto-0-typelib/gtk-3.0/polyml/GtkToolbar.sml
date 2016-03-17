structure GtkToolbar :>
  GTK_TOOLBAR
    where type 'a class = 'a GtkToolbarClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type 'a tool_shell_class = 'a GtkToolShellClass.class
    where type relief_style_t = GtkReliefStyle.t
    where type 'a tool_item_class = 'a GtkToolItemClass.class
    where type orientation_t = GtkOrientation.t
    where type toolbar_style_t = GtkToolbarStyle.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_toolbar_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_toolbar_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val getDropIndex_ =
        call (load_sym libgtk "gtk_toolbar_get_drop_index")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.Int32.PolyML.cVal
          )
      val getIconSize_ = call (load_sym libgtk "gtk_toolbar_get_icon_size") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getItemIndex_ = call (load_sym libgtk "gtk_toolbar_get_item_index") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getNItems_ = call (load_sym libgtk "gtk_toolbar_get_n_items") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getNthItem_ = call (load_sym libgtk "gtk_toolbar_get_nth_item") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> GObjectObjectClass.PolyML.cPtr)
      val getReliefStyle_ = call (load_sym libgtk "gtk_toolbar_get_relief_style") (GObjectObjectClass.PolyML.cPtr --> GtkReliefStyle.PolyML.cVal)
      val getShowArrow_ = call (load_sym libgtk "gtk_toolbar_get_show_arrow") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getStyle_ = call (load_sym libgtk "gtk_toolbar_get_style") (GObjectObjectClass.PolyML.cPtr --> GtkToolbarStyle.PolyML.cVal)
      val insert_ =
        call (load_sym libgtk "gtk_toolbar_insert")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setDropHighlightItem_ =
        call (load_sym libgtk "gtk_toolbar_set_drop_highlight_item")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setIconSize_ = call (load_sym libgtk "gtk_toolbar_set_icon_size") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setShowArrow_ = call (load_sym libgtk "gtk_toolbar_set_show_arrow") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setStyle_ = call (load_sym libgtk "gtk_toolbar_set_style") (GObjectObjectClass.PolyML.cPtr &&> GtkToolbarStyle.PolyML.cVal --> FFI.PolyML.cVoid)
      val unsetIconSize_ = call (load_sym libgtk "gtk_toolbar_unset_icon_size") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val unsetStyle_ = call (load_sym libgtk "gtk_toolbar_unset_style") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkToolbarClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type 'a tool_shell_class = 'a GtkToolShellClass.class
    type relief_style_t = GtkReliefStyle.t
    type 'a tool_item_class = 'a GtkToolItemClass.class
    type orientation_t = GtkOrientation.t
    type toolbar_style_t = GtkToolbarStyle.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    fun asToolShell self = (GObjectObjectClass.C.withPtr ---> GtkToolShellClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkToolbarClass.C.fromPtr false) new_ ()
    fun getDropIndex self x y =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> FFI.Int32.C.fromVal
      )
        getDropIndex_
        (
          self
           & x
           & y
        )
    fun getIconSize self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getIconSize_ self
    fun getItemIndex self item = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getItemIndex_ (self & item)
    fun getNItems self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getNItems_ self
    fun getNthItem self n = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> GtkToolItemClass.C.fromPtr false) getNthItem_ (self & n)
    fun getReliefStyle self = (GObjectObjectClass.C.withPtr ---> GtkReliefStyle.C.fromVal) getReliefStyle_ self
    fun getShowArrow self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowArrow_ self
    fun getStyle self = (GObjectObjectClass.C.withPtr ---> GtkToolbarStyle.C.fromVal) getStyle_ self
    fun insert self item pos =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        insert_
        (
          self
           & item
           & pos
        )
    fun setDropHighlightItem self toolItem index =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        setDropHighlightItem_
        (
          self
           & toolItem
           & index
        )
    fun setIconSize self iconSize = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setIconSize_ (self & iconSize)
    fun setShowArrow self showArrow = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowArrow_ (self & showArrow)
    fun setStyle self style = (GObjectObjectClass.C.withPtr &&&> GtkToolbarStyle.C.withVal ---> I) setStyle_ (self & style)
    fun unsetIconSize self = (GObjectObjectClass.C.withPtr ---> I) unsetIconSize_ self
    fun unsetStyle self = (GObjectObjectClass.C.withPtr ---> I) unsetStyle_ self
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
                f x y button
          )
      fun styleChangedSig f = signal "style-changed" (get 0w1 GtkToolbarStyle.t ---> ret_void) f
    end
    local
      open Property
    in
      val iconSizeProp =
        {
          get = fn x => get "icon-size" int x,
          set = fn x => set "icon-size" int x
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
