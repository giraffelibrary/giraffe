structure GtkSourceStyle :>
  GTK_SOURCE_STYLE
    where type 'a class_t = 'a GtkSourceStyleClass.t =
  struct
    val getType_ = _import "gtk_source_style_get_type" : unit -> GObjectType.C.val_;
    val copy_ = _import "gtk_source_style_copy" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    type 'a class_t = 'a GtkSourceStyleClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun copy self = (GObjectObjectClass.C.withPtr ---> GtkSourceStyleClass.C.fromPtr true) copy_ self
    local
      open Property
    in
      val backgroundProp =
        {
          get = fn x => get "background" stringOpt x,
          set = fn x => set "background" stringOpt x
        }
      val backgroundSetProp =
        {
          get = fn x => get "background-set" boolean x,
          set = fn x => set "background-set" boolean x
        }
      val boldProp =
        {
          get = fn x => get "bold" boolean x,
          set = fn x => set "bold" boolean x
        }
      val boldSetProp =
        {
          get = fn x => get "bold-set" boolean x,
          set = fn x => set "bold-set" boolean x
        }
      val foregroundProp =
        {
          get = fn x => get "foreground" stringOpt x,
          set = fn x => set "foreground" stringOpt x
        }
      val foregroundSetProp =
        {
          get = fn x => get "foreground-set" boolean x,
          set = fn x => set "foreground-set" boolean x
        }
      val italicProp =
        {
          get = fn x => get "italic" boolean x,
          set = fn x => set "italic" boolean x
        }
      val italicSetProp =
        {
          get = fn x => get "italic-set" boolean x,
          set = fn x => set "italic-set" boolean x
        }
      val lineBackgroundProp =
        {
          get = fn x => get "line-background" stringOpt x,
          set = fn x => set "line-background" stringOpt x
        }
      val lineBackgroundSetProp =
        {
          get = fn x => get "line-background-set" boolean x,
          set = fn x => set "line-background-set" boolean x
        }
      val strikethroughProp =
        {
          get = fn x => get "strikethrough" boolean x,
          set = fn x => set "strikethrough" boolean x
        }
      val strikethroughSetProp =
        {
          get = fn x => get "strikethrough-set" boolean x,
          set = fn x => set "strikethrough-set" boolean x
        }
      val underlineProp =
        {
          get = fn x => get "underline" boolean x,
          set = fn x => set "underline" boolean x
        }
      val underlineSetProp =
        {
          get = fn x => get "underline-set" boolean x,
          set = fn x => set "underline-set" boolean x
        }
    end
  end
