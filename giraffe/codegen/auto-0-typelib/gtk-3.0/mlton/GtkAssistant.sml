structure GtkAssistant :>
  GTK_ASSISTANT
    where type 'a class = 'a GtkAssistantClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type assistant_page_type_t = GtkAssistantPageType.t
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_assistant_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_assistant_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val addActionWidget_ = fn x1 & x2 => (_import "gtk_assistant_add_action_widget" : GtkAssistantClass.FFI.non_opt GtkAssistantClass.FFI.p * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val appendPage_ = fn x1 & x2 => (_import "gtk_assistant_append_page" : GtkAssistantClass.FFI.non_opt GtkAssistantClass.FFI.p * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GInt32.FFI.val_;) (x1, x2)
    val commit_ = _import "gtk_assistant_commit" : GtkAssistantClass.FFI.non_opt GtkAssistantClass.FFI.p -> unit;
    val getCurrentPage_ = _import "gtk_assistant_get_current_page" : GtkAssistantClass.FFI.non_opt GtkAssistantClass.FFI.p -> GInt32.FFI.val_;
    val getNPages_ = _import "gtk_assistant_get_n_pages" : GtkAssistantClass.FFI.non_opt GtkAssistantClass.FFI.p -> GInt32.FFI.val_;
    val getNthPage_ = fn x1 & x2 => (_import "gtk_assistant_get_nth_page" : GtkAssistantClass.FFI.non_opt GtkAssistantClass.FFI.p * GInt32.FFI.val_ -> GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p;) (x1, x2)
    val getPageComplete_ = fn x1 & x2 => (_import "gtk_assistant_get_page_complete" : GtkAssistantClass.FFI.non_opt GtkAssistantClass.FFI.p * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val getPageHasPadding_ = fn x1 & x2 => (_import "gtk_assistant_get_page_has_padding" : GtkAssistantClass.FFI.non_opt GtkAssistantClass.FFI.p * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val getPageHeaderImage_ = fn x1 & x2 => (_import "gtk_assistant_get_page_header_image" : GtkAssistantClass.FFI.non_opt GtkAssistantClass.FFI.p * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p;) (x1, x2)
    val getPageSideImage_ = fn x1 & x2 => (_import "gtk_assistant_get_page_side_image" : GtkAssistantClass.FFI.non_opt GtkAssistantClass.FFI.p * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p;) (x1, x2)
    val getPageTitle_ = fn x1 & x2 => (_import "gtk_assistant_get_page_title" : GtkAssistantClass.FFI.non_opt GtkAssistantClass.FFI.p * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;) (x1, x2)
    val getPageType_ = fn x1 & x2 => (_import "gtk_assistant_get_page_type" : GtkAssistantClass.FFI.non_opt GtkAssistantClass.FFI.p * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GtkAssistantPageType.FFI.val_;) (x1, x2)
    val insertPage_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_assistant_insert_page" :
              GtkAssistantClass.FFI.non_opt GtkAssistantClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GInt32.FFI.val_
               -> GInt32.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val nextPage_ = _import "gtk_assistant_next_page" : GtkAssistantClass.FFI.non_opt GtkAssistantClass.FFI.p -> unit;
    val prependPage_ = fn x1 & x2 => (_import "gtk_assistant_prepend_page" : GtkAssistantClass.FFI.non_opt GtkAssistantClass.FFI.p * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GInt32.FFI.val_;) (x1, x2)
    val previousPage_ = _import "gtk_assistant_previous_page" : GtkAssistantClass.FFI.non_opt GtkAssistantClass.FFI.p -> unit;
    val removeActionWidget_ = fn x1 & x2 => (_import "gtk_assistant_remove_action_widget" : GtkAssistantClass.FFI.non_opt GtkAssistantClass.FFI.p * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val removePage_ = fn x1 & x2 => (_import "gtk_assistant_remove_page" : GtkAssistantClass.FFI.non_opt GtkAssistantClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setCurrentPage_ = fn x1 & x2 => (_import "gtk_assistant_set_current_page" : GtkAssistantClass.FFI.non_opt GtkAssistantClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setPageComplete_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_assistant_set_page_complete" :
              GtkAssistantClass.FFI.non_opt GtkAssistantClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setPageHasPadding_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_assistant_set_page_has_padding" :
              GtkAssistantClass.FFI.non_opt GtkAssistantClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setPageHeaderImage_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_assistant_set_page_header_image" :
              GtkAssistantClass.FFI.non_opt GtkAssistantClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GdkPixbufPixbufClass.FFI.opt GdkPixbufPixbufClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setPageSideImage_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_assistant_set_page_side_image" :
              GtkAssistantClass.FFI.non_opt GtkAssistantClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GdkPixbufPixbufClass.FFI.opt GdkPixbufPixbufClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setPageTitle_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_assistant_set_page_title" :
              GtkAssistantClass.FFI.non_opt GtkAssistantClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setPageType_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_assistant_set_page_type" :
              GtkAssistantClass.FFI.non_opt GtkAssistantClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GtkAssistantPageType.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val updateButtonsState_ = _import "gtk_assistant_update_buttons_state" : GtkAssistantClass.FFI.non_opt GtkAssistantClass.FFI.p -> unit;
    type 'a class = 'a GtkAssistantClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type assistant_page_type_t = GtkAssistantPageType.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkAssistantClass.FFI.fromPtr false) new_ ()
    fun addActionWidget self child = (GtkAssistantClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> I) addActionWidget_ (self & child)
    fun appendPage self page = (GtkAssistantClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> GInt32.FFI.fromVal) appendPage_ (self & page)
    fun commit self = (GtkAssistantClass.FFI.withPtr false ---> I) commit_ self
    fun getCurrentPage self = (GtkAssistantClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getCurrentPage_ self
    fun getNPages self = (GtkAssistantClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getNPages_ self
    fun getNthPage self pageNum = (GtkAssistantClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> GtkWidgetClass.FFI.fromOptPtr false) getNthPage_ (self & pageNum) before GtkAssistantClass.FFI.touchPtr self
    fun getPageComplete self page = (GtkAssistantClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) getPageComplete_ (self & page)
    fun getPageHasPadding self page = (GtkAssistantClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) getPageHasPadding_ (self & page)
    fun getPageHeaderImage self page = (GtkAssistantClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> GdkPixbufPixbufClass.FFI.fromPtr false) getPageHeaderImage_ (self & page) before GtkAssistantClass.FFI.touchPtr self before GtkWidgetClass.FFI.touchPtr page
    fun getPageSideImage self page = (GtkAssistantClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> GdkPixbufPixbufClass.FFI.fromPtr false) getPageSideImage_ (self & page) before GtkAssistantClass.FFI.touchPtr self before GtkWidgetClass.FFI.touchPtr page
    fun getPageTitle self page = (GtkAssistantClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getPageTitle_ (self & page) before GtkAssistantClass.FFI.touchPtr self before GtkWidgetClass.FFI.touchPtr page
    fun getPageType self page = (GtkAssistantClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> GtkAssistantPageType.FFI.fromVal) getPageType_ (self & page)
    fun insertPage self (page, position) =
      (
        GtkAssistantClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         ---> GInt32.FFI.fromVal
      )
        insertPage_
        (
          self
           & page
           & position
        )
    fun nextPage self = (GtkAssistantClass.FFI.withPtr false ---> I) nextPage_ self
    fun prependPage self page = (GtkAssistantClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> GInt32.FFI.fromVal) prependPage_ (self & page)
    fun previousPage self = (GtkAssistantClass.FFI.withPtr false ---> I) previousPage_ self
    fun removeActionWidget self child = (GtkAssistantClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> I) removeActionWidget_ (self & child)
    fun removePage self pageNum = (GtkAssistantClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) removePage_ (self & pageNum)
    fun setCurrentPage self pageNum = (GtkAssistantClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setCurrentPage_ (self & pageNum)
    fun setPageComplete self (page, complete) =
      (
        GtkAssistantClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GBool.FFI.withVal
         ---> I
      )
        setPageComplete_
        (
          self
           & page
           & complete
        )
    fun setPageHasPadding self (page, hasPadding) =
      (
        GtkAssistantClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GBool.FFI.withVal
         ---> I
      )
        setPageHasPadding_
        (
          self
           & page
           & hasPadding
        )
    fun setPageHeaderImage self (page, pixbuf) =
      (
        GtkAssistantClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GdkPixbufPixbufClass.FFI.withOptPtr false
         ---> I
      )
        setPageHeaderImage_
        (
          self
           & page
           & pixbuf
        )
    fun setPageSideImage self (page, pixbuf) =
      (
        GtkAssistantClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GdkPixbufPixbufClass.FFI.withOptPtr false
         ---> I
      )
        setPageSideImage_
        (
          self
           & page
           & pixbuf
        )
    fun setPageTitle self (page, title) =
      (
        GtkAssistantClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         ---> I
      )
        setPageTitle_
        (
          self
           & page
           & title
        )
    fun setPageType self (page, type') =
      (
        GtkAssistantClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GtkAssistantPageType.FFI.withVal
         ---> I
      )
        setPageType_
        (
          self
           & page
           & type'
        )
    fun updateButtonsState self = (GtkAssistantClass.FFI.withPtr false ---> I) updateButtonsState_ self
    local
      open ClosureMarshal Signal
    in
      fun applySig f = signal "apply" (void ---> ret_void) f
      fun cancelSig f = signal "cancel" (void ---> ret_void) f
      fun closeSig f = signal "close" (void ---> ret_void) f
      fun escapeSig f = signal "escape" (void ---> ret_void) f
      fun prepareSig f = signal "prepare" (get 0w1 GtkWidgetClass.t ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val useHeaderBarProp =
        {
          name = "use-header-bar",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = ignore,
          init = fn x => C.set int x
        }
    end
  end
