structure GtkSourceCompletionInfo :>
  GTK_SOURCE_COMPLETION_INFO
    where type 'a class_t = 'a GtkSourceCompletionInfoClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_completion_info_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtksourceview "gtk_source_completion_info_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val getWidget_ = call (load_sym libgtksourceview "gtk_source_completion_info_get_widget") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val moveToIter_ =
        call (load_sym libgtksourceview "gtk_source_completion_info_move_to_iter")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cOptPtr
             --> FFI.PolyML.cVoid
          )
      val setWidget_ = call (load_sym libgtksourceview "gtk_source_completion_info_set_widget") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GtkSourceCompletionInfoClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkSourceCompletionInfoClass.C.fromPtr false) new_ ()
    fun getWidget self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getWidget_ self
    fun moveToIter self view iter =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GtkTextIterRecord.C.withOptPtr
         ---> I
      )
        moveToIter_
        (
          self
           & view
           & iter
        )
    fun setWidget self widget = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setWidget_ (self & widget)
    local
      open ClosureMarshal Signal
    in
      fun beforeShowSig f = signal "before-show" (void ---> ret_void) f
    end
  end
