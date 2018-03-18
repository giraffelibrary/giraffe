structure GtkSourceCompletionWords :>
  GTK_SOURCE_COMPLETION_WORDS
    where type 'a class = 'a GtkSourceCompletionWordsClass.class
    where type 'a completion_provider_class = 'a GtkSourceCompletionProviderClass.class
    where type completion_activation_t = GtkSourceCompletionActivation.t =
  struct
    val getType_ = _import "gtk_source_completion_words_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gtk_source_completion_words_new" :
              Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * unit GdkPixbufPixbufClass.FFI.p
               -> GtkSourceCompletionWordsClass.FFI.notnull GtkSourceCompletionWordsClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val register_ = fn x1 & x2 => (_import "gtk_source_completion_words_register" : GtkSourceCompletionWordsClass.FFI.notnull GtkSourceCompletionWordsClass.FFI.p * GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p -> unit;) (x1, x2)
    val unregister_ = fn x1 & x2 => (_import "gtk_source_completion_words_unregister" : GtkSourceCompletionWordsClass.FFI.notnull GtkSourceCompletionWordsClass.FFI.p * GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GtkSourceCompletionWordsClass.class
    type 'a completion_provider_class = 'a GtkSourceCompletionProviderClass.class
    type completion_activation_t = GtkSourceCompletionActivation.t
    type t = base class
    fun asCompletionProvider self = (GObjectObjectClass.FFI.withPtr ---> GtkSourceCompletionProviderClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (name, icon) = (Utf8.FFI.withOptPtr &&&> GdkPixbufPixbufClass.FFI.withOptPtr ---> GtkSourceCompletionWordsClass.FFI.fromPtr true) new_ (name & icon)
    fun register self buffer = (GtkSourceCompletionWordsClass.FFI.withPtr &&&> GtkTextBufferClass.FFI.withPtr ---> I) register_ (self & buffer)
    fun unregister self buffer = (GtkSourceCompletionWordsClass.FFI.withPtr &&&> GtkTextBufferClass.FFI.withPtr ---> I) unregister_ (self & buffer)
    local
      open Property
    in
      val activationProp =
        {
          get = fn x => get "activation" GtkSourceCompletionActivation.t x,
          set = fn x => set "activation" GtkSourceCompletionActivation.t x,
          new = fn x => new "activation" GtkSourceCompletionActivation.t x
        }
      val iconProp =
        {
          get = fn x => get "icon" GdkPixbufPixbufClass.tOpt x,
          set = fn x => set "icon" GdkPixbufPixbufClass.tOpt x,
          new = fn x => new "icon" GdkPixbufPixbufClass.tOpt x
        }
      val interactiveDelayProp =
        {
          get = fn x => get "interactive-delay" int x,
          set = fn x => set "interactive-delay" int x,
          new = fn x => new "interactive-delay" int x
        }
      val minimumWordSizeProp =
        {
          get = fn x => get "minimum-word-size" uint x,
          set = fn x => set "minimum-word-size" uint x,
          new = fn x => new "minimum-word-size" uint x
        }
      val nameProp =
        {
          get = fn x => get "name" stringOpt x,
          set = fn x => set "name" stringOpt x,
          new = fn x => new "name" stringOpt x
        }
      val priorityProp =
        {
          get = fn x => get "priority" int x,
          set = fn x => set "priority" int x,
          new = fn x => new "priority" int x
        }
      val proposalsBatchSizeProp =
        {
          get = fn x => get "proposals-batch-size" uint x,
          set = fn x => set "proposals-batch-size" uint x,
          new = fn x => new "proposals-batch-size" uint x
        }
      val scanBatchSizeProp =
        {
          get = fn x => get "scan-batch-size" uint x,
          set = fn x => set "scan-batch-size" uint x,
          new = fn x => new "scan-batch-size" uint x
        }
    end
  end
