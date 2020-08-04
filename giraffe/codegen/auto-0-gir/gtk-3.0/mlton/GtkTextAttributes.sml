structure GtkTextAttributes :>
  GTK_TEXT_ATTRIBUTES
    where type t = GtkTextAttributesRecord.t =
  struct
    val getType_ = _import "gtk_text_attributes_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_text_attributes_new" : unit -> GtkTextAttributesRecord.FFI.non_opt GtkTextAttributesRecord.FFI.p;
    val copy_ = _import "gtk_text_attributes_copy" : GtkTextAttributesRecord.FFI.non_opt GtkTextAttributesRecord.FFI.p -> GtkTextAttributesRecord.FFI.non_opt GtkTextAttributesRecord.FFI.p;
    val copyValues_ = fn x1 & x2 => (_import "gtk_text_attributes_copy_values" : GtkTextAttributesRecord.FFI.non_opt GtkTextAttributesRecord.FFI.p * GtkTextAttributesRecord.FFI.non_opt GtkTextAttributesRecord.FFI.p -> unit;) (x1, x2)
    type t = GtkTextAttributesRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkTextAttributesRecord.FFI.fromPtr true) new_ ()
    fun copy self = (GtkTextAttributesRecord.FFI.withPtr false ---> GtkTextAttributesRecord.FFI.fromPtr true) copy_ self
    fun copyValues self dest = (GtkTextAttributesRecord.FFI.withPtr false &&&> GtkTextAttributesRecord.FFI.withPtr false ---> I) copyValues_ (self & dest)
  end
