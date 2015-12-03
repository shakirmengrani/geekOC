<?php  

class ControllerModuleTtlasttweeter extends Controller {
	public  function index($setting) {
		$this->language->load('module/facebook_like_lite');
		$data['heading_title'] = $this->language->get('heading_title');
		$data['ttfacebook_page'] = $this->config->get('ttlasttweeter');
		$data['ttlasttweeter_width'] = $this->config->get('ttlasttweeter_width');

		$data['ttlasttweeter_height'] = $this->config->get('ttlasttweeter_height');
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/ttlasttweeter.tpl')) {
            return $this->load->view($this->config->get('config_template').'/template/module/ttlasttweeter.tpl', $data);
        } else {
            return $this->load->view('default/template/module/ttlasttweeter.tpl',$data);
        }
	}
}

?>