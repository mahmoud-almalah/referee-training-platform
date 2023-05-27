<?php 
$data = array('status' => 400);
if (!empty($_POST['search_value'])) {
	$search_value = PT_Secure($_POST['search_value']);
	$video_query = ($_POST['video'] == '1')? " OR (`videos`.`title` LIKE '%$search_value%' OR `videos`.`tags` LIKE '%$search_value%' OR `videos`.`description` LIKE '%$search_value%') ": "";
	$channel_query = ($_POST['channel'] == '1')? " OR (`channel`.`channel_name` LIKE '%$search_value%') ": "";
	$category_query = ($_POST['category'] == '1')? " OR (`categories`.`category` LIKE '%$search_value%') ": "";
	$search_result = $db->rawQuery("SELECT * FROM " . T_VIDEOS . " 
		INNER JOIN `channel` ON `videos`.`channel_id` = `channel`.`id` INNER JOIN `categories` ON `videos`.`category_id` = `categories`.`id` 
		WHERE ((`videos`.`id` = '0') ".$video_query.$category_query.$channel_query.") AND privacy = 0 LIMIT 10");
	if (!empty($search_result)) {
		$html = '';
		foreach ($search_result as $key => $search) {
			$search = PT_GetVideoByID($search, 0, 0, 0);
			$html .= "<div class='search-result'><a href='$search->url'>$search->title</a></div>";
		}
		// $html = $pt->categories);
		$data = array('status' => 200, 'html' => $html);
	}
} 
?>