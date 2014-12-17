structure GtkSourceCompletionInfo :>
  GTK_SOURCE_COMPLETION_INFO
    where type 'a class_t = 'a GtkSourceCompletionInfoClass.t =
  struct
    val getType_ = _import "gtk_source_completion_info_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_source_completion_info_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getWidget_ = _import "gtk_source_completion_info_get_widget" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val moveToIter_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_completion_info_move_to_iter" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GtkTextIterRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setWidget_ = fn x1 & x2 => (_import "gtk_source_completion_info_set_widget" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GObjectObjectClass.C.p -> unit;) (x1, x2)
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
