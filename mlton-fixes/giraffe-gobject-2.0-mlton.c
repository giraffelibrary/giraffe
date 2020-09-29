#include "cvector.h"
#include "cvectorvector.h"

void
mlton_g_closure_invoke (GClosure* closure,
                        GValue* return_value,
                        guint n_param_values,
                        SML_CVECTOR_VAL(GValue, param_values),
                        gpointer invocation_hint)
{
  g_closure_invoke (closure,
                    return_value,
                    n_param_values,
                    GET_SML_CVECTOR_VAL(GValue, param_values),
                    invocation_hint);
}

gpointer
mlton_g_object_newv (GType object_type,
                     guint n_parameters,
                     SML_CVECTOR_VAL(GParameter, parameters))
{
  return g_object_newv (object_type,
                        n_parameters,
                        GET_SML_CVECTOR_VAL(GParameter, parameters));
}

#if GLIB_CHECK_VERSION(2, 4, 0)
GParamSpec*
mlton_g_object_interface_find_property (gpointer g_iface,
                                        SML_CVECTOR_VAL(const gchar, property_name))
{
  return g_object_interface_find_property (g_iface,
                                           GET_SML_CVECTOR_VAL(const gchar, property_name));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
GBinding*
mlton_g_object_bind_property (gpointer source,
                              SML_CVECTOR_VAL(const gchar, source_property),
                              gpointer target,
                              SML_CVECTOR_VAL(const gchar, target_property),
                              GBindingFlags flags)
{
  return g_object_bind_property (source,
                                 GET_SML_CVECTOR_VAL(const gchar, source_property),
                                 target,
                                 GET_SML_CVECTOR_VAL(const gchar, target_property),
                                 flags);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
GBinding*
mlton_g_object_bind_property_with_closures (gpointer source,
                                            SML_CVECTOR_VAL(const gchar, source_property),
                                            gpointer target,
                                            SML_CVECTOR_VAL(const gchar, target_property),
                                            GBindingFlags flags,
                                            GClosure* transform_to,
                                            GClosure* transform_from)
{
  return g_object_bind_property_with_closures (source,
                                               GET_SML_CVECTOR_VAL(const gchar, source_property),
                                               target,
                                               GET_SML_CVECTOR_VAL(const gchar, target_property),
                                               flags,
                                               transform_to,
                                               transform_from);
}
#endif

gpointer
mlton_g_object_get_data (GObject* object,
                         SML_CVECTOR_VAL(const gchar, key))
{
  return g_object_get_data (object,
                            GET_SML_CVECTOR_VAL(const gchar, key));
}

void
mlton_g_object_get_property (GObject* object,
                             SML_CVECTOR_VAL(const gchar, property_name),
                             GValue* value)
{
  g_object_get_property (object,
                         GET_SML_CVECTOR_VAL(const gchar, property_name),
                         value);
}

void
mlton_g_object_notify (GObject* object,
                       SML_CVECTOR_VAL(const gchar, property_name))
{
  g_object_notify (object,
                   GET_SML_CVECTOR_VAL(const gchar, property_name));
}

#if GLIB_CHECK_VERSION(2, 34, 0)
gboolean
mlton_g_object_replace_data (GObject* object,
                             SML_CVECTOR_VAL(const gchar, key),
                             gpointer oldval,
                             gpointer newval,
                             GDestroyNotify destroy,
                             GDestroyNotify* old_destroy)
{
  return g_object_replace_data (object,
                                GET_SML_CVECTOR_VAL(const gchar, key),
                                oldval,
                                newval,
                                destroy,
                                old_destroy);
}
#endif

void
mlton_g_object_set_data (GObject* object,
                         SML_CVECTOR_VAL(const gchar, key),
                         gpointer data)
{
  g_object_set_data (object,
                     GET_SML_CVECTOR_VAL(const gchar, key),
                     data);
}

void
mlton_g_object_set_property (GObject* object,
                             SML_CVECTOR_VAL(const gchar, property_name),
                             const GValue* value)
{
  g_object_set_property (object,
                         GET_SML_CVECTOR_VAL(const gchar, property_name),
                         value);
}

gpointer
mlton_g_object_steal_data (GObject* object,
                           SML_CVECTOR_VAL(const gchar, key))
{
  return g_object_steal_data (object,
                              GET_SML_CVECTOR_VAL(const gchar, key));
}

GParamSpec*
mlton_g_object_class_find_property (GObjectClass* oclass,
                                    SML_CVECTOR_VAL(const gchar, property_name))
{
  return g_object_class_find_property (oclass,
                                       GET_SML_CVECTOR_VAL(const gchar, property_name));
}

#if GLIB_CHECK_VERSION(2, 26, 0)
void
mlton_g_object_class_install_properties (GObjectClass* oclass,
                                         guint n_pspecs,
                                         SML_CVECTOR_VAL(GParamSpec*, pspecs))
{
  g_object_class_install_properties (oclass,
                                     n_pspecs,
                                     GET_SML_CVECTOR_VAL(GParamSpec*, pspecs));
}
#endif

#if GLIB_CHECK_VERSION(2, 4, 0)
void
mlton_g_object_class_override_property (GObjectClass* oclass,
                                        guint property_id,
                                        SML_CVECTOR_VAL(const gchar, name))
{
  g_object_class_override_property (oclass,
                                    property_id,
                                    GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

GParamSpec*
mlton_g_param_spec_pool_lookup (GParamSpecPool* pool,
                                SML_CVECTOR_VAL(const gchar, param_name),
                                GType owner_type,
                                gboolean walk_ancestors)
{
  return g_param_spec_pool_lookup (pool,
                                   GET_SML_CVECTOR_VAL(const gchar, param_name),
                                   owner_type,
                                   walk_ancestors);
}

#if GLIB_CHECK_VERSION(2, 6, 0)
GType
mlton_g_type_module_register_enum (GTypeModule* module,
                                   SML_CVECTOR_VAL(const gchar, name),
                                   const GEnumValue* const_static_values)
{
  return g_type_module_register_enum (module,
                                      GET_SML_CVECTOR_VAL(const gchar, name),
                                      const_static_values);
}
#endif

#if GLIB_CHECK_VERSION(2, 6, 0)
GType
mlton_g_type_module_register_flags (GTypeModule* module,
                                    SML_CVECTOR_VAL(const gchar, name),
                                    const GFlagsValue* const_static_values)
{
  return g_type_module_register_flags (module,
                                       GET_SML_CVECTOR_VAL(const gchar, name),
                                       const_static_values);
}
#endif

GType
mlton_g_type_module_register_type (GTypeModule* module,
                                   GType parent_type,
                                   SML_CVECTOR_VAL(const gchar, type_name),
                                   const GTypeInfo* type_info,
                                   GTypeFlags flags)
{
  return g_type_module_register_type (module,
                                      parent_type,
                                      GET_SML_CVECTOR_VAL(const gchar, type_name),
                                      type_info,
                                      flags);
}

void
mlton_g_type_module_set_name (GTypeModule* module,
                              SML_CVECTOR_VAL(const gchar, name))
{
  g_type_module_set_name (module,
                          GET_SML_CVECTOR_VAL(const gchar, name));
}

void
mlton_g_value_set_static_string (GValue* value,
                                 SML_CVECTOR_VAL(const gchar, v_string))
{
  g_value_set_static_string (value,
                             GET_SML_CVECTOR_VAL(const gchar, v_string));
}

void
mlton_g_value_set_string (GValue* value,
                          SML_CVECTOR_VAL(const gchar, v_string))
{
  g_value_set_string (value,
                      GET_SML_CVECTOR_VAL(const gchar, v_string));
}

void
mlton_g_value_set_string_take_ownership (GValue* value,
                                         SML_CVECTOR_VAL(gchar, v_string))
{
  g_value_set_string_take_ownership (value,
                                     GET_SML_CVECTOR_VAL(gchar, v_string));
}

#if GLIB_CHECK_VERSION(2, 4, 0)
void
mlton_g_value_take_string (GValue* value,
                           SML_CVECTOR_VAL(gchar, v_string))
{
  g_value_take_string (value,
                       GET_SML_CVECTOR_VAL(gchar, v_string));
}
#endif

GEnumValue*
mlton_g_enum_get_value_by_name (GEnumClass* enum_class,
                                SML_CVECTOR_VAL(const gchar, name))
{
  return g_enum_get_value_by_name (enum_class,
                                   GET_SML_CVECTOR_VAL(const gchar, name));
}

GEnumValue*
mlton_g_enum_get_value_by_nick (GEnumClass* enum_class,
                                SML_CVECTOR_VAL(const gchar, nick))
{
  return g_enum_get_value_by_nick (enum_class,
                                   GET_SML_CVECTOR_VAL(const gchar, nick));
}

GType
mlton_g_enum_register_static (SML_CVECTOR_VAL(const gchar, name),
                              const GEnumValue* const_static_values)
{
  return g_enum_register_static (GET_SML_CVECTOR_VAL(const gchar, name),
                                 const_static_values);
}

GFlagsValue*
mlton_g_flags_get_value_by_name (GFlagsClass* flags_class,
                                 SML_CVECTOR_VAL(const gchar, name))
{
  return g_flags_get_value_by_name (flags_class,
                                    GET_SML_CVECTOR_VAL(const gchar, name));
}

GFlagsValue*
mlton_g_flags_get_value_by_nick (GFlagsClass* flags_class,
                                 SML_CVECTOR_VAL(const gchar, nick))
{
  return g_flags_get_value_by_nick (flags_class,
                                    GET_SML_CVECTOR_VAL(const gchar, nick));
}

GType
mlton_g_flags_register_static (SML_CVECTOR_VAL(const gchar, name),
                               const GFlagsValue* const_static_values)
{
  return g_flags_register_static (GET_SML_CVECTOR_VAL(const gchar, name),
                                  const_static_values);
}

GParamSpec*
mlton_g_param_spec_boolean (SML_CVECTOR_VAL(const gchar, name),
                            SML_CVECTOR_VAL(const gchar, nick),
                            SML_CVECTOR_VAL(const gchar, blurb),
                            gboolean default_value,
                            GParamFlags flags)
{
  return g_param_spec_boolean (GET_SML_CVECTOR_VAL(const gchar, name),
                               GET_SML_CVECTOR_VAL(const gchar, nick),
                               GET_SML_CVECTOR_VAL(const gchar, blurb),
                               default_value,
                               flags);
}

GParamSpec*
mlton_g_param_spec_boxed (SML_CVECTOR_VAL(const gchar, name),
                          SML_CVECTOR_VAL(const gchar, nick),
                          SML_CVECTOR_VAL(const gchar, blurb),
                          GType boxed_type,
                          GParamFlags flags)
{
  return g_param_spec_boxed (GET_SML_CVECTOR_VAL(const gchar, name),
                             GET_SML_CVECTOR_VAL(const gchar, nick),
                             GET_SML_CVECTOR_VAL(const gchar, blurb),
                             boxed_type,
                             flags);
}

GParamSpec*
mlton_g_param_spec_char (SML_CVECTOR_VAL(const gchar, name),
                         SML_CVECTOR_VAL(const gchar, nick),
                         SML_CVECTOR_VAL(const gchar, blurb),
                         gint8 minimum,
                         gint8 maximum,
                         gint8 default_value,
                         GParamFlags flags)
{
  return g_param_spec_char (GET_SML_CVECTOR_VAL(const gchar, name),
                            GET_SML_CVECTOR_VAL(const gchar, nick),
                            GET_SML_CVECTOR_VAL(const gchar, blurb),
                            minimum,
                            maximum,
                            default_value,
                            flags);
}

GParamSpec*
mlton_g_param_spec_double (SML_CVECTOR_VAL(const gchar, name),
                           SML_CVECTOR_VAL(const gchar, nick),
                           SML_CVECTOR_VAL(const gchar, blurb),
                           gdouble minimum,
                           gdouble maximum,
                           gdouble default_value,
                           GParamFlags flags)
{
  return g_param_spec_double (GET_SML_CVECTOR_VAL(const gchar, name),
                              GET_SML_CVECTOR_VAL(const gchar, nick),
                              GET_SML_CVECTOR_VAL(const gchar, blurb),
                              minimum,
                              maximum,
                              default_value,
                              flags);
}

GParamSpec*
mlton_g_param_spec_enum (SML_CVECTOR_VAL(const gchar, name),
                         SML_CVECTOR_VAL(const gchar, nick),
                         SML_CVECTOR_VAL(const gchar, blurb),
                         GType enum_type,
                         gint default_value,
                         GParamFlags flags)
{
  return g_param_spec_enum (GET_SML_CVECTOR_VAL(const gchar, name),
                            GET_SML_CVECTOR_VAL(const gchar, nick),
                            GET_SML_CVECTOR_VAL(const gchar, blurb),
                            enum_type,
                            default_value,
                            flags);
}

GParamSpec*
mlton_g_param_spec_flags (SML_CVECTOR_VAL(const gchar, name),
                          SML_CVECTOR_VAL(const gchar, nick),
                          SML_CVECTOR_VAL(const gchar, blurb),
                          GType flags_type,
                          guint default_value,
                          GParamFlags flags)
{
  return g_param_spec_flags (GET_SML_CVECTOR_VAL(const gchar, name),
                             GET_SML_CVECTOR_VAL(const gchar, nick),
                             GET_SML_CVECTOR_VAL(const gchar, blurb),
                             flags_type,
                             default_value,
                             flags);
}

GParamSpec*
mlton_g_param_spec_float (SML_CVECTOR_VAL(const gchar, name),
                          SML_CVECTOR_VAL(const gchar, nick),
                          SML_CVECTOR_VAL(const gchar, blurb),
                          gfloat minimum,
                          gfloat maximum,
                          gfloat default_value,
                          GParamFlags flags)
{
  return g_param_spec_float (GET_SML_CVECTOR_VAL(const gchar, name),
                             GET_SML_CVECTOR_VAL(const gchar, nick),
                             GET_SML_CVECTOR_VAL(const gchar, blurb),
                             minimum,
                             maximum,
                             default_value,
                             flags);
}

#if GLIB_CHECK_VERSION(2, 10, 0)
GParamSpec*
mlton_g_param_spec_gtype (SML_CVECTOR_VAL(const gchar, name),
                          SML_CVECTOR_VAL(const gchar, nick),
                          SML_CVECTOR_VAL(const gchar, blurb),
                          GType is_a_type,
                          GParamFlags flags)
{
  return g_param_spec_gtype (GET_SML_CVECTOR_VAL(const gchar, name),
                             GET_SML_CVECTOR_VAL(const gchar, nick),
                             GET_SML_CVECTOR_VAL(const gchar, blurb),
                             is_a_type,
                             flags);
}
#endif

GParamSpec*
mlton_g_param_spec_int (SML_CVECTOR_VAL(const gchar, name),
                        SML_CVECTOR_VAL(const gchar, nick),
                        SML_CVECTOR_VAL(const gchar, blurb),
                        gint minimum,
                        gint maximum,
                        gint default_value,
                        GParamFlags flags)
{
  return g_param_spec_int (GET_SML_CVECTOR_VAL(const gchar, name),
                           GET_SML_CVECTOR_VAL(const gchar, nick),
                           GET_SML_CVECTOR_VAL(const gchar, blurb),
                           minimum,
                           maximum,
                           default_value,
                           flags);
}

GParamSpec*
mlton_g_param_spec_int64 (SML_CVECTOR_VAL(const gchar, name),
                          SML_CVECTOR_VAL(const gchar, nick),
                          SML_CVECTOR_VAL(const gchar, blurb),
                          gint64 minimum,
                          gint64 maximum,
                          gint64 default_value,
                          GParamFlags flags)
{
  return g_param_spec_int64 (GET_SML_CVECTOR_VAL(const gchar, name),
                             GET_SML_CVECTOR_VAL(const gchar, nick),
                             GET_SML_CVECTOR_VAL(const gchar, blurb),
                             minimum,
                             maximum,
                             default_value,
                             flags);
}

GParamSpec*
mlton_g_param_spec_long (SML_CVECTOR_VAL(const gchar, name),
                         SML_CVECTOR_VAL(const gchar, nick),
                         SML_CVECTOR_VAL(const gchar, blurb),
                         glong minimum,
                         glong maximum,
                         glong default_value,
                         GParamFlags flags)
{
  return g_param_spec_long (GET_SML_CVECTOR_VAL(const gchar, name),
                            GET_SML_CVECTOR_VAL(const gchar, nick),
                            GET_SML_CVECTOR_VAL(const gchar, blurb),
                            minimum,
                            maximum,
                            default_value,
                            flags);
}

GParamSpec*
mlton_g_param_spec_object (SML_CVECTOR_VAL(const gchar, name),
                           SML_CVECTOR_VAL(const gchar, nick),
                           SML_CVECTOR_VAL(const gchar, blurb),
                           GType object_type,
                           GParamFlags flags)
{
  return g_param_spec_object (GET_SML_CVECTOR_VAL(const gchar, name),
                              GET_SML_CVECTOR_VAL(const gchar, nick),
                              GET_SML_CVECTOR_VAL(const gchar, blurb),
                              object_type,
                              flags);
}

GParamSpec*
mlton_g_param_spec_param (SML_CVECTOR_VAL(const gchar, name),
                          SML_CVECTOR_VAL(const gchar, nick),
                          SML_CVECTOR_VAL(const gchar, blurb),
                          GType param_type,
                          GParamFlags flags)
{
  return g_param_spec_param (GET_SML_CVECTOR_VAL(const gchar, name),
                             GET_SML_CVECTOR_VAL(const gchar, nick),
                             GET_SML_CVECTOR_VAL(const gchar, blurb),
                             param_type,
                             flags);
}

GParamSpec*
mlton_g_param_spec_pointer (SML_CVECTOR_VAL(const gchar, name),
                            SML_CVECTOR_VAL(const gchar, nick),
                            SML_CVECTOR_VAL(const gchar, blurb),
                            GParamFlags flags)
{
  return g_param_spec_pointer (GET_SML_CVECTOR_VAL(const gchar, name),
                               GET_SML_CVECTOR_VAL(const gchar, nick),
                               GET_SML_CVECTOR_VAL(const gchar, blurb),
                               flags);
}

GParamSpec*
mlton_g_param_spec_string (SML_CVECTOR_VAL(const gchar, name),
                           SML_CVECTOR_VAL(const gchar, nick),
                           SML_CVECTOR_VAL(const gchar, blurb),
                           SML_CVECTOR_VAL(const gchar, default_value),
                           GParamFlags flags)
{
  return g_param_spec_string (GET_SML_CVECTOR_VAL(const gchar, name),
                              GET_SML_CVECTOR_VAL(const gchar, nick),
                              GET_SML_CVECTOR_VAL(const gchar, blurb),
                              GET_SML_CVECTOR_VAL(const gchar, default_value),
                              flags);
}

GParamSpec*
mlton_g_param_spec_uchar (SML_CVECTOR_VAL(const gchar, name),
                          SML_CVECTOR_VAL(const gchar, nick),
                          SML_CVECTOR_VAL(const gchar, blurb),
                          guint8 minimum,
                          guint8 maximum,
                          guint8 default_value,
                          GParamFlags flags)
{
  return g_param_spec_uchar (GET_SML_CVECTOR_VAL(const gchar, name),
                             GET_SML_CVECTOR_VAL(const gchar, nick),
                             GET_SML_CVECTOR_VAL(const gchar, blurb),
                             minimum,
                             maximum,
                             default_value,
                             flags);
}

GParamSpec*
mlton_g_param_spec_uint (SML_CVECTOR_VAL(const gchar, name),
                         SML_CVECTOR_VAL(const gchar, nick),
                         SML_CVECTOR_VAL(const gchar, blurb),
                         guint minimum,
                         guint maximum,
                         guint default_value,
                         GParamFlags flags)
{
  return g_param_spec_uint (GET_SML_CVECTOR_VAL(const gchar, name),
                            GET_SML_CVECTOR_VAL(const gchar, nick),
                            GET_SML_CVECTOR_VAL(const gchar, blurb),
                            minimum,
                            maximum,
                            default_value,
                            flags);
}

GParamSpec*
mlton_g_param_spec_uint64 (SML_CVECTOR_VAL(const gchar, name),
                           SML_CVECTOR_VAL(const gchar, nick),
                           SML_CVECTOR_VAL(const gchar, blurb),
                           guint64 minimum,
                           guint64 maximum,
                           guint64 default_value,
                           GParamFlags flags)
{
  return g_param_spec_uint64 (GET_SML_CVECTOR_VAL(const gchar, name),
                              GET_SML_CVECTOR_VAL(const gchar, nick),
                              GET_SML_CVECTOR_VAL(const gchar, blurb),
                              minimum,
                              maximum,
                              default_value,
                              flags);
}

GParamSpec*
mlton_g_param_spec_ulong (SML_CVECTOR_VAL(const gchar, name),
                          SML_CVECTOR_VAL(const gchar, nick),
                          SML_CVECTOR_VAL(const gchar, blurb),
                          gulong minimum,
                          gulong maximum,
                          gulong default_value,
                          GParamFlags flags)
{
  return g_param_spec_ulong (GET_SML_CVECTOR_VAL(const gchar, name),
                             GET_SML_CVECTOR_VAL(const gchar, nick),
                             GET_SML_CVECTOR_VAL(const gchar, blurb),
                             minimum,
                             maximum,
                             default_value,
                             flags);
}

GParamSpec*
mlton_g_param_spec_unichar (SML_CVECTOR_VAL(const gchar, name),
                            SML_CVECTOR_VAL(const gchar, nick),
                            SML_CVECTOR_VAL(const gchar, blurb),
                            gunichar default_value,
                            GParamFlags flags)
{
  return g_param_spec_unichar (GET_SML_CVECTOR_VAL(const gchar, name),
                               GET_SML_CVECTOR_VAL(const gchar, nick),
                               GET_SML_CVECTOR_VAL(const gchar, blurb),
                               default_value,
                               flags);
}

#if GLIB_CHECK_VERSION(2, 26, 0)
GParamSpec*
mlton_g_param_spec_variant (SML_CVECTOR_VAL(const gchar, name),
                            SML_CVECTOR_VAL(const gchar, nick),
                            SML_CVECTOR_VAL(const gchar, blurb),
                            const GVariantType* type,
                            GVariant* default_value,
                            GParamFlags flags)
{
  return g_param_spec_variant (GET_SML_CVECTOR_VAL(const gchar, name),
                               GET_SML_CVECTOR_VAL(const gchar, nick),
                               GET_SML_CVECTOR_VAL(const gchar, blurb),
                               type,
                               default_value,
                               flags);
}
#endif

GType
mlton_g_param_type_register_static (SML_CVECTOR_VAL(const gchar, name),
                                    const GParamSpecTypeInfo* pspec_info)
{
  return g_param_type_register_static (GET_SML_CVECTOR_VAL(const gchar, name),
                                       pspec_info);
}

GType
mlton_g_pointer_type_register_static (SML_CVECTOR_VAL(const gchar, name))
{
  return g_pointer_type_register_static (GET_SML_CVECTOR_VAL(const gchar, name));
}

void
mlton_g_signal_chain_from_overridden (SML_CVECTOR_VAL(GValue, instance_and_params),
                                      GValue* return_value)
{
  g_signal_chain_from_overridden (GET_SML_CVECTOR_VAL(GValue, instance_and_params),
                                  return_value);
}

void
mlton_g_signal_emitv (SML_CVECTOR_VAL(GValue, instance_and_params),
                      guint signal_id,
                      GQuark detail,
                      GValue* return_value)
{
  g_signal_emitv (GET_SML_CVECTOR_VAL(GValue, instance_and_params),
                  signal_id,
                  detail,
                  return_value);
}

guint
mlton_g_signal_lookup (SML_CVECTOR_VAL(const gchar, name),
                       GType itype)
{
  return g_signal_lookup (GET_SML_CVECTOR_VAL(const gchar, name),
                          itype);
}

gboolean
mlton_g_signal_parse_name (SML_CVECTOR_VAL(const gchar, detailed_signal),
                           GType itype,
                           guint* signal_id_p,
                           GQuark* detail_p,
                           gboolean force_detail_quark)
{
  return g_signal_parse_name (GET_SML_CVECTOR_VAL(const gchar, detailed_signal),
                              itype,
                              signal_id_p,
                              detail_p,
                              force_detail_quark);
}

void
mlton_g_signal_stop_emission_by_name (gpointer instance,
                                      SML_CVECTOR_VAL(const gchar, detailed_signal))
{
  g_signal_stop_emission_by_name (instance,
                                  GET_SML_CVECTOR_VAL(const gchar, detailed_signal));
}

GType
mlton_g_type_from_name (SML_CVECTOR_VAL(const gchar, name))
{
  return g_type_from_name (GET_SML_CVECTOR_VAL(const gchar, name));
}

GType
mlton_g_type_register_dynamic (GType parent_type,
                               SML_CVECTOR_VAL(const gchar, type_name),
                               GTypePlugin* plugin,
                               GTypeFlags flags)
{
  return g_type_register_dynamic (parent_type,
                                  GET_SML_CVECTOR_VAL(const gchar, type_name),
                                  plugin,
                                  flags);
}

GType
mlton_g_type_register_fundamental (GType type_id,
                                   SML_CVECTOR_VAL(const gchar, type_name),
                                   const GTypeInfo* info,
                                   const GTypeFundamentalInfo* finfo,
                                   GTypeFlags flags)
{
  return g_type_register_fundamental (type_id,
                                      GET_SML_CVECTOR_VAL(const gchar, type_name),
                                      info,
                                      finfo,
                                      flags);
}

GType
mlton_g_type_register_static (GType parent_type,
                              SML_CVECTOR_VAL(const gchar, type_name),
                              const GTypeInfo* info,
                              GTypeFlags flags)
{
  return g_type_register_static (parent_type,
                                 GET_SML_CVECTOR_VAL(const gchar, type_name),
                                 info,
                                 flags);
}
