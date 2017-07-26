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
    (* bug 783392 *)
    (("Gio", SOME "DBusInterfaceInfo", "generate_xml", "string_builder"), IN),

    (* bug 770421 *)
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
 * Interfaces to exclude
 *)

excludedInterfaceTypes := [
];


(**
 * Struct types
 *
 * A struct that is a field of an included union is not in the struct list.
 *)

structTypes := [
  (("GLib", "Error"),                 Record {dup = "g_error_copy", free = "g_error_free"}),
  (("GLib", "IOChannel"),             Record {dup = "g_io_channel_ref", free = "g_io_channel_unref"}),
  (("GLib", "KeyFile"),               Record {dup = "g_key_file_ref", free = "g_key_file_unref"}),
  (("GLib", "MainContext"),           Record {dup = "g_main_context_ref", free = "g_main_context_unref"}),
  (("GLib", "MatchInfo"),             Record {dup = "g_match_info_ref", free = "g_match_info_unref"}),
  (("GLib", "PollFD"),                ValueRecord),
  (("GLib", "Regex"),                 Record {dup = "g_regex_ref", free = "g_regex_unref"}),
  (("GLib", "Source"),                Record {dup = "g_source_ref", free = "g_source_unref"}),
  (("GLib", "String"),                Record {dup = "gstring_copy", free = "gstring_free"}),
  (("GLib", "TimeVal"),               ValueRecord),
  (("GLib", "Variant"),               Record {dup = "g_variant_ref_sink", free = "g_variant_unref"}),
  (("GLib", "VariantType"),           Record {dup = "g_variant_type_copy", free = "g_variant_type_free"}),
  (("GObject", "Closure"),            Record {dup = "g_closure_ref_sink", free = "g_closure_unref"}),
                                      (* g_closure_ref_sink doesn't exist but file replaced by fixed version *)
  (("GObject", "ValueArray"),         Record {dup = "g_value_array_copy", free = "g_value_array_free"}),
  (("Gio", "DBusAnnotationInfo"),     Record {dup = "g_dbus_annotation_info_ref", free = "g_dbus_annotation_info_unref"}),
  (("Gio", "DBusInterfaceInfo"),      Record {dup = "g_dbus_interface_info_ref", free = "g_dbus_interface_info_unref"}),
  (("Gio", "DBusMethodInfo"),         Record {dup = "g_dbus_method_info_ref", free = "g_dbus_method_info_unref"}),
  (("Gio", "DBusPropertyInfo"),       Record {dup = "g_dbus_property_info_ref", free = "g_dbus_property_info_unref"}),
  (("Gio", "DBusSignalInfo"),         Record {dup = "g_dbus_signal_info_ref", free = "g_dbus_signal_info_unref"}),
  (("Gio", "FileAttributeInfo"),      ValueRecord),
  (("Gio", "FileAttributeInfoList"),  Record {dup = "g_file_attribute_info_list_dup", free = "g_file_attribute_info_list_unref"}),
  (("Gio", "FileAttributeMatcher"),   Record {dup = "g_file_attribute_matcher_ref", free = "g_file_attribute_matcher_unref"}),
  (("Gio", "IOExtension"),            DisguisedRecord),
  (("Gio", "IOExtensionPoint"),       DisguisedRecord),
  (("Gio", "IOModuleScope"),          DisguisedRecord),
  (("Gio", "SettingsBackend"),        DisguisedRecord),
  (("Gio", "UnixMountEntry"),         DisguisedRecord),
  (("Atk", "Rectangle"),              ValueRecord),
  (("Atk", "TextRange"),              Record {dup = "atk_text_range_copy", free = "atk_text_range_free"}),
  (("Atk", "TextRectangle"),          ValueRecord),
  (("Gdk", "Atom"),                   DisguisedRecord),
  (("Gdk", "Geometry"),               ValueRecord),
  (("Gdk", "Color"),                  ValueRecord),
  (("Gdk", "KeymapKey"),              ValueRecord),
  (("Gdk", "RGBA"),                   ValueRecord),
  (("Gdk", "WindowAttr"),             Record {dup = "giraffe_gdk_window_attr_dup", free = "giraffe_gdk_window_attr_free"}),
  (("GdkPixbuf", "PixbufFormat"),     Record {dup = "gdk_pixbuf_format_copy", free = "gdk_pixbuf_format_free"}),
  (("Gtk", "AccelKey"),               ValueRecord),
  (("Gtk", "Border"),                 ValueRecord),
  (("Gtk", "FileFilterInfo"),         ValueRecord),
  (("Gtk", "IconInfo"),               Record {dup = "gtk_icon_info_copy", free = "gtk_icon_info_free"}),
  (("Gtk", "IconSet"),                Record {dup = "gtk_icon_set_ref", free = "gtk_icon_set_unref"}),
  (("Gtk", "IconSource"),             Record {dup = "gtk_icon_source_copy", free = "gtk_icon_source_free"}),
  (("Gtk", "PaperSize"),              Record {dup = "gtk_paper_size_copy", free = "gtk_paper_size_free"}),
  (("Gtk", "RecentData"),             ValueRecord),
  (("Gtk", "RecentFilterInfo"),       ValueRecord),
  (("Gtk", "RecentInfo"),             Record {dup = "gtk_recent_info_ref", free = "gtk_recent_info_unref"}),
  (("Gtk", "Requisition"),            ValueRecord),
  (("Gtk", "SelectionData"),          Record {dup = "gtk_selection_data_copy", free = "gtk_selection_data_free"}),
  (("Gtk", "SettingsValue"),          ValueRecord),
  (("Gtk", "StockItem"),              ValueRecord),
  (("Gtk", "SymbolicColor"),          Record {dup = "gtk_symbolic_color_ref", free = "gtk_symbolic_color_unref"}),
  (("Gtk", "TargetEntry"),            Record {dup = "gtk_target_entry_copy", free = "gtk_target_entry_free"}),
  (("Gtk", "TargetList"),             Record {dup = "gtk_target_list_ref", free = "gtk_target_list_unref"}),
  (("Gtk", "TextAttributes"),         Record {dup = "gtk_text_attributes_ref", free = "gtk_text_attributes_unref"}),
  (("Gtk", "TextIter"),               ValueRecord),
  (("Gtk", "TreeIter"),               ValueRecord),
  (("Gtk", "TreePath"),               Record {dup = "gtk_tree_path_copy", free = "gtk_tree_path_free"}),
  (("Gtk", "WidgetPath"),             Record {dup = "gtk_widget_path_ref", free = "gtk_widget_path_unref"}),
  (("cairo", "Context"),              Record {dup = "cairo_reference", free = "cairo_destroy"}),
  (("cairo", "FontOptions"),          Record {dup = "cairo_font_options_copy", free = "cairo_font_options_destroy"}),
  (("cairo", "Pattern"),              Record {dup = "cairo_pattern_reference", free = "cairo_pattern_destroy"}),
  (("cairo", "RectangleInt"),         ValueRecord),
  (("cairo", "Region"),               Record {dup = "cairo_region_reference", free = "cairo_region_destroy"}),
  (("cairo", "ScaledFont"),           Record {dup = "cairo_scaled_font_reference", free = "cairo_scaled_font_destroy"}),
  (("cairo", "Surface"),              Record {dup = "cairo_surface_reference", free = "cairo_surface_destroy"}),
  (("Pango", "Attribute"),            Record {dup = "pango_attribute_copy", free = "pango_attribute_destroy"}),
  (("Pango", "AttrList"),             Record {dup = "pango_attr_list_ref", free = "pango_attr_list_unref"}),
  (("Pango", "Color"),                Record {dup = "pango_color_copy", free = "pango_color_free"}),
  (("Pango", "FontDescription"),      Record {dup = "pango_font_description_copy", free = "pango_font_description_free"}),
  (("Pango", "FontMetrics"),          Record {dup = "pango_font_metrics_ref", free = "pango_font_metrics_unref"}),
  (("Pango", "GlyphItem"),            Record {dup = "pango_glyph_item_copy", free = "pango_glyph_item_free"}),
  (("Pango", "GlyphString"),          Record {dup = "pango_glyph_string_copy", free = "pango_glyph_string_free"}),
  (("Pango", "Language"),             Record {dup = "pango_language_copy", free = "pango_language_free"}),
  (("Pango", "LayoutIter"),           Record {dup = "pango_layout_iter_copy", free = "pango_layout_iter_free"}),
  (("Pango", "LayoutLine"),           Record {dup = "pango_layout_line_ref", free = "pango_layout_line_unref"}),
  (("Pango", "LogAttr"),              ValueRecord),
  (("Pango", "Matrix"),               Record {dup = "pango_matrix_copy", free = "pango_matrix_free"}),
  (("Pango", "Rectangle"),            ValueRecord),
  (("Pango", "TabArray"),             Record {dup = "pango_tab_array_copy", free = "pango_tab_array_free"})
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
