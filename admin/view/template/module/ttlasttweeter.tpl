<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-store" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-store" class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                        <div class="col-sm-10">
                            <select name="ttlasttweeter_status" id="input-status" class="form-control">
                                <?php   if ($ttlasttweeter_status) { ?>
                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                <option value="0"><?php echo $text_disabled; ?></option>
                                <?php } else { ?>
                                <option value="1"><?php echo $text_enabled; ?></option>
                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-status"> http://www.tweeter.com/:<?php echo $text_ttlasttweeter_page; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="ttlasttweeter_name" value="<?php echo isset($ttlasttweeter_name)? $ttlasttweeter_name:''; ?>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-status"><?php echo $text_ttlasttweeter_id; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="ttlasttweeter_id" value="<?php echo isset($ttlasttweeter_id)? $ttlasttweeter_id:'' ; ?>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-status"><?php echo $text_ttlasttweeter_width; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="ttlasttweeter_width" value="<?php echo isset($ttlasttweeter_width)? $ttlasttweeter_width:'' ; ?>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-status"><?php echo $text_ttlasttweeter_height; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="ttlasttweeter_height" value="<?php echo isset($ttlasttweeter_height)? $ttlasttweeter_height:'' ; ?>">
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
<?php echo $footer; ?>