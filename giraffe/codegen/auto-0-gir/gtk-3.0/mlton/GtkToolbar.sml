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
    val getType_ = _import "gtk_toolbar_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_toolbar_new" : unit -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val getDropIndex_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_toolbar_get_drop_index" :
              GtkToolbarClass.C.notnull GtkToolbarClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> FFI.Int.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getIconSize_ = _import "gtk_toolbar_get_icon_size" : GtkToolbarClass.C.notnull GtkToolbarClass.C.p -> FFI.Int.C.val_;
    val getItemIndex_ = fn x1 & x2 => (_import "gtk_toolbar_get_item_index" : GtkToolbarClass.C.notnull GtkToolbarClass.C.p * GtkToolItemClass.C.notnull GtkToolItemClass.C.p -> FFI.Int.C.val_;) (x1, x2)
    val getNItems_ = _import "gtk_toolbar_get_n_items" : GtkToolbarClass.C.notnull GtkToolbarClass.C.p -> FFI.Int.C.val_;
    val getNthItem_ = fn x1 & x2 => (_import "gtk_toolbar_get_nth_item" : GtkToolbarClass.C.notnull GtkToolbarClass.C.p * FFI.Int.C.val_ -> GtkToolItemClass.C.notnull GtkToolItemClass.C.p;) (x1, x2)
    val getReliefStyle_ = _import "gtk_toolbar_get_relief_style" : GtkToolbarClass.C.notnull GtkToolbarClass.C.p -> GtkReliefStyle.C.val_;
    val getShowArrow_ = _import "gtk_toolbar_get_show_arrow" : GtkToolbarClass.C.notnull GtkToolbarClass.C.p -> FFI.Bool.C.val_;
    val getStyle_ = _import "gtk_toolbar_get_style" : GtkToolbarClass.C.notnull GtkToolbarClass.C.p -> GtkToolbarStyle.C.val_;
    val insert_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_toolbar_insert" :
              GtkToolbarClass.C.notnull GtkToolbarClass.C.p
               * GtkToolItemClass.C.notnull GtkToolItemClass.C.p
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setDropHighlightItem_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_toolbar_set_drop_highlight_item" :
              GtkToolbarClass.C.notnull GtkToolbarClass.C.p
               * unit GtkToolItemClass.C.p
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setIconSize_ = fn x1 & x2 => (_import "gtk_toolbar_set_icon_size" : GtkToolbarClass.C.notnull GtkToolbarClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setShowArrow_ = fn x1 & x2 => (_import "gtk_toolbar_set_show_arrow" : GtkToolbarClass.C.notnull GtkToolbarClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setStyle_ = fn x1 & x2 => (_import "gtk_toolbar_set_style" : GtkToolbarClass.C.notnull GtkToolbarClass.C.p * GtkToolbarStyle.C.val_ -> unit;) (x1, x2)
    val unsetIconSize_ = _import "gtk_toolbar_unset_icon_size" : GtkToolbarClass.C.notnull GtkToolbarClass.C.p -> unit;
    val unsetStyle_ = _import "gtk_toolbar_unset_style" : GtkToolbarClass.C.notnull GtkToolbarClass.C.p -> unit;
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
        GtkToolbarClass.C.withPtr
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
    fun getIconSize self = (GtkToolbarClass.C.withPtr ---> FFI.Int.C.fromVal) getIconSize_ self
    fun getItemIndex self item = (GtkToolbarClass.C.withPtr &&&> GtkToolItemClass.C.withPtr ---> FFI.Int.C.fromVal) getItemIndex_ (self & item)
    fun getNItems self = (GtkToolbarClass.C.withPtr ---> FFI.Int.C.fromVal) getNItems_ self
    fun getNthItem self n = (GtkToolbarClass.C.withPtr &&&> FFI.Int.C.withVal ---> GtkToolItemClass.C.fromPtr false) getNthItem_ (self & n)
    fun getReliefStyle self = (GtkToolbarClass.C.withPtr ---> GtkReliefStyle.C.fromVal) getReliefStyle_ self
    fun getShowArrow self = (GtkToolbarClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowArrow_ self
    fun getStyle self = (GtkToolbarClass.C.withPtr ---> GtkToolbarStyle.C.fromVal) getStyle_ self
    fun insert self item pos =
      (
        GtkToolbarClass.C.withPtr
         &&&> GtkToolItemClass.C.withPtr
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
        GtkToolbarClass.C.withPtr
         &&&> GtkToolItemClass.C.withOptPtr
         &&&> FFI.Int.C.withVal
         ---> I
      )
        setDropHighlightItem_
        (
          self
           & toolItem
           & index
        )
    fun setIconSize self iconSize = (GtkToolbarClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setIconSize_ (self & iconSize)
    fun setShowArrow self showArrow = (GtkToolbarClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowArrow_ (self & showArrow)
    fun setStyle self style = (GtkToolbarClass.C.withPtr &&&> GtkToolbarStyle.C.withVal ---> I) setStyle_ (self & style)
    fun unsetIconSize self = (GtkToolbarClass.C.withPtr ---> I) unsetIconSize_ self
    fun unsetStyle self = (GtkToolbarClass.C.withPtr ---> I) unsetStyle_ self
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
