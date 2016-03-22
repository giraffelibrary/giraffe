structure GtkAssistant :>
  GTK_ASSISTANT
    where type 'a class = 'a GtkAssistantClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type assistant_page_type_t = GtkAssistantPageType.t
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_assistant_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_assistant_new" : unit -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val addActionWidget_ = fn x1 & x2 => (_import "gtk_assistant_add_action_widget" : GtkAssistantClass.C.notnull GtkAssistantClass.C.p * GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;) (x1, x2)
    val appendPage_ = fn x1 & x2 => (_import "gtk_assistant_append_page" : GtkAssistantClass.C.notnull GtkAssistantClass.C.p * GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Int.C.val_;) (x1, x2)
    val commit_ = _import "gtk_assistant_commit" : GtkAssistantClass.C.notnull GtkAssistantClass.C.p -> unit;
    val getCurrentPage_ = _import "gtk_assistant_get_current_page" : GtkAssistantClass.C.notnull GtkAssistantClass.C.p -> FFI.Int.C.val_;
    val getNPages_ = _import "gtk_assistant_get_n_pages" : GtkAssistantClass.C.notnull GtkAssistantClass.C.p -> FFI.Int.C.val_;
    val getNthPage_ = fn x1 & x2 => (_import "gtk_assistant_get_nth_page" : GtkAssistantClass.C.notnull GtkAssistantClass.C.p * FFI.Int.C.val_ -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;) (x1, x2)
    val getPageComplete_ = fn x1 & x2 => (_import "gtk_assistant_get_page_complete" : GtkAssistantClass.C.notnull GtkAssistantClass.C.p * GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val getPageTitle_ = fn x1 & x2 => (_import "gtk_assistant_get_page_title" : GtkAssistantClass.C.notnull GtkAssistantClass.C.p * GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> Utf8.C.notnull Utf8.C.out_p;) (x1, x2)
    val getPageType_ = fn x1 & x2 => (_import "gtk_assistant_get_page_type" : GtkAssistantClass.C.notnull GtkAssistantClass.C.p * GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> GtkAssistantPageType.C.val_;) (x1, x2)
    val insertPage_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_assistant_insert_page" :
              GtkAssistantClass.C.notnull GtkAssistantClass.C.p
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * FFI.Int.C.val_
               -> FFI.Int.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val nextPage_ = _import "gtk_assistant_next_page" : GtkAssistantClass.C.notnull GtkAssistantClass.C.p -> unit;
    val prependPage_ = fn x1 & x2 => (_import "gtk_assistant_prepend_page" : GtkAssistantClass.C.notnull GtkAssistantClass.C.p * GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Int.C.val_;) (x1, x2)
    val previousPage_ = _import "gtk_assistant_previous_page" : GtkAssistantClass.C.notnull GtkAssistantClass.C.p -> unit;
    val removeActionWidget_ = fn x1 & x2 => (_import "gtk_assistant_remove_action_widget" : GtkAssistantClass.C.notnull GtkAssistantClass.C.p * GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;) (x1, x2)
    val removePage_ = fn x1 & x2 => (_import "gtk_assistant_remove_page" : GtkAssistantClass.C.notnull GtkAssistantClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setCurrentPage_ = fn x1 & x2 => (_import "gtk_assistant_set_current_page" : GtkAssistantClass.C.notnull GtkAssistantClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setPageComplete_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_assistant_set_page_complete" :
              GtkAssistantClass.C.notnull GtkAssistantClass.C.p
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * FFI.Bool.C.val_
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
              GtkAssistantClass.C.notnull GtkAssistantClass.C.p
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GtkAssistantClass.C.notnull GtkAssistantClass.C.p
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * GtkAssistantPageType.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val updateButtonsState_ = _import "gtk_assistant_update_buttons_state" : GtkAssistantClass.C.notnull GtkAssistantClass.C.p -> unit;
    type 'a class = 'a GtkAssistantClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type assistant_page_type_t = GtkAssistantPageType.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkAssistantClass.C.fromPtr false) new_ ()
    fun addActionWidget self child = (GtkAssistantClass.C.withPtr &&&> GtkWidgetClass.C.withPtr ---> I) addActionWidget_ (self & child)
    fun appendPage self page = (GtkAssistantClass.C.withPtr &&&> GtkWidgetClass.C.withPtr ---> FFI.Int.C.fromVal) appendPage_ (self & page)
    fun commit self = (GtkAssistantClass.C.withPtr ---> I) commit_ self
    fun getCurrentPage self = (GtkAssistantClass.C.withPtr ---> FFI.Int.C.fromVal) getCurrentPage_ self
    fun getNPages self = (GtkAssistantClass.C.withPtr ---> FFI.Int.C.fromVal) getNPages_ self
    fun getNthPage self pageNum = (GtkAssistantClass.C.withPtr &&&> FFI.Int.C.withVal ---> GtkWidgetClass.C.fromPtr false) getNthPage_ (self & pageNum)
    fun getPageComplete self page = (GtkAssistantClass.C.withPtr &&&> GtkWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) getPageComplete_ (self & page)
    fun getPageTitle self page = (GtkAssistantClass.C.withPtr &&&> GtkWidgetClass.C.withPtr ---> Utf8.C.fromPtr false) getPageTitle_ (self & page)
    fun getPageType self page = (GtkAssistantClass.C.withPtr &&&> GtkWidgetClass.C.withPtr ---> GtkAssistantPageType.C.fromVal) getPageType_ (self & page)
    fun insertPage self page position =
      (
        GtkAssistantClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> FFI.Int.C.withVal
         ---> FFI.Int.C.fromVal
      )
        insertPage_
        (
          self
           & page
           & position
        )
    fun nextPage self = (GtkAssistantClass.C.withPtr ---> I) nextPage_ self
    fun prependPage self page = (GtkAssistantClass.C.withPtr &&&> GtkWidgetClass.C.withPtr ---> FFI.Int.C.fromVal) prependPage_ (self & page)
    fun previousPage self = (GtkAssistantClass.C.withPtr ---> I) previousPage_ self
    fun removeActionWidget self child = (GtkAssistantClass.C.withPtr &&&> GtkWidgetClass.C.withPtr ---> I) removeActionWidget_ (self & child)
    fun removePage self pageNum = (GtkAssistantClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) removePage_ (self & pageNum)
    fun setCurrentPage self pageNum = (GtkAssistantClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setCurrentPage_ (self & pageNum)
    fun setPageComplete self page complete =
      (
        GtkAssistantClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        setPageComplete_
        (
          self
           & page
           & complete
        )
    fun setPageTitle self page title =
      (
        GtkAssistantClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> Utf8.C.withPtr
         ---> I
      )
        setPageTitle_
        (
          self
           & page
           & title
        )
    fun setPageType self page type' =
      (
        GtkAssistantClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> GtkAssistantPageType.C.withVal
         ---> I
      )
        setPageType_
        (
          self
           & page
           & type'
        )
    fun updateButtonsState self = (GtkAssistantClass.C.withPtr ---> I) updateButtonsState_ self
    local
      open ClosureMarshal Signal
    in
      fun applySig f = signal "apply" (void ---> ret_void) f
      fun cancelSig f = signal "cancel" (void ---> ret_void) f
      fun closeSig f = signal "close" (void ---> ret_void) f
      fun prepareSig f = signal "prepare" (get 0w1 GtkWidgetClass.t ---> ret_void) f
    end
  end
