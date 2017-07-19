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
    val getType_ = _import "gtk_toolbar_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_toolbar_new" : unit -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val getDropIndex_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_toolbar_get_drop_index" :
              GtkToolbarClass.FFI.notnull GtkToolbarClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> GInt32.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getIconSize_ = _import "gtk_toolbar_get_icon_size" : GtkToolbarClass.FFI.notnull GtkToolbarClass.FFI.p -> GInt32.FFI.val_;
    val getItemIndex_ = fn x1 & x2 => (_import "gtk_toolbar_get_item_index" : GtkToolbarClass.FFI.notnull GtkToolbarClass.FFI.p * GtkToolItemClass.FFI.notnull GtkToolItemClass.FFI.p -> GInt32.FFI.val_;) (x1, x2)
    val getNItems_ = _import "gtk_toolbar_get_n_items" : GtkToolbarClass.FFI.notnull GtkToolbarClass.FFI.p -> GInt32.FFI.val_;
    val getNthItem_ = fn x1 & x2 => (_import "gtk_toolbar_get_nth_item" : GtkToolbarClass.FFI.notnull GtkToolbarClass.FFI.p * GInt32.FFI.val_ -> GtkToolItemClass.FFI.notnull GtkToolItemClass.FFI.p;) (x1, x2)
    val getReliefStyle_ = _import "gtk_toolbar_get_relief_style" : GtkToolbarClass.FFI.notnull GtkToolbarClass.FFI.p -> GtkReliefStyle.FFI.val_;
    val getShowArrow_ = _import "gtk_toolbar_get_show_arrow" : GtkToolbarClass.FFI.notnull GtkToolbarClass.FFI.p -> GBool.FFI.val_;
    val getStyle_ = _import "gtk_toolbar_get_style" : GtkToolbarClass.FFI.notnull GtkToolbarClass.FFI.p -> GtkToolbarStyle.FFI.val_;
    val insert_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_toolbar_insert" :
              GtkToolbarClass.FFI.notnull GtkToolbarClass.FFI.p
               * GtkToolItemClass.FFI.notnull GtkToolItemClass.FFI.p
               * GInt32.FFI.val_
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
              GtkToolbarClass.FFI.notnull GtkToolbarClass.FFI.p
               * unit GtkToolItemClass.FFI.p
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setIconSize_ = fn x1 & x2 => (_import "gtk_toolbar_set_icon_size" : GtkToolbarClass.FFI.notnull GtkToolbarClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setShowArrow_ = fn x1 & x2 => (_import "gtk_toolbar_set_show_arrow" : GtkToolbarClass.FFI.notnull GtkToolbarClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setStyle_ = fn x1 & x2 => (_import "gtk_toolbar_set_style" : GtkToolbarClass.FFI.notnull GtkToolbarClass.FFI.p * GtkToolbarStyle.FFI.val_ -> unit;) (x1, x2)
    val unsetIconSize_ = _import "gtk_toolbar_unset_icon_size" : GtkToolbarClass.FFI.notnull GtkToolbarClass.FFI.p -> unit;
    val unsetStyle_ = _import "gtk_toolbar_unset_style" : GtkToolbarClass.FFI.notnull GtkToolbarClass.FFI.p -> unit;
    type 'a class = 'a GtkToolbarClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type 'a tool_shell_class = 'a GtkToolShellClass.class
    type relief_style_t = GtkReliefStyle.t
    type 'a tool_item_class = 'a GtkToolItemClass.class
    type orientation_t = GtkOrientation.t
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
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> GInt32.FFI.fromVal
      )
        getDropIndex_
        (
          self
           & x
           & y
        )
    fun getIconSize self = (GtkToolbarClass.FFI.withPtr ---> GInt32.FFI.fromVal) getIconSize_ self
    fun getItemIndex self item = (GtkToolbarClass.FFI.withPtr &&&> GtkToolItemClass.FFI.withPtr ---> GInt32.FFI.fromVal) getItemIndex_ (self & item)
    fun getNItems self = (GtkToolbarClass.FFI.withPtr ---> GInt32.FFI.fromVal) getNItems_ self
    fun getNthItem self n = (GtkToolbarClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> GtkToolItemClass.FFI.fromPtr false) getNthItem_ (self & n)
    fun getReliefStyle self = (GtkToolbarClass.FFI.withPtr ---> GtkReliefStyle.FFI.fromVal) getReliefStyle_ self
    fun getShowArrow self = (GtkToolbarClass.FFI.withPtr ---> GBool.FFI.fromVal) getShowArrow_ self
    fun getStyle self = (GtkToolbarClass.FFI.withPtr ---> GtkToolbarStyle.FFI.fromVal) getStyle_ self
    fun insert self (item, pos) =
      (
        GtkToolbarClass.FFI.withPtr
         &&&> GtkToolItemClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
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
         &&&> GInt32.FFI.withVal
         ---> I
      )
        setDropHighlightItem_
        (
          self
           & toolItem
           & index
        )
    fun setIconSize self iconSize = (GtkToolbarClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setIconSize_ (self & iconSize)
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
