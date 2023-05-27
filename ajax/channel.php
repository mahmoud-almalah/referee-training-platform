<?php
if (IS_LOGGED == false) {
    $data = array(
        'status' => 400,
        'error' => 'Not logged in'
    );
    echo json_encode($data);
    exit();
}

$action = PT_Secure($_POST['type']);
$id = PT_Secure($_POST['id']);


$categories = PT_Secure($_POST['categories']);

echo '<pre>';print_r($categories);exit;

if($action == "delete") {
    $db->where('id',$id)->delete(T_CHANNELS);
    $data = array(
        'status' => 200,
        'message' => 'Channel deleted.'
    );
    echo json_encode($data);
    exit();
}

if (!empty(PT_Secure($_POST['user_id']))) {
    $user_id = PT_Secure($_POST['user_id']);
    $channel_name = PT_Secure($_POST['channel_name']);
    $description = PT_Secure($_POST['description']);
    $thumbnail = PT_Secure($_POST['thumb_image']);
    $cover = PT_Secure($_POST['cover_image']);
    $insert_data  = array(
        'user_id' => $user_id,
        'channel_name' => $channel_name,
        'description' => $description,
        'thumbnail' => $thumbnail,
        'cover' => $cover,
        'time' => time(),
        'active' => '1',
    );
    $channel_create = $db->insert(T_CHANNELS, $insert_data);



}