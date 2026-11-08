--
--  Copyright (C) 2026, Vadim Godunko
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

with System;

package ESPIDF.Driver.GPIO is

   type gpio_num_t is new int;

   type gpio_mode_t is
     (GPIO_MODE_DISABLE,
      GPIO_MODE_INPUT,
      GPIO_MODE_OUTPUT,
      GPIO_MODE_INPUT_OUTPUT,
      GPIO_MODE_OUTPUT_OD,
      GPIO_MODE_INPUT_OUTPUT_OD)
   with Convention => C;
   for gpio_mode_t use
     (GPIO_MODE_DISABLE         => 2#000#,
      GPIO_MODE_INPUT           => 2#001#,
      GPIO_MODE_OUTPUT          => 2#010#,
      GPIO_MODE_INPUT_OUTPUT    => 2#011#,
      GPIO_MODE_OUTPUT_OD       => 2#110#,
      GPIO_MODE_INPUT_OUTPUT_OD => 2#111#);

   type gpio_pullup_t is (GPIO_PULLUP_DISABLE, GPIO_PULLUP_ENABLE)
   with Convention => C;
   for gpio_pullup_t use (GPIO_PULLUP_DISABLE => 0, GPIO_PULLUP_ENABLE => 1);

   type gpio_pulldown_t is (GPIO_PULLDOWN_DISABLE, GPIO_PULLDOWN_ENABLE)
   with Convention => C;
   for gpio_pulldown_t use
     (GPIO_PULLDOWN_DISABLE => 0, GPIO_PULLDOWN_ENABLE => 1);

   type gpio_int_type_t is
     (GPIO_INTR_DISABLE,
      GPIO_INTR_POSEDGE,
      GPIO_INTR_NEGEDGE,
      GPIO_INTR_ANYEDGE,
      GPIO_INTR_LOW_LEVEL,
      GPIO_INTR_HIGH_LEVEL)
   with Convention => C;
   for gpio_int_type_t use
     (GPIO_INTR_DISABLE    => 0,
      GPIO_INTR_POSEDGE    => 1,
      GPIO_INTR_NEGEDGE    => 2,
      GPIO_INTR_ANYEDGE    => 3,
      GPIO_INTR_LOW_LEVEL  => 4,
      GPIO_INTR_HIGH_LEVEL => 5);

   type gpio_isr_t is access procedure (Arg : System.Address) with Convention => C;

   type gpio_config_t is limited private;

   procedure Set_intr_type
     (Self : in out gpio_config_t; Intr_Type : gpio_int_type_t)
   with
     Import,
     Convention    => C,
     External_Name => "__ada_SET_gpio_config_t_intr_type";

   procedure Set_mode (Self : in out gpio_config_t; Mode : gpio_mode_t)
   with
     Import,
     Convention    => C,
     External_Name => "__ada_SET_gpio_config_t_mode";

   procedure Set_pin_bit_mask
     (Self : in out gpio_config_t; Pin_Bit_Mask : uint64_t)
   with
     Import,
     Convention    => C,
     External_Name => "__ada_SET_gpio_config_t_pin_bit_mask";

   procedure Set_pull_down_en
     (Self : in out gpio_config_t; Pull_Down_En : gpio_pulldown_t)
   with
     Import,
     Convention    => C,
     External_Name => "__ada_SET_gpio_config_t_pull_down_en";

   procedure Set_pull_up_en
     (Self : in out gpio_config_t; Pull_Up_En : gpio_pullup_t)
   with
     Import,
     Convention    => C,
     External_Name => "__ada_SET_gpio_config_t_pull_up_en";

   --------------
   -- GPIO API --
   --------------

   function gpio_config (pGPIOConfig : in gpio_config_t) return esp_err_t
   with Import, Convention => C, External_Name => "gpio_config";

   procedure gpio_config (pGPIOConfig : in gpio_config_t);

   function gpio_set_level
     (gpio_num : gpio_num_t; level : uint32_t) return esp_err_t
   with Import, Convention => C, External_Name => "gpio_set_level";

   procedure gpio_set_level (gpio_num : gpio_num_t; level : uint32_t);

   function gpio_install_isr_service (intr_alloc_flags : int) return esp_err_t
   with Import, Convention => C, External_Name => "gpio_install_isr_service";

   procedure gpio_install_isr_service (intr_alloc_flags : int);

   function gpio_isr_handler_add
     (gpio_num : gpio_num_t; isr_handler : gpio_isr_t; args : System.Address) return esp_err_t
   with Import, Convention => C, External_Name => "gpio_isr_handler_add";

   procedure gpio_isr_handler_add
     (gpio_num : gpio_num_t; isr_handler : gpio_isr_t; args : System.Address);

private

   sizeof_gpio_config_t : constant int
     with Import, Convention => C,
          External_Name => "__ada_SIZEOF_gpio_config_t";

   type gpio_config_t is new C_Object_Storage (1 .. sizeof_gpio_config_t)
     with Convention              => C,
          Default_Component_Value => 0;

end ESPIDF.Driver.GPIO;
