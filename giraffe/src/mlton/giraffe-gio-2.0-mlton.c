/* Copyright (C) 2016-2018 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 */

/*
 * Gio C interface support for MLton
 */

#include "cvector.h"
#include "cvectorvector.h"


/* GioApplication */

int
mlton_g_application_run (GApplication *application,
                         int argc,
                         SML_CVECTORVECTOR_VAL(char, argv))
{
  return g_application_run (application,
                            argc,
                            GET_SML_CVECTORVECTOR_VAL(char, argv));
}


/* GMenuItem */

GMenuItem *
mlton_g_menu_item_new (SML_CVECTOR_VAL(gchar, label),
                       SML_CVECTOR_VAL(gchar, detailed_action))
{
  return g_menu_item_new (GET_SML_CVECTOR_VAL(gchar, label),
                          GET_SML_CVECTOR_VAL(gchar, detailed_action));
}

GMenuItem *
mlton_g_menu_item_new_section (SML_CVECTOR_VAL(gchar, label),
                               GMenuModel *section)
{
  return g_menu_item_new_section (GET_SML_CVECTOR_VAL(gchar, label),
                                  section);
}

GMenuItem *
mlton_g_menu_item_new_submenu (SML_CVECTOR_VAL(gchar, label),
                               GMenuModel *submenu)
{
  return g_menu_item_new_submenu (GET_SML_CVECTOR_VAL(gchar, label),
                                  submenu);
}


/* GSimpleAction */

GSimpleAction *
mlton_g_simple_action_new (SML_CVECTOR_VAL(gchar, name),
                           const GVariantType *parameter_type)
{
  return g_simple_action_new (GET_SML_CVECTOR_VAL(gchar, name),
                              parameter_type);
}
