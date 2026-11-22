idf_component_register(SRCS source/espidfada_driver_gpio.c
    PRIV_REQUIRES esp_driver_gpio espidfada)

idf_component_get_property(espidfada_dir espidfada COMPONENT_DIR)
include("${espidfada_dir}/cmake/constants.cmake")
espidfada_generate_constants(NAME GPIO SOURCE "tools/gpio_constants.c")
