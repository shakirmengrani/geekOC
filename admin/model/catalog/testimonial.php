<?php
class ModelCatalogTestimonial extends Model {
    public function install(){
        $sql =  array();
        $res = $this->db->query("
            CREATE TABLE IF NOT EXISTS `".DB_PREFIX."testimonial` (
            `testimonial_id` int(11) NOT NULL AUTO_INCREMENT,
            `status` int(1) NOT NULL default 0,
            `sort_order` int(11) NOT NULL default 0,
            PRIMARY KEY (`testimonial_id`)
            )DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;");
        $res &= $this->db->query(
            "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."testimonial_description`(
                `testimonial_id` int(10) unsigned NOT NULL,
                `language_id` int(10) unsigned NOT NULL,
                `image` varchar(255) collate utf8_bin ,
                `customer_name` varchar(255) collate utf8_bin NOT NULL,
                `content` text collate utf8_bin NOT NULL,
                PRIMARY KEY (`testimonial_id`,`language_id`)
                )
                DEFAULT CHARSET=utf8;");
        if($res){
            $sql[] = "INSERT INTO ".DB_PREFIX."testimonial VALUES ('2', '1', '2');";
            $sql[] = "INSERT INTO ".DB_PREFIX."testimonial VALUES ('3', '1', '1');";
            $sql[] = "INSERT INTO ".DB_PREFIX."testimonial VALUES ('4', '1', '4');";
            $sql[] = "INSERT INTO ".DB_PREFIX."testimonial VALUES ('5', '1', '5');";
            $sql[] = "INSERT INTO ".DB_PREFIX."testimonial_description VALUES ('1', '1', 'catalog/demo/testimonial/demo1.jpg',Mr Peter', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.');";
            $sql[] = "INSERT INTO ".DB_PREFIX."testimonial_description VALUES ('2', '1','catalog/demo/testimonial/demo1.jpg', 'Mr Test', 'Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. ');";
            $sql[] = "INSERT INTO ".DB_PREFIX."testimonial_description VALUES ('3', '1','catalog/demo/testimonial/demo2.jpg', 'Mrs Brown', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit');";
            $sql[] = "INSERT INTO ".DB_PREFIX."testimonial_description VALUES ('4', '1', 'catalog/demo/testimonial/demo1.jpg','Mr Test1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit');";
            $sql[] = "INSERT INTO ".DB_PREFIX."testimonial_description VALUES ('5', '1', 'catalog/demo/testimonial/demo2.jpg','Mr Test2', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit');";
            foreach($sql as $q ){
                $query = $this->db->query( $q );
            }
            return $query;
        }
    }

    public function uninstall() {
        $this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "testimonial`");
        $this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "testimonial_description`");
    }
    public function addTestimonial($data) {
        $this->db->query("INSERT INTO " . DB_PREFIX . "testimonial SET status = '" . (int)$this->request->post['status'] . "', sort_order = '" . (int)$this->request->post['sort_order'] . "'");
        $testimonial_id = $this->db->getLastId();
        //	foreach ($data['testimonial_description'] as $language_id => $value) {
        //  var_dump( $data['testimonial_description']);die;
        $this->db->query("INSERT INTO " . DB_PREFIX . "testimonial_description SET testimonial_id = '" . (int)$testimonial_id . "', customer_name = '" . $data['testimonial_description']['customer_name'] . "', content = '" . $data['testimonial_description']['content'] . "'");
        //}
        $this->cache->delete('testimonial');
    }

    public function editTestimonial($testimonial_id, $data) {
        $this->db->query("UPDATE " . DB_PREFIX . "testimonial SET status = '" . (int)$this->request->post['status'] . "', sort_order = '" . (int)$data['sort_order'] . "' WHERE testimonial_id = '" . (int)$testimonial_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "testimonial_description WHERE testimonial_id = '" . (int)$testimonial_id . "'");
        //	foreach ($data['testimonial_description'] as $language_id => $value) {
        $this->db->query("INSERT INTO " . DB_PREFIX . "testimonial_description SET testimonial_id = '" . (int)$testimonial_id . "', customer_name = '" . $data['testimonial_description']['customer_name'] . "',image = '".$this->db->escape($data['image'])."', content = '" .  $data['testimonial_description']['content'] . "'");
        //	}
    }

    public function deleteTestimonial($testimonial_id) {
        $this->db->query("DELETE FROM " . DB_PREFIX . "testimonial WHERE testimonial_id = '" . (int)$testimonial_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "testimonial_description WHERE testimonial_id = '" . (int)$testimonial_id . "'");

        $this->cache->delete('testimonial');
    }


    public function getTestimonial($testimonial_id) {
        $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "testimonial t LEFT JOIN " . DB_PREFIX . "testimonial_description td ON (t.testimonial_id = td.testimonial_id) WHERE t.testimonial_id = '" . (int)$testimonial_id . "' ");
        return $query->row;
    }



    public function getTestimonials($data = array()) {
        if ($data) {
            $sql = "SELECT * FROM " . DB_PREFIX . "testimonial t LEFT JOIN " . DB_PREFIX . "testimonial_description td ON (t.testimonial_id = td.testimonial_id)";

            $sort_data = array(
                'td.customer_name',
                't.sort_order'
            );

            if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
                $sql .= " ORDER BY " . $data['sort'];
            } else {
                $sql .= " ORDER BY td.customer_name";
            }

            if (isset($data['order']) && ($data['order'] == 'DESC')) {
                $sql .= " DESC";
            } else {
                $sql .= " ASC";
            }

            if (isset($data['start']) || isset($data['limit'])) {
                if ($data['start'] < 0) {
                    $data['start'] = 0;
                }
                if ($data['limit'] < 1) {
                    $data['limit'] = 20;
                }
                $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
            }
            $query = $this->db->query($sql);
            return $query->rows;
        } else {
            $testimonial_data = $this->cache->get('testimonial.' . $this->config->get('config_language_id'));
            if (!$testimonial_data) {
                $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "testimonial t LEFT JOIN " . DB_PREFIX . "testimonial_description td ON (t.testimonial_id = td.testimonial_id) ORDER BY td.customer_name ASC");
                $testimonial_data = $query->rows;
                $this->cache->set('testimonial.' . $this->config->get('config_language_id'), $testimonial_data);
            }
            return $testimonial_data;
        }
    }

    public function getTestimonialDescriptions($testimonial_id) {
        $testimonial_description_data = array();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "testimonial_description WHERE testimonial_id = '" . (int)$testimonial_id . "'");

        foreach ($query->rows as $result) {
            $testimonial_description_data= array(
                'customer_name'       => $result['customer_name'],
                'content' => $result['content']
            );
        }

        return $testimonial_description_data;
    }

    public function getTotalTestimonials() {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "testimonial");

        return $query->row['total'];
    }

}
?>