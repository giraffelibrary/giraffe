structure GtkAssistant :>
  GTK_ASSISTANT
    where type 'a class = 'a GtkAssistantClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type assistant_page_type_t = GtkAssistantPageType.t
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_assistant_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_assistant_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val addActionWidget_ = call (getSymbol "gtk_assistant_add_action_widget") (GtkAssistantClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> cVoid)
      val appendPage_ = call (getSymbol "gtk_assistant_append_page") (GtkAssistantClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val commit_ = call (getSymbol "gtk_assistant_commit") (GtkAssistantClass.PolyML.cPtr --> cVoid)
      val getCurrentPage_ = call (getSymbol "gtk_assistant_get_current_page") (GtkAssistantClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getNPages_ = call (getSymbol "gtk_assistant_get_n_pages") (GtkAssistantClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getNthPage_ = call (getSymbol "gtk_assistant_get_nth_page") (GtkAssistantClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> GtkWidgetClass.PolyML.cPtr)
      val getPageComplete_ = call (getSymbol "gtk_assistant_get_page_complete") (GtkAssistantClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getPageHeaderImage_ = call (getSymbol "gtk_assistant_get_page_header_image") (GtkAssistantClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> GdkPixbufPixbufClass.PolyML.cPtr)
      val getPageSideImage_ = call (getSymbol "gtk_assistant_get_page_side_image") (GtkAssistantClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> GdkPixbufPixbufClass.PolyML.cPtr)
      val getPageTitle_ = call (getSymbol "gtk_assistant_get_page_title") (GtkAssistantClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPageType_ = call (getSymbol "gtk_assistant_get_page_type") (GtkAssistantClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> GtkAssistantPageType.PolyML.cVal)
      val insertPage_ =
        call (getSymbol "gtk_assistant_insert_page")
          (
            GtkAssistantClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             --> GInt32.PolyML.cVal
          )
      val nextPage_ = call (getSymbol "gtk_assistant_next_page") (GtkAssistantClass.PolyML.cPtr --> cVoid)
      val prependPage_ = call (getSymbol "gtk_assistant_prepend_page") (GtkAssistantClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val previousPage_ = call (getSymbol "gtk_assistant_previous_page") (GtkAssistantClass.PolyML.cPtr --> cVoid)
      val removeActionWidget_ = call (getSymbol "gtk_assistant_remove_action_widget") (GtkAssistantClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> cVoid)
      val removePage_ = call (getSymbol "gtk_assistant_remove_page") (GtkAssistantClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val setCurrentPage_ = call (getSymbol "gtk_assistant_set_current_page") (GtkAssistantClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val setPageComplete_ =
        call (getSymbol "gtk_assistant_set_page_complete")
          (
            GtkAssistantClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val setPageHeaderImage_ =
        call (getSymbol "gtk_assistant_set_page_header_image")
          (
            GtkAssistantClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GdkPixbufPixbufClass.PolyML.cOptPtr
             --> cVoid
          )
      val setPageSideImage_ =
        call (getSymbol "gtk_assistant_set_page_side_image")
          (
            GtkAssistantClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GdkPixbufPixbufClass.PolyML.cOptPtr
             --> cVoid
          )
      val setPageTitle_ =
        call (getSymbol "gtk_assistant_set_page_title")
          (
            GtkAssistantClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val setPageType_ =
        call (getSymbol "gtk_assistant_set_page_type")
          (
            GtkAssistantClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GtkAssistantPageType.PolyML.cVal
             --> cVoid
          )
      val updateButtonsState_ = call (getSymbol "gtk_assistant_update_buttons_state") (GtkAssistantClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GtkAssistantClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type assistant_page_type_t = GtkAssistantPageType.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkAssistantClass.FFI.fromPtr false) new_ ()
    fun addActionWidget self child = (GtkAssistantClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> I) addActionWidget_ (self & child)
    fun appendPage self page = (GtkAssistantClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> GInt32.FFI.fromVal) appendPage_ (self & page)
    fun commit self = (GtkAssistantClass.FFI.withPtr ---> I) commit_ self
    fun getCurrentPage self = (GtkAssistantClass.FFI.withPtr ---> GInt32.FFI.fromVal) getCurrentPage_ self
    fun getNPages self = (GtkAssistantClass.FFI.withPtr ---> GInt32.FFI.fromVal) getNPages_ self
    fun getNthPage self pageNum = (GtkAssistantClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> GtkWidgetClass.FFI.fromPtr false) getNthPage_ (self & pageNum)
    fun getPageComplete self page = (GtkAssistantClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> GBool.FFI.fromVal) getPageComplete_ (self & page)
    fun getPageHeaderImage self page = (GtkAssistantClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> GdkPixbufPixbufClass.FFI.fromPtr false) getPageHeaderImage_ (self & page)
    fun getPageSideImage self page = (GtkAssistantClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> GdkPixbufPixbufClass.FFI.fromPtr false) getPageSideImage_ (self & page)
    fun getPageTitle self page = (GtkAssistantClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getPageTitle_ (self & page)
    fun getPageType self page = (GtkAssistantClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> GtkAssistantPageType.FFI.fromVal) getPageType_ (self & page)
    fun insertPage self (page, position) =
      (
        GtkAssistantClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         ---> GInt32.FFI.fromVal
      )
        insertPage_
        (
          self
           & page
           & position
        )
    fun nextPage self = (GtkAssistantClass.FFI.withPtr ---> I) nextPage_ self
    fun prependPage self page = (GtkAssistantClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> GInt32.FFI.fromVal) prependPage_ (self & page)
    fun previousPage self = (GtkAssistantClass.FFI.withPtr ---> I) previousPage_ self
    fun removeActionWidget self child = (GtkAssistantClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> I) removeActionWidget_ (self & child)
    fun removePage self pageNum = (GtkAssistantClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) removePage_ (self & pageNum)
    fun setCurrentPage self pageNum = (GtkAssistantClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setCurrentPage_ (self & pageNum)
    fun setPageComplete self (page, complete) =
      (
        GtkAssistantClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GBool.FFI.withVal
         ---> I
      )
        setPageComplete_
        (
          self
           & page
           & complete
        )
    fun setPageHeaderImage self (page, pixbuf) =
      (
        GtkAssistantClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GdkPixbufPixbufClass.FFI.withOptPtr
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
        GtkAssistantClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GdkPixbufPixbufClass.FFI.withOptPtr
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
        GtkAssistantClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
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
        GtkAssistantClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GtkAssistantPageType.FFI.withVal
         ---> I
      )
        setPageType_
        (
          self
           & page
           & type'
        )
    fun updateButtonsState self = (GtkAssistantClass.FFI.withPtr ---> I) updateButtonsState_ self
    local
      open ClosureMarshal Signal
    in
      fun applySig f = signal "apply" (void ---> ret_void) f
      fun cancelSig f = signal "cancel" (void ---> ret_void) f
      fun closeSig f = signal "close" (void ---> ret_void) f
      fun prepareSig f = signal "prepare" (get 0w1 GtkWidgetClass.t ---> ret_void) f
    end
  end
