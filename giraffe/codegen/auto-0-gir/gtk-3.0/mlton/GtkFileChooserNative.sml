structure GtkFileChooserNative :>
  GTK_FILE_CHOOSER_NATIVE
    where type 'a class = 'a GtkFileChooserNativeClass.class
    where type 'a file_chooser_class = 'a GtkFileChooserClass.class
    where type file_chooser_action_t = GtkFileChooserAction.t
    where type 'a window_class = 'a GtkWindowClass.class =
  struct
    val getType_ = _import "gtk_file_chooser_native_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        (x1, x2)
         & x3
         & x4
         & (x5, x6)
         & (x7, x8) =>
          (
            _import "mlton_gtk_file_chooser_native_new" :
              Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * unit GtkWindowClass.FFI.p
               * GtkFileChooserAction.FFI.val_
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> GtkFileChooserNativeClass.FFI.notnull GtkFileChooserNativeClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    val getAcceptLabel_ = _import "gtk_file_chooser_native_get_accept_label" : GtkFileChooserNativeClass.FFI.notnull GtkFileChooserNativeClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getCancelLabel_ = _import "gtk_file_chooser_native_get_cancel_label" : GtkFileChooserNativeClass.FFI.notnull GtkFileChooserNativeClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val setAcceptLabel_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_file_chooser_native_set_accept_label" :
              GtkFileChooserNativeClass.FFI.notnull GtkFileChooserNativeClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setCancelLabel_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_file_chooser_native_set_cancel_label" :
              GtkFileChooserNativeClass.FFI.notnull GtkFileChooserNativeClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkFileChooserNativeClass.class
    type 'a file_chooser_class = 'a GtkFileChooserClass.class
    type file_chooser_action_t = GtkFileChooserAction.t
    type 'a window_class = 'a GtkWindowClass.class
    type t = base class
    fun asFileChooser self = (GObjectObjectClass.FFI.withPtr ---> GtkFileChooserClass.FFI.fromPtr false) I self
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
        Utf8.FFI.withOptPtr
         &&&> GtkWindowClass.FFI.withOptPtr
         &&&> GtkFileChooserAction.FFI.withVal
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
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
    fun getAcceptLabel self = (GtkFileChooserNativeClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getAcceptLabel_ self
    fun getCancelLabel self = (GtkFileChooserNativeClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getCancelLabel_ self
    fun setAcceptLabel self acceptLabel = (GtkFileChooserNativeClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setAcceptLabel_ (self & acceptLabel)
    fun setCancelLabel self cancelLabel = (GtkFileChooserNativeClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setCancelLabel_ (self & cancelLabel)
    local
      open Property
    in
      val acceptLabelProp =
        {
          get = fn x => get "accept-label" stringOpt x,
          set = fn x => set "accept-label" stringOpt x
        }
      val cancelLabelProp =
        {
          get = fn x => get "cancel-label" stringOpt x,
          set = fn x => set "cancel-label" stringOpt x
        }
    end
  end
