<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:41:"./shop/admin\view\file_manager\index.html";i:1547203759;}*/ ?>
<div class="modal-dialog modal-lg">
  <div class="modal-content">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
      <h4 class="modal-title"><?php echo $heading_title; ?></h4>
    </div>
    <div class="modal-body">
      <div class="row">
        <div class="col-sm-5">
        	<a href="<?php echo $data['parent']; ?>" data-toggle="tooltip" title="上级" id="button-parent" class="btn btn-default"><i class="fa fa-level-up"></i></a> 
        	<a href="<?php echo $data['refresh']; ?>" data-toggle="tooltip" title="刷新" id="button-refresh" class="btn btn-default"><i class="fa fa-refresh"></i></a>
          <button type="button" data-toggle="tooltip" title="上传" id="button-upload" class="btn btn-primary"><i class="fa fa-upload"></i></button>
          <button type="button" data-toggle="tooltip" title="新建" id="button-folder" class="btn btn-default"><i class="fa fa-folder"></i></button>
          <button type="button" data-toggle="tooltip" title="删除" id="button-delete" class="btn btn-danger"><i class="fa fa-trash-o"></i></button>
        </div>
        <div class="col-sm-7">
          <div class="input-group">
            <input class="form-control search-query" type="text" placeholder="搜索"  name="search">
			<span class="input-group-btn">
				<button id="button-search" class="btn btn-primary btn-sm" type="button">
					<span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
					搜索
				</button>
			</span>
          </div>
        </div>
      </div>
      <hr />
      <?php if(!empty($data['images'])){ foreach (array_chunk($data['images'], 4) as $image) { ?>
				      <div class="row">
				        <?php foreach ($image as $image) { ?>
				        <div class="col-sm-3 text-center">
				          <?php if ($image['type'] == 'directory') { ?>
				          <div class="text-center"><a href="<?php echo $image['href']; ?>" class="directory" style="vertical-align: middle;"><i class="fa fa-folder fa-5x"></i></a></div>
				          <label>
				            <input type="checkbox" name="path[]" value="<?php echo $image['path']; ?>" />
				            <?php echo $image['name']; ?></label>
				          <?php } if ($image['type'] == 'image') { ?>
				          <a class="thumbnail"><img src="/<?php echo $image['thumb']; ?>" alt="<?php echo $image['name']; ?>" title="<?php echo $image['name']; ?>" /></a>
				          <label>
				            <input type="checkbox" name="path[]" value="<?php echo $image['path']; ?>" />
				            <?php echo $image['name']; ?></label>
				          <?php } ?>
				        </div>
				        <?php } ?>
				      </div>
			      	<br />
			     <?php } } ?>
    </div>
    
     <div class="modal-footer"><?php echo $data['pagination']; ?></div>
     
  </div>
</div>
<script type="text/javascript">

<?php if ($data['target']) { ?>
$('a.thumbnail').on('click', function(e) {
	e.preventDefault();

	<?php if ($data['thumb']) { ?>
	$("#<?php echo $data['thumb']; ?>").find('img').attr('src', $(this).find('img').attr('src'));
	<?php } ?>

	$("#<?php echo $data['target']; ?>").attr('value', $(this).parent().find('input').attr('value'));

	$('#modal-image').modal('hide');
});
<?php } ?>

$('a.directory').on('click', function(e) {
	e.preventDefault();

	$('#modal-image').load($(this).attr('href'));
});
$('.pagination a').on('click', function(e) {
	e.preventDefault();

	$('#modal-image').load($(this).attr('href'));
});
$('#button-parent').on('click', function(e) {
	e.preventDefault();

	$('#modal-image').load($(this).attr('href'));
});

$('#button-refresh').on('click', function(e) {
	e.preventDefault();

	$('#modal-image').load($(this).attr('href'));
});

$('input[name=\'search\']').on('keydown', function(e) {
	if (e.which == 13) {
		$('#button-search').trigger('click');
	}
});

$('#button-search').on('click', function(e) {
	
	var url = "<?php echo $data['search_url']; ?>";

	var filter_name = $('input[name=\'search\']').val();

	if (filter_name) {
		url += '\/filter_name\/' + encodeURIComponent(filter_name);
	}

	<?php if (input('param.thumb')) { ?>
	url += '\/thumb\/' + "<?php echo input('param.thumb'); ?>";
	<?php } if (input('param.target')) { ?>
	url += '\/target\/' + "<?php echo input('param.target'); ?>";
	<?php } ?>

	$('#modal-image').load(url);
});


$('#button-upload').on('click', function() {
	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" value="" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: "<?php echo $data['upload_url']; ?>",
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$('#button-upload i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
					$('#button-upload').prop('disabled', true);
				},
				complete: function() {
					$('#button-upload i').replaceWith('<i class="fa fa-upload"></i>');
					$('#button-upload').prop('disabled', false);
				},
				success: function(json) {
					if (json['error']) {
						alert(json['error']);
					}

					if (json['success']) {
						alert(json['success']);

						$('#button-refresh').trigger('click');
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});


$('#button-folder').popover({
	html: true,
	placement: 'bottom',
	trigger: 'click',
	title: '新建文件夹',
	content: function() {
		html  = '<div class="input-group">';
		html += '  <input type="text" name="folder" value="" placeholder="文件夹名称" class="form-control">';
		html += '  <span class="input-group-btn"><button type="button" title="新建文件夹" id="button-create" class="btn btn-primary btn-sm""><i class="fa fa-plus-circle"></i></button></span>';
		html += '</div>';

		return html;
	}
});

$('#button-folder').on('shown.bs.popover', function() {
	$('#button-create').on('click', function() {
		$.ajax({
			url:"<?php echo $data['folder_url']; ?>",
			type: 'post',
			dataType: 'json',
			data: 'folder=' + encodeURIComponent($('input[name=\'folder\']').val()),
			beforeSend: function() {
				$('#button-create').prop('disabled', true);
			},
			complete: function() {
				$('#button-create').prop('disabled', false);
			},
			success: function(json) {
				if (json['error']) {
					alert(json['error']);
				}

				if (json['success']) {
					alert(json['success']);

					$('#button-refresh').trigger('click');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	});
});

$('#modal-image #button-delete').on('click', function(e) {
	if (confirm('是否要删除')) {
		$.ajax({
			url: "<?php echo $data['delete_url']; ?>",
			type: 'post',
			dataType: 'json',
			data: $('input[name^=\'path\']:checked'),
			beforeSend: function() {
				$('#button-delete').prop('disabled', true);
			},
			complete: function() {
				$('#button-delete').prop('disabled', false);
			},
			success: function(json) {
				if (json['error']) {
					alert(json['error']);
				}

				if (json['success']) {
					alert(json['success']);

					$('#button-refresh').trigger('click');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	}
});
</script>