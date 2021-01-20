#include "cvector.h"
#include "cvectorvector.h"

gboolean
mlton_atk_action_set_description (AtkAction* action,
                                  gint i,
                                  SML_CVECTOR_VAL(const gchar, desc))
{
  return atk_action_set_description (action,
                                     i,
                                     GET_SML_CVECTOR_VAL(const gchar, desc));
}

#if ATK_CHECK_VERSION(1, 12, 0)
const gchar*
mlton_atk_document_get_attribute_value (AtkDocument* document,
                                        SML_CVECTOR_VAL(const gchar, attribute_name))
{
  return atk_document_get_attribute_value (document,
                                           GET_SML_CVECTOR_VAL(const gchar, attribute_name));
}
#endif

#if ATK_CHECK_VERSION(1, 12, 0)
gboolean
mlton_atk_document_set_attribute_value (AtkDocument* document,
                                        SML_CVECTOR_VAL(const gchar, attribute_name),
                                        SML_CVECTOR_VAL(const gchar, attribute_value))
{
  return atk_document_set_attribute_value (document,
                                           GET_SML_CVECTOR_VAL(const gchar, attribute_name),
                                           GET_SML_CVECTOR_VAL(const gchar, attribute_value));
}
#endif

void
mlton_atk_editable_text_insert_text (AtkEditableText* text,
                                     SML_CVECTOR_VAL(const gchar, string),
                                     gint length,
                                     gint* position)
{
  atk_editable_text_insert_text (text,
                                 GET_SML_CVECTOR_VAL(const gchar, string),
                                 length,
                                 position);
}

void
mlton_atk_editable_text_set_text_contents (AtkEditableText* text,
                                           SML_CVECTOR_VAL(const gchar, string))
{
  atk_editable_text_set_text_contents (text,
                                       GET_SML_CVECTOR_VAL(const gchar, string));
}

gboolean
mlton_atk_image_set_image_description (AtkImage* image,
                                       SML_CVECTOR_VAL(const gchar, description))
{
  return atk_image_set_image_description (image,
                                          GET_SML_CVECTOR_VAL(const gchar, description));
}

#if ATK_CHECK_VERSION(2, 34, 0)
void
mlton_atk_object_set_accessible_id (AtkObject* accessible,
                                    SML_CVECTOR_VAL(const gchar, name))
{
  atk_object_set_accessible_id (accessible,
                                GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

void
mlton_atk_object_set_description (AtkObject* accessible,
                                  SML_CVECTOR_VAL(const gchar, description))
{
  atk_object_set_description (accessible,
                              GET_SML_CVECTOR_VAL(const gchar, description));
}

void
mlton_atk_object_set_name (AtkObject* accessible,
                           SML_CVECTOR_VAL(const gchar, name))
{
  atk_object_set_name (accessible,
                       GET_SML_CVECTOR_VAL(const gchar, name));
}

#if ATK_CHECK_VERSION(2, 12, 0)
AtkRange*
mlton_atk_range_new (gdouble lower_limit,
                     gdouble upper_limit,
                     SML_CVECTOR_VAL(const gchar, description))
{
  return atk_range_new (lower_limit,
                        upper_limit,
                        GET_SML_CVECTOR_VAL(const gchar, description));
}
#endif

AtkRelation*
mlton_atk_relation_new (SML_CVECTOR_VAL(AtkObject*, targets),
                        gint n_targets,
                        AtkRelationType relationship)
{
  return atk_relation_new (GET_SML_CVECTOR_VAL(AtkObject*, targets),
                           n_targets,
                           relationship);
}

AtkRelationType
mlton_atk_relation_type_for_name (SML_CVECTOR_VAL(const gchar, name))
{
  return atk_relation_type_for_name (GET_SML_CVECTOR_VAL(const gchar, name));
}

AtkRelationType
mlton_atk_relation_type_register (SML_CVECTOR_VAL(const gchar, name))
{
  return atk_relation_type_register (GET_SML_CVECTOR_VAL(const gchar, name));
}

AtkRole
mlton_atk_role_for_name (SML_CVECTOR_VAL(const gchar, name))
{
  return atk_role_for_name (GET_SML_CVECTOR_VAL(const gchar, name));
}

AtkRole
mlton_atk_role_register (SML_CVECTOR_VAL(const gchar, name))
{
  return atk_role_register (GET_SML_CVECTOR_VAL(const gchar, name));
}

#if ATK_CHECK_VERSION(1, 30, 0)
void
mlton_atk_socket_embed (AtkSocket* obj,
                        SML_CVECTOR_VAL(gchar, plug_id))
{
  atk_socket_embed (obj,
                    GET_SML_CVECTOR_VAL(gchar, plug_id));
}
#endif

void
mlton_atk_state_set_add_states (AtkStateSet* set,
                                SML_CVECTOR_VAL(AtkStateType, types),
                                gint n_types)
{
  atk_state_set_add_states (set,
                            GET_SML_CVECTOR_VAL(AtkStateType, types),
                            n_types);
}

gboolean
mlton_atk_state_set_contains_states (AtkStateSet* set,
                                     SML_CVECTOR_VAL(AtkStateType, types),
                                     gint n_types)
{
  return atk_state_set_contains_states (set,
                                        GET_SML_CVECTOR_VAL(AtkStateType, types),
                                        n_types);
}

AtkStateType
mlton_atk_state_type_for_name (SML_CVECTOR_VAL(const gchar, name))
{
  return atk_state_type_for_name (GET_SML_CVECTOR_VAL(const gchar, name));
}

AtkStateType
mlton_atk_state_type_register (SML_CVECTOR_VAL(const gchar, name))
{
  return atk_state_type_register (GET_SML_CVECTOR_VAL(const gchar, name));
}

GIOChannel*
mlton_atk_streamable_content_get_stream (AtkStreamableContent* streamable,
                                         SML_CVECTOR_VAL(const gchar, mime_type))
{
  return atk_streamable_content_get_stream (streamable,
                                            GET_SML_CVECTOR_VAL(const gchar, mime_type));
}

#if ATK_CHECK_VERSION(1, 12, 0)
const gchar*
mlton_atk_streamable_content_get_uri (AtkStreamableContent* streamable,
                                      SML_CVECTOR_VAL(const gchar, mime_type))
{
  return atk_streamable_content_get_uri (streamable,
                                         GET_SML_CVECTOR_VAL(const gchar, mime_type));
}
#endif

void
mlton_atk_table_set_column_description (AtkTable* table,
                                        gint column,
                                        SML_CVECTOR_VAL(const gchar, description))
{
  atk_table_set_column_description (table,
                                    column,
                                    GET_SML_CVECTOR_VAL(const gchar, description));
}

void
mlton_atk_table_set_row_description (AtkTable* table,
                                     gint row,
                                     SML_CVECTOR_VAL(const gchar, description))
{
  atk_table_set_row_description (table,
                                 row,
                                 GET_SML_CVECTOR_VAL(const gchar, description));
}

#if ATK_CHECK_VERSION(1, 3, 0)
void
mlton_atk_text_free_ranges (SML_CVECTOR_VAL(AtkTextRange*, ranges))
{
  atk_text_free_ranges (GET_SML_CVECTOR_VAL(AtkTextRange*, ranges));
}
#endif

AtkTextAttribute
mlton_atk_text_attribute_for_name (SML_CVECTOR_VAL(const gchar, name))
{
  return atk_text_attribute_for_name (GET_SML_CVECTOR_VAL(const gchar, name));
}

AtkTextAttribute
mlton_atk_text_attribute_register (SML_CVECTOR_VAL(const gchar, name))
{
  return atk_text_attribute_register (GET_SML_CVECTOR_VAL(const gchar, name));
}

#if ATK_CHECK_VERSION(2, 12, 0)
void
mlton_atk_value_get_value_and_text (AtkValue* obj,
                                    gdouble* value,
                                    SML_CVECTOR_REF(gchar, text))
{
  atk_value_get_value_and_text (obj,
                                value,
                                GET_SML_CVECTOR_REF(gchar, text));
}
#endif
