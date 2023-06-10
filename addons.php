<?php

// Get the product IDs
$milk_product_id = 123;
$chocolate_product_id = 456;
$pearl_product_id = 789;

// Get the addons
$addons = [
  [
    'name' => 'Sugar',
    'price' => 0.50,
  ],
  [
    'name' => 'Cream',
    'price' => 0.25,
  ],
  [
    'name' => 'Whipped cream',
    'price' => 1.00,
  ],
];

// Add the addons to the products
foreach ($addons as $addon) {
  wc_add_product_meta($milk_product_id, '_product_addons', $addon);
  wc_add_product_meta($chocolate_product_id, '_product_addons', $addon);
  wc_add_product_meta($pearl_product_id, '_product_addons', $addon);
}

// Flush the product cache
wp_cache_flush();

?>