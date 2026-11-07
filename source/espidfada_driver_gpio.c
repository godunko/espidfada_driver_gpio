//
//  Copyright (C) 2026, Vadim Godunko
//
//  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//

#include <driver/gpio.h>

const int __ada_SIZEOF_gpio_config_t = sizeof(gpio_config_t);

void __ada_SET_gpio_config_t_intr_type(gpio_config_t *self, gpio_int_type_t intr_type)
{
    self->intr_type = intr_type;
}

void __ada_SET_gpio_config_t_mode(gpio_config_t *self, gpio_mode_t mode)
{
    self->mode = mode;
}

void __ada_SET_gpio_config_t_pin_bit_mask(gpio_config_t *self, uint64_t pin_bit_mask)
{
    self->pin_bit_mask = pin_bit_mask;
}

void __ada_SET_gpio_config_t_pull_down_en(gpio_config_t *self, gpio_pulldown_t pull_down_en)
{
    self->pull_down_en = pull_down_en;
}

void __ada_SET_gpio_config_t_pull_up_en(gpio_config_t *self, gpio_pullup_t pull_up_en)
{
    self->pull_up_en = pull_up_en;
}