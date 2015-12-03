<?php
class ControllerModuleOctabproductslider extends Controller {
	public function index($setting) {
		$this->load->language('module/octabproductslider');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');
		$data['text_special_product'] = $this->language->get('sale products');
		$data['text_latest_product'] = $this->language->get('text_latest_products');
		$data['text_new_product'] = $this->language->get('text_new_product');
		$data['text_bestseller_product'] = $this->language->get('bestseller products');
		$data['text_random_product'] = $this->language->get('random products');
		$data['text_special_product2'] = $this->language->get('text_special_product2');
		$data['text_latest_product2'] = $this->language->get('text_latest_product2');
		$data['text_new_product2'] = $this->language->get('text_new_product2');
		$data['text_bestseller_product2'] = $this->language->get('text_bestseller_product2');
		$data['text_random_product2'] = $this->language->get('text_random_product2');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');
		if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/opentheme/producttab.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/opentheme/producttab.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/opentheme/producttab.css');
		}
		
		
		/* Latest Products */
		// $data['products'] = array();
		
		// $filter_data = array(
			// 'sort'  => 'p.date_added',
			// 'order' => 'DESC',
			// 'start' => 0,
			// 'limit' => $setting['limit'],
		// );
		
		// $results = $this->model_catalog_product->getProducts($filter_data);
		// $product_latest = array();
		// if ($results) {
			// foreach ($results as $result) {
				// if ($result['image']) {
					// $image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
				// } else {
					// $image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
				// }
		
				// if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					// $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
				// } else {
					// $price = false;
				// }
		
				// if ((float)$result['special']) {
					// $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				// } else {
					// $special = false;
				// }
		
				// if ($this->config->get('config_tax')) {
					// $tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
				// } else {
					// $tax = false;
				// }
		
				// if ($this->config->get('config_review_status')) {
					// $rating = $result['rating'];
				// } else {
					// $rating = false;
				// }
				// /// Product Rotator /
                // $product_rotator_status = (int) $this->config->get('ocproductrotator_status');
                // if($product_rotator_status == 1) {
                 // $this->load->model('catalog/ocproductrotator');
                 // $this->load->model('tool/image');
             
                 // $product_id = $result['product_id'];
                 // $product_rotator_image = $this->model_catalog_ocproductrotator->getProductRotatorImage($product_id);
             
                 // if($product_rotator_image) {
                  // $rotator_image_width = (int) $this->config->get('ocproductrotator_width');
                  // $rotator_image_height = (int) $this->config->get('ocproductrotator_height');
				  // $rotator_image = $this->model_tool_image->resize($product_rotator_image, $rotator_image_width,$rotator_image_height); 
                 // } else {
                  // $rotator_image = false;
                 // } 
                // } else {
                 // $rotator_image = false;    
                // }
                // /// End Product Rotator /
				// $reviews = sprintf($this->language->get('text_reviews'), (int)$result['reviews']);
				// $product_latest[]  = array(
					// 'product_id'  => $result['product_id'],
					// 'rotator_image' => $rotator_image,
					// 'thumb'       => $image,
					// 'name'        => $result['name'],
					// 'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
					// 'price'       => $price,
					// 'special'     => $special,
					// 'tax'         => $tax,
					// 'rating'      => $rating,
					// 'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
					// 'reviews' => $reviews
				// );
			// }
			
		// }	
		
		
		
		/* Special Products */
		$data['products'] = array();
		
		$filter_data = array(
			'sort'  => 'pd.name',
			'order' => 'ASC',
			'start' => 0,
			'limit' => $setting['limit'],
		);
		
		$results = $this->model_catalog_product->getProductSpecials($filter_data);
		$product_sale = array();
		if ($results) {
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
				}
		
				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}
		
				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}
		
				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
				} else {
					$tax = false;
				}
		
				if ($this->config->get('config_review_status')) {
					$rating = $result['rating'];
				} else {
					$rating = false;
				}
				/// Product Rotator /
                $product_rotator_status = (int) $this->config->get('ocproductrotator_status');
                if($product_rotator_status == 1) {
                 $this->load->model('catalog/ocproductrotator');
                 $this->load->model('tool/image');
             
                 $product_id = $result['product_id'];
                 $product_rotator_image = $this->model_catalog_ocproductrotator->getProductRotatorImage($product_id);
             
                 if($product_rotator_image) {
                  $rotator_image_width = (int) $this->config->get('ocproductrotator_width');
                  $rotator_image_height = (int) $this->config->get('ocproductrotator_height');
				  $rotator_image = $this->model_tool_image->resize($product_rotator_image, $rotator_image_width,$rotator_image_height); 
                 } else {
                  $rotator_image = false;
                 } 
                } else {
                 $rotator_image = false;    
                }
                /// End Product Rotator /
				$reviews = sprintf($this->language->get('text_reviews'), (int)$result['reviews']);
		
				$product_sale[] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'rotator_image' => $rotator_image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
					'reviews' => $reviews
				);
			}
			
			}
		
		/* Bestseller Product */	
		$data['products'] = array();

		$results = $this->model_catalog_product->getBestSellerProducts($setting['limit']);
		$product_bestseller = array(); 
		if ($results) {
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = $result['rating'];
				} else {
					$rating = false;
				}
				/// Product Rotator /
                $product_rotator_status = (int) $this->config->get('ocproductrotator_status');
                if($product_rotator_status == 1) {
                 $this->load->model('catalog/ocproductrotator');
                 $this->load->model('tool/image');
             
                 $product_id = $result['product_id'];
                 $product_rotator_image = $this->model_catalog_ocproductrotator->getProductRotatorImage($product_id);
             
                 if($product_rotator_image) {
                  $rotator_image_width = (int) $this->config->get('ocproductrotator_width');
                  $rotator_image_height = (int) $this->config->get('ocproductrotator_height');
				  $rotator_image = $this->model_tool_image->resize($product_rotator_image, $rotator_image_width,$rotator_image_height); 
                 } else {
                  $rotator_image = false;
                 } 
                } else {
                 $rotator_image = false;    
                }
                /// End Product Rotator /
				$reviews = sprintf($this->language->get('text_reviews'), (int)$result['reviews']);

				$product_bestseller[] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'rotator_image' => $rotator_image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
					'reviews' => $reviews
				);
			}

		}
		
		/* Random Products */
		$data['products'] = array();
		
		$this->load->model('module/randomproduct');
		$results = $this->model_module_randomproduct->getRandomProducts($setting['limit']);
		$product_random = array(); 
		if ($results) {
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = $result['rating'];
				} else {
					$rating = false;
				}
				/// Product Rotator /
                $product_rotator_status = (int) $this->config->get('ocproductrotator_status');
                if($product_rotator_status == 1) {
                 $this->load->model('catalog/ocproductrotator');
                 $this->load->model('tool/image');
             
                 $product_id = $result['product_id'];
                 $product_rotator_image = $this->model_catalog_ocproductrotator->getProductRotatorImage($product_id);
             
                 if($product_rotator_image) {
                  $rotator_image_width = (int) $this->config->get('ocproductrotator_width');
                  $rotator_image_height = (int) $this->config->get('ocproductrotator_height');
				  $rotator_image = $this->model_tool_image->resize($product_rotator_image, $rotator_image_width,$rotator_image_height); 
                 } else {
                  $rotator_image = false;
                 } 
                } else {
                 $rotator_image = false;    
                }
                /// End Product Rotator /
				$reviews = sprintf($this->language->get('text_reviews'), (int)$result['reviews']);
				$product_random[] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'rotator_image' => $rotator_image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
					'reviews' => $reviews
				);
			}

		}
		
			$productTabslider = array();
			$productTabslider[] = array(
					'id'=>'latest_product', 
					'name' => $data['text_random_product'],
					'name2' => $data['text_random_product2'],
					'productInfo' => $product_random
				);
			$productTabslider[] = array(
				'id'=>'bestseller_product', 
				'name' => $data['text_bestseller_product'],
				'name2' => $data['text_bestseller_product2'], 
				'productInfo' => $product_bestseller
			);
			$productTabslider[] = array(
				'id'=>'sale_products', 
				'name' => $data['text_special_product'],
				'name2' => $data['text_special_product2'], 
				'productInfo' => $product_sale
			);
			$data['config_slide'] = array(
					'items' => $setting['item'],
					'f_speed_slide' => $setting['autoplay'],
					'f_show_nextback' => $setting['shownextback'], 
					'f_show_ctr' => $setting['shownav'], 
					'f_ani_speed' => $setting['speed'],
					'f_show_price' => $setting['showprice'],
					'f_show_des' => $setting['showdes'],
					'f_show_addtocart' => $setting['showaddtocart'],
					'f_rows' => $setting['rows']
				);
			
			$data['productTabslider'] = $productTabslider; 
			if ($data['productTabslider']) {
				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/octabproductslider.tpl')) {
					return $this->load->view($this->config->get('config_template') . '/template/module/octabproductslider.tpl', $data);
				} else {
					return $this->load->view('default/template/module/octabproductslider.tpl', $data);
				}
			}
		}
		
	
}