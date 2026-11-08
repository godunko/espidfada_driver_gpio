--
--  Copyright (C) 2026, Vadim Godunko
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

with ESPIDF.Ada_ESP_Check_Error;

package body ESPIDF.Driver.GPIO is

   -----------------
   -- gpio_config --
   -----------------

   procedure gpio_config (pGPIOConfig : in gpio_config_t) is
   begin
      ESPIDF.Ada_ESP_Check_Error (gpio_config (pGPIOConfig));
   end gpio_config;

   ------------------------------
   -- gpio_install_isr_service --
   ------------------------------

   procedure gpio_install_isr_service (intr_alloc_flags : int) is
   begin
      ESPIDF.Ada_ESP_Check_Error (gpio_install_isr_service (intr_alloc_flags));
   end gpio_install_isr_service;

   --------------------
   -- gpio_set_level --
   --------------------

   procedure gpio_set_level (gpio_num : gpio_num_t; level : uint32_t) is
   begin
      ESPIDF.Ada_ESP_Check_Error (gpio_set_level (gpio_num, level));
   end gpio_set_level;

end ESPIDF.Driver.GPIO;