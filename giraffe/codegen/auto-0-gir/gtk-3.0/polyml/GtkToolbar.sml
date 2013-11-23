structure GtkToolbar :>
  GTK_TOOLBAR
    where type 'a class_t = 'a GtkToolbarClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a orientableclass_t = 'a GtkOrientableClass.t
    where type 'a toolshellclass_t = 'a GtkToolShellClass.t
    where type reliefstyle_t = GtkReliefStyle.t
    where type 'a toolitemclass_t = 'a GtkToolItemClass.t
    where type orientation_t = GtkOrientation.t
    where type toolbarstyle_t = GtkToolbarStyle.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_toolbar_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_toolbar_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getDropIndex_ =
        call (load_sym libgtk "gtk_toolbar_get_drop_index")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             --> FFI.Int.PolyML.VAL
          )
      val getIconSize_ = call (load_sym libgtk "gtk_toolbar_get_icon_size") (GObjectObjectClass.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val getItemIndex_ = call (load_sym libgtk "gtk_toolbar_get_item_index") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val getNItems_ = call (load_sym libgtk "gtk_toolbar_get_n_items") (GObjectObjectClass.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val getNthItem_ = call (load_sym libgtk "gtk_toolbar_get_nth_item") (GObjectObjectClass.PolyML.PTR &&> FFI.Int.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val getReliefStyle_ = call (load_sym libgtk "gtk_toolbar_get_relief_style") (GObjectObjectClass.PolyML.PTR --> GtkReliefStyle.PolyML.VAL)
      val getShowArrow_ = call (load_sym libgtk "gtk_toolbar_get_show_arrow") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getStyle_ = call (load_sym libgtk "gtk_toolbar_get_style") (GObjectObjectClass.PolyML.PTR --> GtkToolbarStyle.PolyML.VAL)
      val insert_ =
        call (load_sym libgtk "gtk_toolbar_insert")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setDropHighlightItem_ =
        call (load_sym libgtk "gtk_toolbar_set_drop_highlight_item")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> FFI.Int.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setIconSize_ = call (load_sym libgtk "gtk_toolbar_set_icon_size") (GObjectObjectClass.PolyML.PTR &&> FFI.Int.PolyML.VAL --> FFI.PolyML.VOID)
      val setShowArrow_ = call (load_sym libgtk "gtk_toolbar_set_show_arrow") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setStyle_ = call (load_sym libgtk "gtk_toolbar_set_style") (GObjectObjectClass.PolyML.PTR &&> GtkToolbarStyle.PolyML.VAL --> FFI.PolyML.VOID)
      val unsetIconSize_ = call (load_sym libgtk "gtk_toolbar_unset_icon_size") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val unsetStyle_ = call (load_sym libgtk "gtk_toolbar_unset_style") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkToolbarClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a orientableclass_t = 'a GtkOrientableClass.t
    type 'a toolshellclass_t = 'a GtkToolShellClass.t
    type reliefstyle_t = GtkReliefStyle.t
    type 'a toolitemclass_t = 'a GtkToolItemClass.t
    type orientation_t = GtkOrientation.t
    type toolbarstyle_t = GtkToolbarStyle.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    fun asToolShell self = (GObjectObjectClass.C.withPtr ---> GtkToolShellClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkToolbarClass.C.fromPtr false) new_ ()
    fun getDropIndex self x y =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> FFI.Int.C.fromVal
      )
        getDropIndex_
        (
          self
           & x
           & y
        )
    fun getIconSize self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getIconSize_ self
    fun getItemIndex self item = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getItemIndex_ (self & item)
    fun getNItems self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getNItems_ self
    fun getNthItem self n = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> GtkToolItemClass.C.fromPtr false) getNthItem_ (self & n)
    fun getReliefStyle self = (GObjectObjectClass.C.withPtr ---> GtkReliefStyle.C.fromVal) getReliefStyle_ self
    fun getShowArrow self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowArrow_ self
    fun getStyle self = (GObjectObjectClass.C.withPtr ---> GtkToolbarStyle.C.fromVal) getStyle_ self
    fun insert self item pos =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
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
         &&&> FFI.Int.C.withVal
         ---> I
      )
        setDropHighlightItem_
        (
          self
           & toolItem
           & index
        )
    fun setIconSize self iconSize = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setIconSize_ (self & iconSize)
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
