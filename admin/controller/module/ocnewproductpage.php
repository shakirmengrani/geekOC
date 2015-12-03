<?php
class ControllerModuleOcnewproductpage extends Controller
{
    private $error = array();

    public function install() {
        $config = array(
            'ocnewproductpage_status'   => 1,
            'ocnewproductpage_limit'    => '20',
            'ocnewproductpage_width'    => '200',
            'ocnewproductpage_height'   => '200'
        );
        $this->load->model('setting/setting');
        $this->model_setting_setting->editSetting('ocnewproductpage', $config);
    }

    public function index() {
        $this->load->language('module/ocnewproductpage');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/setting');

        $this->load->model('extension/module');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $post_data = $this->request->post;

            // Parse all the coming data to Setting Model to save it in database.
            $this->model_setting_setting->editSetting('ocnewproductpage', $post_data);

            // To display the success text on data save
            $this->session->data['success'] = $this->language->get('text_success');

            // Redirect to the Module Listing
            $this->response->redirect($this->url->link('module/ocnewproductpage', 'token=' . $this->session->data['token'], 'SSL'));
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');

        $data['entry_limit'] = $this->language->get('entry_limit');
        $data['entry_width'] = $this->language->get('entry_width');
        $data['entry_height'] = $this->language->get('entry_height');
        $data['entry_status'] = $this->language->get('entry_status');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->error['name'])) {
            $data['error_name'] = $this->error['name'];
        } else {
            $data['error_name'] = '';
        }

        if (isset($this->error['width'])) {
            $data['error_width'] = $this->error['width'];
        } else {
            $data['error_width'] = '';
        }

        if (isset($this->error['height'])) {
            $data['error_height'] = $this->error['height'];
        } else {
            $data['error_height'] = '';
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
        );


        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('module/ocnewproductpage', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['action'] = $this->url->link('module/ocnewproductpage', 'token=' . $this->session->data['token'], 'SSL');

        $data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

        if (isset($this->request->post['ocnewproductpage_limit'])) {
            $data['ocnewproductpage_limit'] = $this->request->post['ocnewproductpage_limit'];
        } else {
            $data['ocnewproductpage_limit'] = $this->config->get('ocnewproductpage_limit');
        }

        if (isset($this->request->post['ocnewproductpage_width'])) {
            $data['ocnewproductpage_width'] = $this->request->post['ocnewproductpage_width'];
        } else {
            $data['ocnewproductpage_width'] = $this->config->get('ocnewproductpage_width');
        }

        if (isset($this->request->post['ocnewproductpage_height'])) {
            $data['ocnewproductpage_height'] = $this->request->post['ocnewproductpage_height'];
        } else {
            $data['ocnewproductpage_height'] = $this->config->get('ocnewproductpage_height');
        }

        if (isset($this->request->post['ocnewproductpage_status'])) {
            $data['ocnewproductpage_status'] = $this->request->post['ocnewproductpage_status'];
        } else {
            $data['ocnewproductpage_status'] = $this->config->get('ocnewproductpage_status');
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('module/ocnewproductpage.tpl', $data));
    }

    protected function validate() {
        if (!$this->user->hasPermission('modify', 'module/ocnewproductpage')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->request->post['ocnewproductpage_width']) {
            $this->error['width'] = $this->language->get('error_width');
        }

        if (!$this->request->post['ocnewproductpage_height']) {
            $this->error['height'] = $this->language->get('error_height');
        }

        return !$this->error;
    }
}