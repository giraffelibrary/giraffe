(**
 * GIRepository override
 *)

GIRepository.Override.callableInfoMayReturnNull := [
  (("Gtk", SOME "FileChooser", "get_filename"), true),
  (("Gtk", SOME "FileChooser", "get_current_folder"), true),
  (("Gtk", SOME "FileChooser", "get_uri"), true),
  (("Gtk", SOME "FileChooser", "get_current_folder_uri"), true),
  (("Gtk", SOME "FileChooser", "get_preview_widget"), true),
  (("Gtk", SOME "FileChooser", "get_preview_filename"), true),
  (("Gtk", SOME "FileChooser", "get_preview_uri"), true),
  (("Gtk", SOME "FileChooser", "get_extra_widget"), true),
  (("Gtk", SOME "FileChooser", "get_filter"), true),
  (("Gtk", SOME "FileChooser", "get_preview_file"), true),
  (("Gtk", SOME "Paned", "get_child1"), true),
  (("Gtk", SOME "Paned", "get_child2"), true),
  (("Gtk", SOME "Container", "get_focus_child"), true)
];

GIRepository.Override.argInfoMayBeNull := [
  (("GLib", SOME "Source", "attach", "context"), true),
  (("Gtk", SOME "Container", "set-focus-child", "object"), true)
];

let
  open GIRepository.Direction
in
  GIRepository.Override.argInfoDirection := [
    (("Gtk", SOME "TextIter", "get_attributes", "values"), IN)
  ]
end;

let
  open GIRepository.Transfer
in
  GIRepository.Override.callableInfoCallerOwns := [
    (("Vte", SOME "Terminal", "new"), NOTHING)
  ]
end;


(**
 * Struct names to include
 *
 * A struct that is a field of an included union is not in the struct list.
 *)

structNames := [
  ("GLib", "Error"),
  ("GLib", "IOChannel"),
  ("GLib", "KeyFile"),
  ("GLib", "MainContext"),
  ("GLib", "MatchInfo"),
  ("GLib", "Regex"),
  ("GLib", "Source"),
  ("GLib", "TimeVal"),
  ("GObject", "Closure"),
  ("Gdk", "Atom"),
  ("Gdk", "Color"),
  ("Gdk", "Geometry"),
  ("Gdk", "KeymapKey"),
  ("Gdk", "RGBA"),
  ("Gdk", "WindowAttr"),
  ("GdkPixbuf", "PixbufFormat"),
  ("Gtk", "AccelKey"),
  ("Gtk", "Border"),
  ("Gtk", "FileFilterInfo"),
  ("Gtk", "IconInfo"),
  ("Gtk", "IconSet"),
  ("Gtk", "IconSource"),
  ("Gtk", "PaperSize"),
  ("Gtk", "RecentData"),
  ("Gtk", "RecentFilterInfo"),
  ("Gtk", "RecentInfo"),
  ("Gtk", "Requisition"),
  ("Gtk", "SelectionData"),
  ("Gtk", "SettingsValue"),
  ("Gtk", "StockItem"),
  ("Gtk", "SymbolicColor"),
  ("Gtk", "TargetEntry"),
  ("Gtk", "TargetList"),
  ("Gtk", "TextAttributes"),
  ("Gtk", "TextIter"),
  ("Gtk", "TreeIter"),
  ("Gtk", "TreePath"),
  ("Gtk", "WidgetPath"),
  ("cairo", "Context"),
  ("cairo", "FontOptions"),
  ("cairo", "Pattern"),
  ("cairo", "RectangleInt"),
  ("cairo", "Region"),
  ("cairo", "ScaledFont"),
  ("cairo", "Surface"),
  ("Pango", "Attribute"),
  ("Pango", "AttrList"),
  ("Pango", "Color"),
  ("Pango", "FontDescription"),
  ("Pango", "FontMetrics"),
  ("Pango", "GlyphItem"),
  ("Pango", "GlyphString"),
  ("Pango", "Language"),
  ("Pango", "LayoutIter"),
  ("Pango", "LayoutLine"),
  ("Pango", "LogAttr"),
  ("Pango", "Matrix"),
  ("Pango", "Rectangle"),
  ("Pango", "TabArray")
];


(**
 * Union names to include
 *)

unionNames := [
  ("Gdk", "Event")
];


(**
 * Function names to skip
 *)

(* Manually specified symbols
 *
 * Notes
 *
 *   1. Parameter selection_data is annotated with (out) but should probably
 *      be (inout).  (out) requires `withNewPtr` which cannot be implemented
 *      because size of GtkSelectionData is not known by C compiler.
 *
 *)
excludedFunctionSymbols := [
  "pango_break",
  "pango_default_break",
  "pango_get_log_attrs",
  "pango_glyph_item_letter_space",
  "pango_shape",
  "pango_read_line",
  "pango_skip_space",
  "pango_scan_int",
  "pango_scan_string",
  "pango_scan_word",
  "pango_attribute_init",
  "pango_attribute_destroy",
  "g_regex_escape_string",  (* GIR data broken: says param 0 is utf8 array *)
  "g_source_new",
  "g_source_set_callback_indirect",
  "g_source_add_poll",
  "g_source_remove_poll",
  "g_source_set_funcs",
  "g_source_remove_by_funcs_user_data",
  "g_source_remove_by_user_data",
  "g_closure_new_simple",
  "g_closure_new_object",
  "g_param_spec_pool_new",
  "g_param_value_convert",
  "g_param_value_defaults",
  "g_param_value_set_default",
  "g_param_value_validate",
  "g_param_values_cmp",
  "g_signal_accumulator_first_wins",
  "g_signal_accumulator_true_handled",
  "g_signal_chain_from_overridden",
  "g_signal_get_invocation_hint",
  "g_signal_has_handler_pending",
  "g_signal_name",
  "g_signal_query",
  "g_signal_remove_emission_hook",
  "g_signal_stop_emission",
  "g_signal_stop_emission_by_name",
  "g_source_set_closure",
  "g_source_set_dummy_callback",
  "g_strdup_value_contents",
  "g_type_check_instance",
  "g_type_check_value",
  "g_type_class_add_private",
  "g_type_default_interface_unref",
  "g_type_free_instance",
  "g_type_name_from_class",
  "g_type_name_from_instance",
  "g_dbus_error_register_error",
  "g_dbus_error_unregister_error",
  "gdk_pixbuf_error_quark",
  "gdk_add_option_entries_libgtk_only",
  "gtk_accel_map_load_scanner",
  "gtk_binding_entry_add_signal_from_string",
  "gtk_binding_entry_remove",
  "gtk_binding_set_find",
  "gtk_bindings_activate",
  "gtk_bindings_activate_event",
  "gtk_binding_entry_skip",
  "gtk_buildable_custom_tag_start",
  "gtk_distribute_natural_allocation",
  "gtk_rc_parse_color",  (* deprecated anyway? *)
  "gtk_rc_parse_color_full",  (* deprecated anyway? *)
  "gtk_rc_property_parse_color",
  "gtk_rc_property_parse_border",
  "gtk_rc_property_parse_enum",
  "gtk_rc_property_parse_flags",
  "gtk_rc_property_parse_requisition",
  "gtk_tree_drag_source_drag_data_get",  (* see note 1 *)
  "vte_pty_error_quark"
];

excludedFunctionSymbolPrefixes := [
  "g_cclosure_marshal",
  "g_signal_connect",
  "g_signal_handler"
];

excludedFunctionSymbolSuffixes := [
];

(* Systematically formed names that do not belong in the user API *)
nonUserFunctionNames := [
  "ref",
  "ref_sink",
  "sink",
  "unref",
  "free",
  "false",
  "true",
  "quark",
  "error_quark"
];


(**
 * Flag/enum value names to transform
 *)

newFlagsEnumValueNames := [
  ("2big", "too_big"),
  ("2button_press", "double_button_press"),
  ("3button_press", "triple_button_press")
];
