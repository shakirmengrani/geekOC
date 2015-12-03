<?php

class ControllerModuleTtlasttweeter extends Controller {
	private $error = array();
    public function install() {
        $this->load->model('setting/setting');
        $data = array('ttlasttweeter_name'=>'plazathemes',
             'ttlasttweeter_id'   => '538235661812113408',
             'ttlasttweeter_status'   => 1,
             'ttlasttweeter_width'   => 200,
             'ttlasttweeter_height'   => 100,
        );
        $this->model_setting_setting->editSetting('ttlasttweeter',$data,0);
    }

	public function index() {
        $this->load->language('module/ttlasttweeter');
        $this->document->setTitle($this->language->get('heading_title'));
        $this->load->model('setting/setting');
        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('ttlasttweeter', $this->request->post);
            $this->session->data['success'] = $this->language->get('text_success');
            $this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
        }
		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_ttlasttweeter_width'] = $this->language->get('text_ttlasttweeter_width');
		$data['text_ttlasttweeter_height'] = $this->language->get('text_ttlasttweeter_height');
		$data['text_ttlasttweeter_page'] = $this->language->get('text_ttlasttweeter_page');
		$data['text_ttlasttweeter_id'] = $this->language->get('text_ttlasttweeter_id');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_content_top'] = $this->language->get('text_content_top');
		$data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$data['text_column_left'] = $this->language->get('text_column_left');
		$data['text_column_right'] = $this->language->get('text_column_right');
		$data['entry_layout'] = $this->language->get('entry_layout');
		$data['entry_position'] = $this->language->get('entry_position');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_add_module'] = $this->language->get('button_add_module');
		$data['button_remove'] = $this->language->get('button_remove');
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		$data['breadcrumbs'] = array();
		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);
		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);
		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/ttlasttweeter', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);
		$data['action'] = $this->url->link('module/ttlasttweeter', 'token=' . $this->session->data['token'], 'SSL');
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		$data['modules'] = array();
		
		if (isset($this->request->post['ttlasttweeter_status'])) {
			$data['ttlasttweeter_status'] = $this->request->post['ttlasttweeter_status'];
		} elseif ($this->config->get('ttlasttweeter_status')) {
			$data['ttlasttweeter_status'] = $this->config->get('ttlasttweeter_status');
		}


		if (isset($this->request->post['ttlasttweeter_id'])) {
			$data['ttlasttweeter_id'] = $this->request->post['ttlasttweeter_id'];
		} elseif ($this->config->get('ttlasttweeter_id')) {
			$data['ttlasttweeter_id'] = $this->config->get('ttlasttweeter_id');
		}
		if (isset($this->request->post['ttlasttweeter_name'])) {
			$data['ttlasttweeter_name'] = $this->request->post['ttlasttweeter_name'];
		} elseif ($this->config->get('ttlasttweeter_name')) {
			$data['ttlasttweeter_name'] = $this->config->get('ttlasttweeter_name');
		}
		if (isset($this->request->post['ttlasttweeter_width'])) {
			$data['ttlasttweeter_name'] = $this->request->post['ttlasttweeter_width'];
		} elseif ($this->config->get('ttlasttweeter_width')) {
			$data['ttlasttweeter_width'] = $this->config->get('ttlasttweeter_width');
		}
		if (isset($this->request->post['ttlasttweeter_height'])) {
			$data['ttlasttweeter_height'] = $this->request->post['ttlasttweeter_height'];
		} elseif ($this->config->get('ttlasttweeter_height')) {
			$data['ttlasttweeter_height'] = $this->config->get('ttlasttweeter_height');
		}
		$this->load->model('design/layout');
		$data['layouts'] = $this->model_design_layout->getLayouts();
        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');
        $this->response->setOutput($this->load->view('module/ttlasttweeter.tpl', $data));
	}

	public  function validate() {
		if (!$this->user->hasPermission('modify', 'module/ttlasttweeter')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}

?>