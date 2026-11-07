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

end ESPIDF.Driver.GPIO;