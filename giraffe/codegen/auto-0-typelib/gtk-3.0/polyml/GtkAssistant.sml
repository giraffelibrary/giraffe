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
      val getType_ = call (load_sym libgtk "gtk_assistant_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_assistant_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val addActionWidget_ = call (load_sym libgtk "gtk_assistant_add_action_widget") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val appendPage_ = call (load_sym libgtk "gtk_assistant_append_page") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val commit_ = call (load_sym libgtk "gtk_assistant_commit") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getCurrentPage_ = call (load_sym libgtk "gtk_assistant_get_current_page") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getNPages_ = call (load_sym libgtk "gtk_assistant_get_n_pages") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getNthPage_ = call (load_sym libgtk "gtk_assistant_get_nth_page") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> GObjectObjectClass.PolyML.cPtr)
      val getPageComplete_ = call (load_sym libgtk "gtk_assistant_get_page_complete") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getPageTitle_ = call (load_sym libgtk "gtk_assistant_get_page_title") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPageType_ = call (load_sym libgtk "gtk_assistant_get_page_type") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> GtkAssistantPageType.PolyML.cVal)
      val insertPage_ =
        call (load_sym libgtk "gtk_assistant_insert_page")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             --> FFI.Int32.PolyML.cVal
          )
      val nextPage_ = call (load_sym libgtk "gtk_assistant_next_page") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val prependPage_ = call (load_sym libgtk "gtk_assistant_prepend_page") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val previousPage_ = call (load_sym libgtk "gtk_assistant_previous_page") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val removeActionWidget_ = call (load_sym libgtk "gtk_assistant_remove_action_widget") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val removePage_ = call (load_sym libgtk "gtk_assistant_remove_page") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setCurrentPage_ = call (load_sym libgtk "gtk_assistant_set_current_page") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setPageComplete_ =
        call (load_sym libgtk "gtk_assistant_set_page_complete")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setPageTitle_ =
        call (load_sym libgtk "gtk_assistant_set_page_title")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             --> FFI.PolyML.cVoid
          )
      val setPageType_ =
        call (load_sym libgtk "gtk_assistant_set_page_type")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GtkAssistantPageType.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val updateButtonsState_ = call (load_sym libgtk "gtk_assistant_update_buttons_state") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkAssistantClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type assistant_page_type_t = GtkAssistantPageType.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkAssistantClass.C.fromPtr false) new_ ()
    fun addActionWidget self child = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) addActionWidget_ (self & child)
    fun appendPage self page = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) appendPage_ (self & page)
    fun commit self = (GObjectObjectClass.C.withPtr ---> I) commit_ self
    fun getCurrentPage self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getCurrentPage_ self
    fun getNPages self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getNPages_ self
    fun getNthPage self pageNum = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> GtkWidgetClass.C.fromPtr false) getNthPage_ (self & pageNum)
    fun getPageComplete self page = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getPageComplete_ (self & page)
    fun getPageTitle self page = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getPageTitle_ (self & page)
    fun getPageType self page = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> GtkAssistantPageType.C.fromVal) getPageType_ (self & page)
    fun insertPage self page position =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         ---> FFI.Int32.C.fromVal
      )
        insertPage_
        (
          self
           & page
           & position
        )
    fun nextPage self = (GObjectObjectClass.C.withPtr ---> I) nextPage_ self
    fun prependPage self page = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) prependPage_ (self & page)
    fun previousPage self = (GObjectObjectClass.C.withPtr ---> I) previousPage_ self
    fun removeActionWidget self child = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) removeActionWidget_ (self & child)
    fun removePage self pageNum = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) removePage_ (self & pageNum)
    fun setCurrentPage self pageNum = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setCurrentPage_ (self & pageNum)
    fun setPageComplete self page complete =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GtkAssistantPageType.C.withVal
         ---> I
      )
        setPageType_
        (
          self
           & page
           & type'
        )
    fun updateButtonsState self = (GObjectObjectClass.C.withPtr ---> I) updateButtonsState_ self
    local
      open ClosureMarshal Signal
    in
      fun applySig f = signal "apply" (void ---> ret_void) f
      fun cancelSig f = signal "cancel" (void ---> ret_void) f
      fun closeSig f = signal "close" (void ---> ret_void) f
      fun prepareSig f = signal "prepare" (get 0w1 GtkWidgetClass.t ---> ret_void) f
    end
  end
