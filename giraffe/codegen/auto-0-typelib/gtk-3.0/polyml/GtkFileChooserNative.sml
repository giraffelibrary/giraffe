structure GtkFileChooserNative :>
  GTK_FILE_CHOOSER_NATIVE
    where type 'a class = 'a GtkFileChooserNativeClass.class
    where type 'a file_chooser_class = 'a GtkFileChooserClass.class
    where type file_chooser_action_t = GtkFileChooserAction.t
    where type 'a window_class = 'a GtkWindowClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_file_chooser_native_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (getSymbol "gtk_file_chooser_native_new")
          (
            Utf8.PolyML.cInOptPtr
             &&> GtkWindowClass.PolyML.cOptPtr
             &&> GtkFileChooserAction.PolyML.cVal
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInOptPtr
             --> GtkFileChooserNativeClass.PolyML.cPtr
          )
      val getAcceptLabel_ = call (getSymbol "gtk_file_chooser_native_get_accept_label") (GtkFileChooserNativeClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getCancelLabel_ = call (getSymbol "gtk_file_chooser_native_get_cancel_label") (GtkFileChooserNativeClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val setAcceptLabel_ = call (getSymbol "gtk_file_chooser_native_set_accept_label") (GtkFileChooserNativeClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setCancelLabel_ = call (getSymbol "gtk_file_chooser_native_set_cancel_label") (GtkFileChooserNativeClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
    end
    type 'a class = 'a GtkFileChooserNativeClass.class
    type 'a file_chooser_class = 'a GtkFileChooserClass.class
    type file_chooser_action_t = GtkFileChooserAction.t
    type 'a window_class = 'a GtkWindowClass.class
    type t = base class
    fun asFileChooser self = (GObjectObjectClass.FFI.withPtr false ---> GtkFileChooserClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new
      (
        title,
        parent,
        action,
        acceptLabel,
        cancelLabel
      ) =
      (
        Utf8.FFI.withOptPtr 0
         &&&> GtkWindowClass.FFI.withOptPtr false
         &&&> GtkFileChooserAction.FFI.withVal
         &&&> Utf8.FFI.withOptPtr 0
         &&&> Utf8.FFI.withOptPtr 0
         ---> GtkFileChooserNativeClass.FFI.fromPtr true
      )
        new_
        (
          title
           & parent
           & action
           & acceptLabel
           & cancelLabel
        )
    fun getAcceptLabel self = (GtkFileChooserNativeClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getAcceptLabel_ self
    fun getCancelLabel self = (GtkFileChooserNativeClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getCancelLabel_ self
    fun setAcceptLabel self acceptLabel = (GtkFileChooserNativeClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setAcceptLabel_ (self & acceptLabel)
    fun setCancelLabel self cancelLabel = (GtkFileChooserNativeClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setCancelLabel_ (self & cancelLabel)
    local
      open Property
    in
      val acceptLabelProp =
        {
          get = fn x => get "accept-label" stringOpt x,
          set = fn x => set "accept-label" stringOpt x,
          new = fn x => new "accept-label" stringOpt x
        }
      val cancelLabelProp =
        {
          get = fn x => get "cancel-label" stringOpt x,
          set = fn x => set "cancel-label" stringOpt x,
          new = fn x => new "cancel-label" stringOpt x
        }
    end
  end
