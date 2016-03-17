structure GtkTargetList :>
  GTK_TARGET_LIST
    where type t = GtkTargetListRecord.t
    where type 'a text_buffer_class = 'a GtkTextBufferClass.class =
  struct
    val getType_ = _import "gtk_target_list_get_type" : unit -> GObjectType.C.val_;
    val add_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_target_list_add" :
              GtkTargetListRecord.C.notnull GtkTargetListRecord.C.p
               * GdkAtomRecord.C.notnull GdkAtomRecord.C.p
               * FFI.UInt32.C.val_
               * FFI.UInt32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val addImageTargets_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_target_list_add_image_targets" :
              GtkTargetListRecord.C.notnull GtkTargetListRecord.C.p
               * FFI.UInt32.C.val_
               * FFI.Bool.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val addRichTextTargets_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_target_list_add_rich_text_targets" :
              GtkTargetListRecord.C.notnull GtkTargetListRecord.C.p
               * FFI.UInt32.C.val_
               * FFI.Bool.C.val_
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val addTextTargets_ = fn x1 & x2 => (_import "gtk_target_list_add_text_targets" : GtkTargetListRecord.C.notnull GtkTargetListRecord.C.p * FFI.UInt32.C.val_ -> unit;) (x1, x2)
    val addUriTargets_ = fn x1 & x2 => (_import "gtk_target_list_add_uri_targets" : GtkTargetListRecord.C.notnull GtkTargetListRecord.C.p * FFI.UInt32.C.val_ -> unit;) (x1, x2)
    val remove_ = fn x1 & x2 => (_import "gtk_target_list_remove" : GtkTargetListRecord.C.notnull GtkTargetListRecord.C.p * GdkAtomRecord.C.notnull GdkAtomRecord.C.p -> unit;) (x1, x2)
    type t = GtkTargetListRecord.t
    type 'a text_buffer_class = 'a GtkTextBufferClass.class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun add self target flags info =
      (
        GtkTargetListRecord.C.withPtr
         &&&> GdkAtomRecord.C.withPtr
         &&&> FFI.UInt32.C.withVal
         &&&> FFI.UInt32.C.withVal
         ---> I
      )
        add_
        (
          self
           & target
           & flags
           & info
        )
    fun addImageTargets self info writable =
      (
        GtkTargetListRecord.C.withPtr
         &&&> FFI.UInt32.C.withVal
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        addImageTargets_
        (
          self
           & info
           & writable
        )
    fun addRichTextTargets self info deserializable buffer =
      (
        GtkTargetListRecord.C.withPtr
         &&&> FFI.UInt32.C.withVal
         &&&> FFI.Bool.C.withVal
         &&&> GObjectObjectClass.C.withPtr
         ---> I
      )
        addRichTextTargets_
        (
          self
           & info
           & deserializable
           & buffer
        )
    fun addTextTargets self info = (GtkTargetListRecord.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) addTextTargets_ (self & info)
    fun addUriTargets self info = (GtkTargetListRecord.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) addUriTargets_ (self & info)
    fun remove self target = (GtkTargetListRecord.C.withPtr &&&> GdkAtomRecord.C.withPtr ---> I) remove_ (self & target)
  end
