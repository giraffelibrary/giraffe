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
    val getType_ = _import "gtk_toolbar_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_toolbar_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getDropIndex_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_toolbar_get_drop_index" :
              GtkToolbarClass.FFI.non_opt GtkToolbarClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> GInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getIconSize_ = _import "gtk_toolbar_get_icon_size" : GtkToolbarClass.FFI.non_opt GtkToolbarClass.FFI.p -> GtkIconSize.FFI.val_;
    val getItemIndex_ = fn x1 & x2 => (_import "gtk_toolbar_get_item_index" : GtkToolbarClass.FFI.non_opt GtkToolbarClass.FFI.p * GtkToolItemClass.FFI.non_opt GtkToolItemClass.FFI.p -> GInt.FFI.val_;) (x1, x2)
    val getNItems_ = _import "gtk_toolbar_get_n_items" : GtkToolbarClass.FFI.non_opt GtkToolbarClass.FFI.p -> GInt.FFI.val_;
    val getNthItem_ = fn x1 & x2 => (_import "gtk_toolbar_get_nth_item" : GtkToolbarClass.FFI.non_opt GtkToolbarClass.FFI.p * GInt.FFI.val_ -> GtkToolItemClass.FFI.opt GtkToolItemClass.FFI.p;) (x1, x2)
    val getReliefStyle_ = _import "gtk_toolbar_get_relief_style" : GtkToolbarClass.FFI.non_opt GtkToolbarClass.FFI.p -> GtkReliefStyle.FFI.val_;
    val getShowArrow_ = _import "gtk_toolbar_get_show_arrow" : GtkToolbarClass.FFI.non_opt GtkToolbarClass.FFI.p -> GBool.FFI.val_;
    val getStyle_ = _import "gtk_toolbar_get_style" : GtkToolbarClass.FFI.non_opt GtkToolbarClass.FFI.p -> GtkToolbarStyle.FFI.val_;
    val insert_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_toolbar_insert" :
              GtkToolbarClass.FFI.non_opt GtkToolbarClass.FFI.p
               * GtkToolItemClass.FFI.non_opt GtkToolItemClass.FFI.p
               * GInt.FFI.val_
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
              GtkToolbarClass.FFI.non_opt GtkToolbarClass.FFI.p
               * GtkToolItemClass.FFI.opt GtkToolItemClass.FFI.p
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setIconSize_ = fn x1 & x2 => (_import "gtk_toolbar_set_icon_size" : GtkToolbarClass.FFI.non_opt GtkToolbarClass.FFI.p * GtkIconSize.FFI.val_ -> unit;) (x1, x2)
    val setShowArrow_ = fn x1 & x2 => (_import "gtk_toolbar_set_show_arrow" : GtkToolbarClass.FFI.non_opt GtkToolbarClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setStyle_ = fn x1 & x2 => (_import "gtk_toolbar_set_style" : GtkToolbarClass.FFI.non_opt GtkToolbarClass.FFI.p * GtkToolbarStyle.FFI.val_ -> unit;) (x1, x2)
    val unsetIconSize_ = _import "gtk_toolbar_unset_icon_size" : GtkToolbarClass.FFI.non_opt GtkToolbarClass.FFI.p -> unit;
    val unsetStyle_ = _import "gtk_toolbar_unset_style" : GtkToolbarClass.FFI.non_opt GtkToolbarClass.FFI.p -> unit;
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
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr false ---> GtkOrientableClass.FFI.fromPtr false) I self
    fun asToolShell self = (GObjectObjectClass.FFI.withPtr false ---> GtkToolShellClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkToolbarClass.FFI.fromPtr false) new_ ()
    fun getDropIndex self (x, y) =
      (
        GtkToolbarClass.FFI.withPtr false
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
    fun getIconSize self = (GtkToolbarClass.FFI.withPtr false ---> GtkIconSize.FFI.fromVal) getIconSize_ self
    fun getItemIndex self item = (GtkToolbarClass.FFI.withPtr false &&&> GtkToolItemClass.FFI.withPtr false ---> GInt.FFI.fromVal) getItemIndex_ (self & item)
    fun getNItems self = (GtkToolbarClass.FFI.withPtr false ---> GInt.FFI.fromVal) getNItems_ self
    fun getNthItem self n = (GtkToolbarClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> GtkToolItemClass.FFI.fromOptPtr false) getNthItem_ (self & n)
    fun getReliefStyle self = (GtkToolbarClass.FFI.withPtr false ---> GtkReliefStyle.FFI.fromVal) getReliefStyle_ self
    fun getShowArrow self = (GtkToolbarClass.FFI.withPtr false ---> GBool.FFI.fromVal) getShowArrow_ self
    fun getStyle self = (GtkToolbarClass.FFI.withPtr false ---> GtkToolbarStyle.FFI.fromVal) getStyle_ self
    fun insert self (item, pos) =
      (
        GtkToolbarClass.FFI.withPtr false
         &&&> GtkToolItemClass.FFI.withPtr false
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
        GtkToolbarClass.FFI.withPtr false
         &&&> GtkToolItemClass.FFI.withOptPtr false
         &&&> GInt.FFI.withVal
         ---> I
      )
        setDropHighlightItem_
        (
          self
           & toolItem
           & index
        )
    fun setIconSize self iconSize = (GtkToolbarClass.FFI.withPtr false &&&> GtkIconSize.FFI.withVal ---> I) setIconSize_ (self & iconSize)
    fun setShowArrow self showArrow = (GtkToolbarClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setShowArrow_ (self & showArrow)
    fun setStyle self style = (GtkToolbarClass.FFI.withPtr false &&&> GtkToolbarStyle.FFI.withVal ---> I) setStyle_ (self & style)
    fun unsetIconSize self = (GtkToolbarClass.FFI.withPtr false ---> I) unsetIconSize_ self
    fun unsetStyle self = (GtkToolbarClass.FFI.withPtr false ---> I) unsetStyle_ self
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
      open ValueAccessor
    in
      val iconSizeProp =
        {
          name = "icon-size",
          gtype = fn () => C.gtype GtkIconSize.t (),
          get = fn x => fn () => C.get GtkIconSize.t x,
          set = fn x => C.set GtkIconSize.t x,
          init = fn x => C.set GtkIconSize.t x
        }
      val iconSizeSetProp =
        {
          name = "icon-size-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val showArrowProp =
        {
          name = "show-arrow",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val toolbarStyleProp =
        {
          name = "toolbar-style",
          gtype = fn () => C.gtype GtkToolbarStyle.t (),
          get = fn x => fn () => C.get GtkToolbarStyle.t x,
          set = fn x => C.set GtkToolbarStyle.t x,
          init = fn x => C.set GtkToolbarStyle.t x
        }
    end
  end
