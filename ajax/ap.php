<?php

if (IS_LOGGED == false) {
    $data = array(
        'status' => 400,
        'error' => 'Not logged in'
    );
    echo json_encode($data);
    exit();
}
if (PT_IsAdmin() == false) {
    $data = array(
        'status' => 400,
        'error' => 'Not admin'
    );
    echo json_encode($data);
    exit();
}

if ($first == 'search_in_pages') {
    $keyword = PT_Secure($_POST['keyword']);
    $html = '';

    $files = scandir('./admin-panel/pages');
    $not_allowed_files = array('edit-custom-page','edit-lang','edit-article','edit-profile-field','edit-video-ad');
    foreach ($files as $key => $file) {
        if (file_exists('./admin-panel/pages/'.$file.'/content.html') && !in_array($file, $not_allowed_files)) {

            $string = file_get_contents('./admin-panel/pages/'.$file.'/content.html');
            preg_match_all("@(?s)<h2([^<]*)>([^<]*)<\/h2>@", $string, $matches1);

            if (!empty($matches1) && !empty($matches1[2])) {
                foreach ($matches1[2] as $key => $title) {
                    if (strpos(strtolower($title), strtolower($keyword)) !== false) {
                        $page_title = '';
                        preg_match_all("@(?s)<h2([^<]*)>([^<]*)<\/h2>@", $string, $matches3);
                        if (!empty($matches3) && !empty($matches3[2])) {
                            foreach ($matches3[2] as $key => $title2) {
                                $page_title = $title2;
                                break;
                            }
                        }
                        $html .= '<a href="'.PT_LoadAdminLinkSettings($file).'?highlight='.$keyword.'"><div  style="padding: 5px 2px;">'.$page_title.'</div><div><small style="color: #333;">'.$title.'</small></div></a>';
                        break;
                    }
                }
            }

            preg_match_all("@(?s)<label([^<]*)>([^<]*)<\/label>@", $string, $matches2);
            if (!empty($matches2) && !empty($matches2[2])) {
                foreach ($matches2[2] as $key => $lable) {
                    if (strpos(strtolower($lable), strtolower($keyword)) !== false) {
                        $page_title = '';
                        preg_match_all("@(?s)<h2([^<]*)>([^<]*)<\/h2>@", $string, $matches3);
                        if (!empty($matches3) && !empty($matches3[2])) {
                            foreach ($matches3[2] as $key => $title2) {
                                $page_title = $title2;
                                break;
                            }
                        }

                        $html .= '<a href="'.PT_LoadAdminLinkSettings($file).'?highlight='.$keyword.'"><div  style="padding: 5px 2px;">'.$page_title.'</div><div><small style="color: #333;">'.$lable.'</small></div></a>';
                        break;
                    }
                }
            }
        }
    }
    $data = array(
        'status' => 200,
        'html'   => $html
    );
}





if ($first == 'save-settings') {
    $submit_data = array();
    foreach ($_POST as $key => $settings_to_save) {
        $submit_data[$key] = $settings_to_save;
    }
    $update = false;
    if (!empty($submit_data)) {
        foreach ($submit_data as $key => $value) {
            if ($key == 'theme') {
                $_SESSION['theme'] = '';
            }
            if ($key == 'require_subcription' && $value == 'on' && $pt->config->go_pro != 'on') {
                $data = array('status' => 400);
                header('Content-Type: application/json');
                echo json_encode($data);
                exit();
            }
            if ($key == 'bank_description') {
                $update = $db->where('name', $key)->update(T_CONFIG, array('value' => $value));
            }
            else{
                if ($key != 'fav_category') {
                    $update = $db->where('name', $key)->update(T_CONFIG, array('value' => PT_Secure($value, 0)));
                }
            }
            if ($key == 'ftp_upload') {
                if ($value == "on") {
                    if ($pt->config->s3_upload == "on") {
                        $update = $db->where('name', 's3_upload')->update(T_CONFIG, array('value' => "off"));
                    }
                }
            }
            if ($key == 's3_upload') {
                if ($value == "on") {
                    if ($pt->config->ftp_upload == "on") {
                        $update = $db->where('name', 'ftp_upload')->update(T_CONFIG, array('value' => "off"));
                    }
                }
            }
            if ($key == 'admin_com_sell_videos') {
                if (empty($value) || $value < 0 || !is_numeric($value)) {
                    $update = $db->where('name', $key)->update(T_CONFIG, array('value' => 0));
                }
            }
            if($key == 'queue_count' && (!($value >= 0) || !is_numeric($value))){
                $update = $db->where('name', $key)->update(T_CONFIG, array('value' => 0));
            }
            if ($key == 'time_18' && (empty($value) || $value < 1 || !is_numeric($value))) {
                $update = $db->where('name', $key)->update(T_CONFIG, array('value' => 1));
            }
            if ($key == 'fav_category') {
                $category = array();
                if (!empty($_POST['fav_category'])) {

                    foreach ($_POST['fav_category'] as $key1 => $value1) {
                        if (in_array($value1, array_keys(get_object_vars($pt->categories)))) {
                            $category[] = PT_Secure($value1);
                        }
                    }
                }

                if (!empty($category)) {
                    $category = json_encode($category);
                }
                else{
                    $category = '';
                }
                $update = $db->where('name', $key)->update(T_CONFIG, array('value' => $category));
            }

        }
        if (isset($submit_data['s3_upload'])) {
            $get_config_json = file_get_contents('./nodejs/config.json');
            if (!empty($get_config_json)) {
                $config_json = json_decode($get_config_json);
                $config_json->amazon = ($submit_data['s3_upload'] == 'on') ? true : false;
                $config_json->amazon_bucket = $submit_data['s3_bucket_name'];
                $encode = json_encode($config_json, JSON_PRETTY_PRINT);
                $write_file = file_put_contents('./nodejs/config.json', $encode);
            }
        }
    }
    if ($update) {
        $data = array('status' => 200);
    }
}

if ($first == 'delete-comment') {
    if (!empty($_POST['id'])) {
        $id = PT_Secure($_POST['id']);
        $comment_data = $db->where('id', $id)->getOne(T_COMMENTS);
        RegisterPoint($comment_data->video_id, "comments",'-',$comment_data->user_id);
        $delete_comment = $db->where('id', $id)->delete(T_COMMENTS);
        if ($delete_comment) {
            $delete_comments_likes   = $db->where('comment_id', $id)->delete(T_COMMENTS_LIKES);
            $comments_replies        = $db->where('comment_id', $id)->get(T_COMM_REPLIES);
            $delete_comments_replies = $db->where('comment_id', $id)->delete(T_COMM_REPLIES);
            if (!empty($comments_replies)) {
                foreach ($comments_replies as $reply) {
                    $db->where('reply_id', $reply->id)->delete(T_COMMENTS_LIKES);
                }
            }

            if ($delete_comments_likes && $delete_comments_replies) {
                $data = array('status' => 200);
            }
        }
    }
}

if ($first == 'delete-user') {
    if (!empty($_POST['id'])) {
        $delete = PT_DeleteUser(PT_Secure($_POST['id']));
        if ($delete) {
            $data = array('status' => 200);
        }
    }
}



if ($first == 'delete-video') {
    if (!empty($_POST['id'])) {
        $get_video = $db->where('id', PT_Secure($_POST['id']))->getOne(T_VIDEOS);
        RegisterPoint($get_video->id, "upload",'-',$get_video->user_id);
        $delete = PT_DeleteVideo($get_video->id);
        if ($delete) {
            $data = array('status' => 200);
        }
    }
}

if ($first == 'delete-activity') {
    if (!empty($_POST['id'])) {
        $article = $db->where('id',PT_Secure($_POST['id']))->getOne(T_ACTIVITES);
        if (!empty($article)) {
            $s3      = ($pt->config->s3_upload == 'on' || $pt->config->ftp_upload = 'on' || $pt->config->spaces == 'on') ? true : false;
            if (file_exists($article->image)) {
                unlink($article->image);
            }

            else if ($s3 === true) {
                PT_DeleteFromToS3($article->image);
            }

            $delete  = $db->where('id',PT_Secure($_POST['id']))->delete(T_ACTIVITES);
            $delete  = $db->where('activity_id',PT_Secure($_POST['id']))->delete(T_DIS_LIKES);

            //Delete related data
            $post_comments = $db->where('activity_id',PT_Secure($_POST['id']))->get(T_COMMENTS);

            foreach ($post_comments as $comment_data) {
                $delete    = $db->where('comment_id',$comment_data->id)->delete(T_COMMENTS_LIKES);
                $replies   = $db->where('comment_id',$comment_data->id)->get(T_COMM_REPLIES);
                $db->where('comment_id',$comment_data->id)->delete(T_COMM_REPLIES);

                foreach ($replies as $comment_reply) {
                    $db->where('reply_id',$comment_reply->id)->delete(T_COMMENTS_LIKES);
                }
            }

            if (!empty($post_comments)) {
                $delete    = $db->where('activity_id',PT_Secure($_POST['id']))->delete(T_COMMENTS);
            }

            if ($delete) {
                $data = array('status' => 200);
            }
        }
    }
}

if ($first == 'delete-video_ad') {
    if (!empty($_POST['id'])) {
        $delete = $db->where('id', PT_Secure($_POST['id']))->delete(T_VIDEO_ADS);
        if ($delete) {
            $data = array('status' => 200);
        }
    }
}

if ($first == 'videos-status') {
    if (!empty($_POST['id']) && !empty($_POST['status'])) {
        if ($_POST['status'] == 'approve') {
            $update_to = 1;
        } else {
            $update_to = 0;
        }
        $db->where('id', PT_Secure($_POST['id']))->update(T_VIDEOS, array('approved' => $update_to));
    }
}

if ($first == 'add-user') {

    try{

        $first_name     = PT_Secure($_POST['first_name']);
        $last_name      = PT_Secure($_POST['last_name']);
        $email          = PT_Secure($_POST['email']);
        $parts          = explode('@',$email);
        $username       = sizeof($parts) > 0 ? $parts[0] : $first_name.$last_name;
        $country_id     = PT_Secure($_POST['country_id']);
        $phone_number   = PT_Secure($_POST['phone']);
        $role           = PT_Secure($_POST['role']);
        $equipment_size = PT_Secure($_POST['equipment_size']);
        $shoe_size      = PT_Secure($_POST['shoe_size']);
        $active         = PT_Secure($_POST['active']);
        $avatar         = 'backend/' .PT_Secure($_POST['thumb']);
        $cover          = (isset($_POST['simage']) && sizeof($_POST['simage']) > 0) ? 'backend/' .PT_Secure($_POST['simage'][0]) : null;
        $password       = sha1('123456');

        $sql = "INSERT INTO `users`(`first_name`,`last_name`, `email`, `username`,`country_id`,`avatar`,`cover`,`role`,`equipment_size`,`shoe_size`,`active`,`password`,`phone_number`) 
                    VALUES ('$first_name','$last_name','$email','$username','$country_id','$avatar','$cover','$role','$equipment_size','$shoe_size','$active','$password','$phone_number')";
        $result = $mysqli->query($sql);

        $fullname = $first_name.' '.$last_name;

        $sql = "SELECT * FROM email_template WHERE type = 'register'";
        $result = $mysqli->query($sql);
        $template = $result->fetch_assoc();

        $replace = ['#fullname','#email','#password','#loginlink'];
        $replaceWith   = [$fullname, $email, '123456', $loginlink];

        $body = str_replace($replace, $replaceWith, $template['content']);

        $send_message_data = [
            'from_email' => $pt->config->email,
            'from_name' => $pt->config->name,
            'to_email' => $email,
            'to_name' => $fullname,
            'subject' => 'Account Registration with ' . $pt->config->name,
            'charSet' => 'utf-8',
            'message_body' => $body,
            'is_html' => false
        ];

        $send_message      = PT_SendMessage($send_message_data);
        // if ($send_message === true) {
        //     $data['status'] = 200;
        // } else {
        //     $data['status'] = 400;
        //     $data['error']  = "Error found while sending the email, the information you provided are not correct, please test the email settings on your local device and make sure they are correct. ";
        // }

        $data['status'] = 200;
    }catch(Exception $ex){
        $data['status'] = 'error';
    }
}

if ($first == 'load-more-youtube')  {
    if (!empty($_POST['query']) && !empty($_POST['pageToken'])) {
        $query = PT_Secure(urlencode($_POST['query']));
        $limit = 50;
        if (!empty($_POST['limit']) && $limit < 51) {
            $limit = (int) PT_Secure($_POST['limit']);
        }
        $token = PT_Secure($_POST['pageToken']);
        try {
            $youtube = new Madcoda\Youtube(array('key' => $pt->config->yt_api));
            $search = array(
                'q'             => $query,
                'type'          => 'video',
                'part'          => 'id',
                'maxResults'    => $limit,
                'pageToken'     => $token,
            );
            if ($_POST['channel'] == 1) {
                $search['q'] = '';
                $search['channelId'] = $query;
            }
            $get_videos = $youtube->searchAdvanced($search, true);
            if (!empty($get_videos)) {
                if ($get_videos['info']['totalResults'] > 0) {
                    $next_token = $get_videos['info']['nextPageToken'];
                    $ids        = array();
                    foreach ($get_videos['results'] as $key => $video) {
                        $check_if_exists = $db->where('youtube', $video->id->videoId)->getValue(T_VIDEOS, 'count(*)');
                        if ($check_if_exists == 0) {
                            $ids[] = $video->id->videoId;
                        }
                    }
                    $ids_implode = implode(',', $ids);
                    if (!empty($ids_implode)) {
                        $youtube_call_url = "https://www.googleapis.com/youtube/v3/videos?part=contentDetails,snippet&id=$ids_implode&key={$pt->config->yt_api}";
                        $get_videos = connect_to_url($youtube_call_url);
                        $get_videos = json_decode($get_videos);
                        if (!empty($get_videos)) {
                            $videos_html = '';
                            foreach ($get_videos->items as $key => $video) {
                                $thumb = PT_GetMedia('upload/photos/thumbnail.jpg');
                                if (!empty($video->snippet->thumbnails->maxres->url)) {
                                    $thumb = $video->snippet->thumbnails->maxres->url;
                                } else if (!empty($video->snippet->thumbnails->medium->url)) {
                                    $thumb = $video->snippet->thumbnails->medium->url;
                                }
                                $tags = '';
                                if (!empty($video->snippet->tags)) {
                                    $tags_array = array();
                                    if (is_array($video->snippet->tags)) {
                                        $tag_count = 0;
                                        foreach ($video->snippet->tags as $key => $tag) {
                                            if ($tag_count < 11) {
                                                $tags_array[] = $tag;
                                            }
                                            $tag_count++;
                                        }
                                        $tags = implode(',', $tags_array);
                                    }
                                }
                                $duration = '00:00';
                                if (!empty(covtime($video->contentDetails->duration))) {
                                    $duration = covtime($video->contentDetails->duration);
                                }
                                $array_data = array(
                                    'ID' => $video->id,
                                    'TITLE' => $video->snippet->title,
                                    'DESC' => $video->snippet->description,
                                    'THUMB' => $thumb,
                                    'TAGS' => $tags,
                                    'DURATION' => $duration,
                                    'open_from_home_folder' => 1
                                );
                                $videos_html .= PT_LoadAdminPage('import-from-youtube/list', $array_data);
                            }
                            if (!empty($videos_html)) {
                                $data = array('status' => 200, 'html' => $videos_html, 'token' => $next_token);
                            }
                        }
                    }
                }
            }
        } catch (Exception $e) {

        }

    }
}
if ($first == 'load-more-daily')  {
    if (!empty($_POST['query']) && !empty($_POST['pageToken'])) {
        $query = PT_Secure(urlencode($_POST['query']));
        $limit = 50;
        if (!empty($_POST['limit']) && $limit < 101) {
            $limit = (int) PT_Secure($_POST['limit']);
        }
        $page_id = PT_Secure($_POST['pageToken']);
        $call_url = "https://api.dailymotion.com/videos/?search=$query&page=$page_id&limit=$limit&fields=thumbnail_1080_url,thumbnail_large_url,title,duration,description,tags,id";
        $get_videos = connect_to_url($call_url);
        $get_videos = json_decode($get_videos);
        if (!empty($get_videos)) {
            if (!empty($get_videos->total)) {
                $ids = array();
                foreach ($get_videos->list as $key => $video) {
                    $check_if_exists = $db->where('daily', $video->id)->getValue(T_VIDEOS, 'count(*)');
                    if ($check_if_exists == 0) {
                        $ids[] = $video->id;
                    }
                }
                $next_token = ($page_id < 100) ? ($page_id + 1) : 1;
                if (!empty($ids)) {
                    $videos_html = '';
                    foreach ($get_videos->list as $key => $video) {
                        $thumb = PT_GetMedia('upload/photos/thumbnail.jpg');
                        if (!empty($video->thumbnail_1080_url)) {
                            $thumb = $video->thumbnail_1080_url;
                        } else if (!empty($video->thumbnail_large_url)) {
                            $thumb = $video->thumbnail_large_url;
                        }
                        $thumb = str_replace('http://', 'https://', $thumb);
                        $tags = '';
                        if (is_array($video->tags)) {
                            $tags_array = array();
                            $tag_count = 0;
                            foreach ($video->tags as $key => $tag) {
                                if ($tag_count < 11) {
                                    $tags_array[] = $tag;
                                }
                                $tag_count++;
                            }
                            $tags = implode(',', $tags_array);
                        }
                        $duration = '00:00';
                        if (!empty($video->duration)) {
                            $duration = gmdate("i:s", $video->duration);
                        }
                        $array_data = array(
                            'ID' => $video->id,
                            'TITLE' => $video->title,
                            'DESC' => $video->description,
                            'THUMB' => $thumb,
                            'TAGS' => $tags,
                            'DURATION' => $duration,
                            'open_from_home_folder' => 1
                        );
                        $videos_html .= PT_LoadAdminPage('import-from-dailymotion/list', $array_data);
                    }
                    if (!empty($videos_html)) {
                        $data = array('status' => 200, 'html' => $videos_html, 'token' => $next_token);
                    }
                }
            }
        }
    }
}
if ($first == 'import-daily-videos') {
    if (!empty($_POST['videos'])) {
        $ids = array();
        $category_id = 0;
        if (!empty($_POST['category_id'])) {
            if (in_array($_POST['category_id'], array_keys(ToArray($pt->categories)))) {
                $category_id = $_POST['category_id'];
            }
        }
        foreach ($_POST['videos'] as $key => $data_fro_ajax) {
            $video_id  = PT_GenerateKey(15, 15);
            $video_id_ = $data_fro_ajax['video_id'];
            $title = $data_fro_ajax['title'];
            $description = $data_fro_ajax['description'];
            $duration = $data_fro_ajax['duration'];
            $thumb = $data_fro_ajax['thumb'];
            $tags = $data_fro_ajax['tags'];
            $insert = false;
            if (strpos($thumb, 'upload/photos/thumbnail')) {
                $thumb = 'upload/photos/thumbnail.jpg';
            }
            $check_for_video = $db->where('video_id', $video_id)->getValue(T_VIDEOS, 'count(*)');
            if ($check_for_video > 0) {
                $video_id = PT_GenerateKey(15, 15);
            }
            $link_regex = '/(http\:\/\/|https\:\/\/|www\.)([^\ ]+)/i';
            $i          = 0;
            preg_match_all($link_regex, PT_Secure($description), $matches);
            foreach ($matches[0] as $match) {
                $match_url           = strip_tags($match);
                $syntax              = '[a]' . urlencode($match_url) . '[/a]';
                $description = str_replace($match, $syntax, $description);
            }

            $user_id = $user->id;
            if (!empty($_POST['user_id']) && is_numeric($_POST['user_id']) && $_POST['user_id'] > 0) {
                $user_id = PT_Secure($_POST['user_id']);
            }
            $data_insert = array(
                'video_id' => $video_id,
                'user_id' => $user_id,
                'title' => PT_Secure($title),
                'description' => PT_Secure($description),
                'tags' => PT_Secure($tags),
                'duration' => $duration,
                'category_id' => $category_id,
                'daily' => $video_id_,
                'thumbnail' => $thumb,
                'time' => time(),
                'registered' => date('Y') . '/' . intval(date('m'))
            );
            if (!empty($_POST['sub_category_id'])) {
                $is_found = $db->where('type',PT_Secure($_POST['category_id']))->where('lang_key',PT_Secure($_POST['sub_category_id']))->getValue(T_LANGS,'COUNT(*)');
                if ($is_found > 0) {
                    $data_insert['sub_category'] = PT_Secure($_POST['sub_category_id']);
                }
            }
            $insert      = $db->insert(T_VIDEOS, $data_insert);
            if ($insert) {
                if (empty($_SESSION['imported-videos'])) {
                    $_SESSION['imported-videos'] = 1;
                } else {
                    $_SESSION['imported-videos']++;
                }
            }
        }
        if ($insert) {
            $data = array('status' => 200);
        }
    }
}
if ($first == 'import-youtube-videos') {


    if (!empty($_POST['videos'])) {
        $ids = array();
        $category_id = 0;
        if (!empty($_POST['category_id'])) {
            if (in_array($_POST['category_id'], array_keys(ToArray($pt->categories)))) {
                $category_id = $_POST['category_id'];
            }
        }
        foreach ($_POST['videos'] as $key => $data_fro_ajax) {
            $video_id  = PT_GenerateKey(15, 15);
            $video_id_ = $data_fro_ajax['video_id'];
            $title = $data_fro_ajax['title'];
            $description = $data_fro_ajax['description'];
            $duration = $data_fro_ajax['duration'];
            $thumb = $data_fro_ajax['thumb'];
            $tags = $data_fro_ajax['tags'];
            $insert = false;
            if (strpos($thumb, 'upload/photos/thumbnail')) {
                $thumb = 'upload/photos/thumbnail.jpg';
            }
            $check_for_video = $db->where('video_id', $video_id)->getValue(T_VIDEOS, 'count(*)');
            if ($check_for_video > 0) {
                $video_id = PT_GenerateKey(15, 15);
            }
            $link_regex = '/(http\:\/\/|https\:\/\/|www\.)([^\ ]+)/i';
            $i          = 0;
            preg_match_all($link_regex, PT_Secure($description), $matches);
            foreach ($matches[0] as $match) {
                $match_url           = strip_tags($match);
                $syntax              = '[a]' . urlencode($match_url) . '[/a]';
                $description = str_replace($match, $syntax, $description);
            }
            $user_id = $user->id;
            if (!empty($_POST['user_id']) && is_numeric($_POST['user_id']) && $_POST['user_id'] > 0) {
                $user_id = PT_Secure($_POST['user_id']);
            }
            $data_insert = array(
                'video_id' => $video_id,
                'user_id' => $user_id,
                'title' => PT_Secure($title),
                'description' => PT_Secure($description),
                'tags' => PT_Secure($tags),
                'duration' => $duration,
                'category_id' => $category_id,
                'youtube' => $video_id_,
                'thumbnail' => $thumb,
                'time' => time(),
                'registered' => date('Y') . '/' . intval(date('m'))
            );
            if (!empty($_POST['sub_category_id'])) {
                $is_found = $db->where('type',PT_Secure($_POST['category_id']))->where('lang_key',PT_Secure($_POST['sub_category_id']))->getValue(T_LANGS,'COUNT(*)');
                if ($is_found > 0) {
                    $data_insert['sub_category'] = PT_Secure($_POST['sub_category_id']);
                }
            }
            $insert      = $db->insert(T_VIDEOS, $data_insert);
            if ($insert) {
                if (empty($_SESSION['imported-videos'])) {
                    $_SESSION['imported-videos'] = 1;
                } else {
                    $_SESSION['imported-videos']++;
                }
            }
        }
        if ($insert) {
            $data = array('status' => 200);
        }
    }
}

if ($first == 'create-ads') {
    if (!empty($_POST['type'])) {
        if ((empty($_POST['name']) || empty($_POST['link']) || empty($_POST['ad_link']) || empty($_POST['type'])) && $_POST['type'] != 'vast') {
            $errors = 'Please check your details';
        } else {
            if (filter_var($_POST['link'], FILTER_VALIDATE_URL) === FALSE) {
                $errors = 'The Media is invalid';
            }
            if ( !empty($_POST['ad_link']) && filter_var($_POST['ad_link'], FILTER_VALIDATE_URL) === FALSE && $_POST['type'] != 'vast') {
                $errors = 'The URL is invalid';
            }
            if (!is_numeric($_POST['skip_seconds'])) {
                $errors = 'The skip seconds should be numeric';
            }
            if ($_POST['type'] == 'image') {
                if (!preg_match("([^\s]+(\.(?i)(jpe?g|png|gif|bmp))$)", $_POST['link'])) {
                    $errors = 'The image url is invalid';
                }
            }
            if ($_POST['type'] == 'vast') {
                if (!preg_match("([^\s]+(\.(?i)(xml))$)", $_POST['link'])) {
                    //$errors = 'The XML url is invalid';
                }
            }
            if ($_POST['type'] == 'video') {
                if (!preg_match("([^\s]+(\.(?i)(mp4|webp|mp3|mpeg|mov))$)", $_POST['link'])) {
                    $errors = 'The video url is invalid';
                }
            }
        }
        if (empty($errors)) {
            $seconds = 0;
            if (!empty($_POST['skip_seconds'])) {
                $seconds = PT_Secure($_POST['skip_seconds']);
            }
            $insert_array = array(
                'user_id' => $user->id,
                'name' => PT_Secure($_POST['name']),
                'skip_seconds' => $seconds,
                'ad_link' => !empty($_POST['ad_link']) ? PT_Secure($_POST['ad_link']) : '',
                'active' => 1,
            );
            if ($_POST['type'] == 'video') {
                $insert_array['ad_media'] = PT_Secure($_POST['link']);
            } elseif ($_POST['type'] == 'image') {
                $insert_array['ad_image'] = PT_Secure($_POST['link']);
            } elseif ($_POST['type'] == 'vast') {

                //$insert_array['vast_xml_link'] = PT_Secure($_POST['link']);
                $string = mysqli_real_escape_string($mysqli, $_POST['link']);
                $insert_array['vast_xml_link'] = $string;
                $insert_array['vast_type'] = ($_POST['vast_type'] == 'vast') ? 'vast' : 'vpaid';
            }
            $insert = $db->insert(T_VIDEO_ADS, $insert_array);
            if ($insert) {
                $data = array('status' => 200);
            }
        } else {
            $data = array('status' => 400, 'error' => $errors);
        }
    }
}

if ($first == 'edit-ads') {
    if (!empty($_POST['type']) && !empty($_POST['id'])) {
        $id = PT_Secure($_POST['id']);
        if ((empty($_POST['name']) || empty($_POST['link']) || empty($_POST['ad_link']) || empty($_POST['type'])) && $_POST['type'] != 'vast') {
            $errors = 'Please check your details';
        } else {
            if (filter_var($_POST['link'], FILTER_VALIDATE_URL) === FALSE) {
                $errors = 'The Media is invalid';
            }
            if (!empty($_POST['ad_link']) && filter_var($_POST['ad_link'], FILTER_VALIDATE_URL) === FALSE && $_POST['type'] != 'vast') {
                $errors = 'The URL is invalid';
            }
            if (!is_numeric($_POST['skip_seconds'])) {
                $errors = 'The skip seconds should be numeric';
            }
            if ($_POST['type'] == 'image') {
                if (!preg_match("([^\s]+(\.(?i)(jpe?g|png|gif|bmp))$)", $_POST['link'])) {
                    $errors = 'The image url is invalid';
                }
            }
            if ($_POST['type'] == 'vast') {
                if (!preg_match("([^\s]+(\.(?i)(xml))$)", $_POST['link'])) {
                    // $errors = 'The XML url is invalid';
                }
            }
            if ($_POST['type'] == 'video') {
                if (!preg_match("([^\s]+(\.(?i)(mp4|webp|mp3|mpeg|mov))$)", $_POST['link'])) {
                    $errors = 'The video url is invalid';
                }
            }
        }
        if (empty($errors)) {
            $seconds = 0;
            if (!empty($_POST['skip_seconds'])) {
                $seconds = PT_Secure($_POST['skip_seconds']);
            }
            $insert_array = array(
                'user_id' => $user->id,
                'name' => PT_Secure($_POST['name']),
                'skip_seconds' => $seconds,
                'ad_link' => !empty($_POST['ad_link']) ? PT_Secure($_POST['ad_link']) : '',
                'active' => 1,
            );
            if ($_POST['type'] == 'video') {
                $insert_array['ad_media'] = PT_Secure($_POST['link']);
            } elseif ($_POST['type'] == 'image') {
                $insert_array['ad_image'] = PT_Secure($_POST['link']);
            } elseif ($_POST['type'] == 'vast') {
                $insert_array['vast_xml_link'] = PT_Secure($_POST['link']);
                $insert_array['vast_type'] = ($_POST['vast_type'] == 'vast') ? 'vast' : 'vpaid';
            }
            $insert = $db->where('id', $id)->update(T_VIDEO_ADS, $insert_array);
            if ($insert) {
                $data = array('status' => 200);
            }
        } else {
            $data = array('status' => 400, 'error' => $errors);
        }
    }
}

if ($first == 'update-ads') {
    $updated = false;
    foreach ($_POST as $key => $ads) {
        if ($key != 'hash_id') {
            $ad_data = array(
                'code' => htmlspecialchars(base64_decode($ads)),
                'active' => (empty($ads)) ? 0 : 1
            );
            $update = $db->where('placement', PT_Secure($key))->update(T_ADS, $ad_data);
            if ($update) {
                $updated = true;
            }
        }
    }
    if ($updated == true) {
        $data = array(
            'status' => 200
        );
    }
}

if ($first == 'submit-sitemap-settings') {
    if (!file_exists('./sitemaps')) {
        @mkdir('./sitemaps', 0777, true);
    }
    $dom = new DOMDocument();
    $filename = 'sitemaps/sitemap.xml';
    if ($_POST['completed'] == 0) {
        $completed = 0;

        $videos_file_number = (!empty($_POST['videos_file_number'])) ? (int) $_POST['videos_file_number'] : 0;

        $post_file_number = (!empty($_POST['post_file_number'])) ? (int) $_POST['post_file_number'] : 0;

        $percentage = (!empty($_POST['percentage'])) ? (int) $_POST['percentage'] : 0;

        $worked = (!empty($_POST['worked'])) ? (int) $_POST['worked'] : 0;

        $total_videos =  $db->getValue(T_VIDEOS, 'count(*)');

        $total_posts =  $db->getValue(T_POSTS, 'count(*)');

        $total =  $total_videos + $total_posts;

        if (!empty($_POST['post_offset']) && $_POST['post_offset'] > 0) {
            $post_offset = PT_Secure($_POST['post_offset']);
            $db->where('id',$post_offset,'>');
        }
        $posts   = $db->get(T_POSTS,500);


        if (!empty($_POST['videos_offset']) && $_POST['videos_offset'] > 0) {
            $videos_offset = PT_Secure($_POST['videos_offset']);
            $db->where('id',$videos_offset,'>');
        }
        $mysql = $db->get(T_VIDEOS, 500);

        $count = count($mysql) + count($posts) + $worked;

        $sitemap_numbers = ceil($total_videos / 20000);

        $new_file = false;

        if ($videos_file_number > 1 || $post_file_number > 1) {
            $new_file = true;
        }
        if ($percentage == 0) {
            $files = glob('./sitemaps/*');
            foreach($files as $file){
                if(is_file($file))
                    unlink($file);
            }
            for ($i=1; $i <= $sitemap_numbers; $i++) {
                $open_file = fopen("sitemaps/sitemap-" . $i . ".xml", "w");
                $open_file = fopen("sitemaps/sitemap-a-" . $i . ".xml", "w");
            }
            if (filesize('sitemaps/sitemap-' . $videos_file_number . '.xml') < 1) {
                $write_video_data = '<?xml version="1.0" encoding="UTF-8"?>
                                <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">';
            }
            if (filesize('sitemaps/sitemap-a-' . $post_file_number . '.xml') < 1) {
                $write_posts_data = '<?xml version="1.0" encoding="UTF-8"?>
                                <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">';
            }
        }
        else if ($videos_file_number > 1) {
            if (filesize('sitemaps/sitemap-' . $videos_file_number . '.xml') < 1) {
                $write_video_data = '<?xml version="1.0" encoding="UTF-8"?>
                                <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">';
            }
            $write_posts_data = file_get_contents('sitemaps/sitemap-a-' . $post_file_number . '.xml');


        }else if ($post_file_number > 1) {
            if (filesize('sitemaps/sitemap-a-' . $post_file_number . '.xml') < 1) {
                $write_posts_data = '<?xml version="1.0" encoding="UTF-8"?>
                                <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">';
            }
            $write_video_data = file_get_contents('sitemaps/sitemap-' . $videos_file_number . '.xml');


        }  else {
            $write_video_data = file_get_contents('sitemaps/sitemap-' . $videos_file_number . '.xml');
            $write_posts_data = file_get_contents('sitemaps/sitemap-a-' . $post_file_number . '.xml');
        }

        if (!empty($mysql)) {
            foreach ($mysql as $key => $video) {
                $video = PT_GetVideoByID($video, 0, 0 , 0);
                $write_video_data .= '<url>
                              <loc>' . $video->url . '</loc>
                              <lastmod>' . date('c', $video->time). '</lastmod>
                              <changefreq>monthly</changefreq>
                              <priority>0.8</priority>
                           </url>' . "\n";
            }
        }
        file_put_contents('sitemaps/sitemap-' . $videos_file_number . '.xml', $write_video_data);



        if (!empty($posts)) {
            foreach ($posts as $key => $post) {
                $write_posts_data .= '<url>
                  <loc>' . PT_Link('articles/read/' . PT_URLSlug($post->title,$post->id)) . '</loc>
                  <lastmod>' . date('c', $post->time). '</lastmod>
                  <changefreq>monthly</changefreq>
                  <priority>0.8</priority>
               </url>' . "\n";
            }
        }
        file_put_contents('sitemaps/sitemap-a-' . $post_file_number . '.xml', $write_posts_data);
        if ($total > 0) {
            $percentage = round(($count * 100)/$total, 2);
        }
        if ($count == $total) {
            $percentage = 100;
        }
        if (empty($posts) && empty($mysql)) {
            $percentage = 100;
        }

        if ($percentage >= 100) {
            $write_posts_data .= "\n</urlset>";
            $write_video_data .= "\n</urlset>";
            file_put_contents('sitemaps/sitemap-' . $videos_file_number . '.xml', $write_video_data);
            file_put_contents('sitemaps/sitemap-a-' . $post_file_number . '.xml', $write_posts_data);
            $files = glob('./sitemaps/*');
            $write_final_data = '<?xml version="1.0" encoding="UTF-8"?>
                                <sitemapindex  xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" >';
            foreach($files as $file){
                if (is_file($file)) {
                    $write_final_data .= "\n<sitemap>
                                          <loc>" . $pt->config->site_url . '/' . str_replace('./', '', $file) . "</loc>
                                          <lastmod>" . date('c') . "</lastmod>
                                        </sitemap>";
                }
            }
            $write_final_data .= '</sitemapindex>';
            $file_final = file_put_contents('sitemap-main.xml', $write_final_data);
            $data['last_created'] = date('d-m-Y');
            $last_created_update =  $update = $db->where('name', 'last_created_sitemap')->update(T_CONFIG, array('value' => PT_Secure($data['last_created'], 0)));
            $completed = 1;
        }
        if (!empty($posts)) {
            $last_post = $posts[count($posts)-1];
            $post_offset = $last_post->id;
        }
        else{
            $post_offset = $_POST['post_offset'];
        }
        if (!empty($mysql)) {
            $last_video = $mysql[count($mysql)-1];
            $videos_offset = $last_video->id;
        }
        else{
            $videos_offset = $_POST['videos_offset'];
        }

        $worked = count($mysql) + count($posts) + $worked;

        if ($total_videos > 20000 && $worked >= 20000 && !empty($mysql) && $percentage < 100) {
            $write_video_data .= "\n</urlset>";
            file_put_contents('sitemaps/sitemap-' . $videos_file_number . '.xml', $write_video_data);
            $videos_file_number = $videos_file_number + 1;
        }
        if ($total_posts > 20000 && $worked >= 20000 && !empty($posts) && $percentage < 100) {
            $write_posts_data .= "\n</urlset>";
            file_put_contents('sitemaps/sitemap-a-' . $post_file_number . '.xml', $write_posts_data);
            $post_file_number = $post_file_number + 1;
        }
        $data = array('status' => 201, 'post_offset' => $post_offset, 'videos_offset' => $videos_offset , 'percentage_full' => $percentage . '%', 'percentage' => $percentage, 'videos_file_number' => $videos_file_number , 'post_file_number' => $post_file_number, 'worked' => $worked, 'completed' => $completed);
    }

}

if($first == 'update-template'){

    $content = $_POST['template'];

    $sql = "UPDATE `email_template` SET `content`='$content' WHERE type = 'register'";

    $result = $mysqli->query($sql);
    if($result){
        $data['status'] = 200;
    }else{
        $data['status'] = 'error';
    }

}

if($first == 'add-user-group'){

    $id = $_POST['id'];
    $name = $_POST['name'];
    $user_ids = implode(',',$_POST['user_ids']);

    if($id > 0){
        $sql = "UPDATE `user_group` SET `name`='$name' , `user_ids` = '$user_ids' WHERE `id` = '$id'";
        $result = $mysqli->query($sql);
        if($result){
            $data['status'] = 200;
        }else{
            $data['status'] = 'error';
        }
    }else{
        $sql = "INSERT INTO `user_group` (`name`,`user_ids`) VALUES ('$name','$user_ids')";
        $result = $mysqli->query($sql);
        if($result){
            $data['status'] = 200;
        }else{
            $data['status'] = 'error';
        }
    }
}

if($first == 'get-video-info'){
    $video_id = $_GET['video_id'];
    $sql = "SELECT * FROM `videos` WHERE `id` = '$video_id'";
    $result = $mysqli->query($sql);
    $video = $result->fetch_assoc();
    $data['status'] = 200;
    $data['payload'] = $video;
}
if($first == 'add-background'){
    $backImg = $_POST['thumb1'];
    $sort_order = $_POST['sort_order'];

    $sql = "INSERT INTO `background`(`image`,`sort_order`,`status`) VALUES ('$backImg','$sort_order','1')";
    $result = $mysqli->query($sql);
    if($result){
        $data['status'] = 200;
    }else{
        $data['status'] = $mysqli->getLastError();
    }
}

if($first == 'get-user-group'){

    $id = $_GET['user_group_id'];

    $sql = "SELECT * FROM `user_group` WHERE `id` = '$id'";
    $result = $mysqli->query($sql);
    $user_group = $result->fetch_assoc();
    $data['status'] = 200;
    $data['payload'] = $user_group;
}

if($first == 'delete-user-group'){
    $id = $_POST['user_group_id'];
    $sql = "DELETE FROM `user_group` WHERE id = '$id' ";
    $result = $mysqli->query($sql);
    if($result){
        $data['status'] = 200;
    }else{
        $data['status'] = 'error';
    }

}

if ($first == 'add-library') {

    $library_id = $_POST['id'];
    $library_name = $_POST['name'];
    $library_path = $_POST['thumb'];
    $library_bg = $_POST['thumb1'];
    $images = $_POST['simage'];
    $user_ids = $_POST['user_ids'];
    $time = time();


    if (sizeof($images) == 0) {
        $data['status'] = 'error';
        $data['message'] = 'One or more slider image is required';
    } else {

        if ($library_id > 0) {

            $sql = "SELECT * FROM libraries WHERE name = '$library_name' AND id <> '$library_id' LIMIT 1";
            $result = $mysqli -> query($sql);
            $library = $result -> fetch_assoc();

            if(is_null($library)){

                if(is_null($library_path)){
                    $sql = "UPDATE `libraries` SET `name`='$library_name' WHERE `id` = '$library_id'";
                }else{
                    $sql = "UPDATE `libraries` SET `name`='$library_name',`path`='$library_path' WHERE `id` = '$library_id'";
                }
                $mysqli->query($sql);

                if(is_null($library_bg)){
                    $sql = "UPDATE `libraries` SET `name`='$library_name' WHERE `id` = '$library_id'";
                }else{
                    $sql = "UPDATE `libraries` SET `back_img`='$library_bg' WHERE `id` = '$library_id'";
                }
                $mysqli->query($sql);

                if (sizeof($images) > 0) {

                    $sql = "DELETE FROM `slider` WHERE type = 'library' AND reference_id = '$library_id' ";
                    $result = $mysqli -> query($sql);

                    foreach ($images as $image) {

                        $parts = explode('_' , $image);
                        $caption = $parts[1];

                        $sql = "INSERT INTO `slider`(`image`,`caption`, `type`, `reference_id`) VALUES ('$image','$caption','library','$library_id')";
                        $result = $mysqli -> query($sql);
                    }
                }

                if (sizeof($user_ids) > 0) {

                    $sql = "DELETE FROM `user_library` WHERE library_id = '$library_id' ";
                    $result = $mysqli -> query($sql);

                    foreach ($user_ids as $user_id) {
                        $sql = "INSERT INTO `user_library`(`user_id`,`library_id`) VALUES ('$user_id','$library_id')";
                        $result = $mysqli -> query($sql);
                    }
                }

                if ($result) {
                    $data['status'] = 200;
                } else {
                    $data['status'] = 'error';
                }
            } else {
                $data['status'] = 'error';
                $data['message'] = 'Library name already exists';
            }

        } else {

            $sql = "SELECT * FROM libraries WHERE name = '$library_name' LIMIT 1";
            $result = $mysqli -> query($sql);
            $library = $result -> fetch_assoc();
            $sort_order = $_POST['sort_order'];


            if (is_null($library)) {

                if (is_null($library_path)) {
                    $data['status'] = 'error';
                    $data['message'] = 'Thumb image is required';
                } else {
                    $sql = "INSERT INTO `libraries`(`name`, `path`, `uploaded_at`,`back_img`, `sort_order`,`status`) VALUES ('$library_name','$library_path','$time','$library_bg','$sort_order','1')";
                    $result = $mysqli -> query($sql);

                    if (sizeof($images) > 0) {
                        foreach ($images as $image) {

                            $sql = "SELECT * FROM libraries ORDER BY id DESC LIMIT 1";
                            $result = $mysqli -> query($sql);
                            $library = $result -> fetch_assoc();
                            $library_id = $library['id'];

                            $parts = explode('_' , $image);
                            $caption = $parts[1];

                            $sql = "INSERT INTO `slider`(`image`,`caption`, `type`, `reference_id`) VALUES ('$image', '$caption' ,'library','$library_id')";
                            $result = $mysqli -> query($sql);
                        }
                    }

                    if (sizeof($user_ids) > 0) {
                        foreach ($user_ids as $user_id) {
                            $library_id = $library['id'];
                            $sql = "INSERT INTO `user_library`(`user_id`,`library_id`) VALUES ('$user_id','$library_id')";
                            $result = $mysqli -> query($sql);
                        }
                    }

                    if ($result) {
                        $data['status'] = 200;
                    } else {
                        $data['status'] = 'error';
                    }
                }

            } else {
                $data['status'] = 'error';
                $data['message'] = 'Library name already exists';
            }
        }
    }

}

if ($first == 'update-library-order')
{
    $post_order = $_POST["library_id"] ?? [];

    if (count($post_order) > 0){
        for ($order= 0; $order < count($post_order); $order++)
        {
            $sql = "UPDATE `libraries` SET `sort_order` = '$order' WHERE `id` = '$post_order[$order]'";
            $mysqli->query($sql);
        }
        echo true;
    }else{
        echo false;
        $data['status'] = 'error';
    }

}
if ($first == 'update-video-order')
{
    $post_order = $_POST["video_id"] ?? [];

    if (count($post_order) > 0){
        for ($order= 0; $order < count($post_order); $order++)
        {
            $sql = "UPDATE `videos` SET `sort_order` = '$order' WHERE `id` = '$post_order[$order]'";
            $mysqli->query($sql);
        }
        $data['status'] = 200;
    }else{
        $data['status'] = 'error';
    }

}


if ($first == 'search-video'){

    $keyword = $_POST['search'];
    $library_id = $_POST['library'];
    $channel_id = $_POST['channel'];
    $topic_id = $_POST['topic'];
    $added_by = $_POST['added_by'];
    $status = $_POST['status'];

    $sql = "SELECT * FROM videos WHERE 1=1";

    if (!empty($keyword)) {
        $sql .= " AND ( title LIKE
                        '%$keyword%'
                        OR
                        description LIKE
                        '%$keyword%'
                        OR
                        id LIKE
                        '%$keyword%'
                        OR
                        user_id LIKE
                        '%$keyword%'
                        )";
    }
    if (!empty($library_id)) {
        $sql .= " AND library_id = $library_id";
    }
    if (!empty($channel_id)) {
        $sql .= " AND channel_id = $channel_id";
    }
    if (!empty($topic_id)) {
        $sql .= " AND topic_id = $topic_id";
    }
    if (!empty($added_by)) {
        $sql .= " AND user_id = $added_by";
    }
    if (!empty($status)) {
        $sql .= " AND active = $status";
    }

    $result = $mysqli->query($sql);

    if($result->num_rows > 0){
        $data['status'] = 200;
        $data['videos'] = [];
        while($video = $result->fetch_assoc()){
            $data['videos'][] = $video;
        }

        $data['libraries'] = [];
        $sql = "SELECT * FROM libraries ORDER BY sort_order";
        $result = $mysqli->query($sql);
        while($library = $result->fetch_assoc()){
            $data['libraries'][] = $library;
        }

        $data['channels'] = [];
        $sql = "SELECT * FROM channel ORDER BY id DESC";
        $result = $mysqli->query($sql);
        while($channel = $result->fetch_assoc()){
            $data['channels'][] = $channel;
        }

        $data['topics'] = [];
        $sql = "SELECT * FROM topic ORDER BY id DESC";
        $result = $mysqli->query($sql);
        while($topic = $result->fetch_assoc()){
            $data['topics'][] = $topic;
        }

        $data['users'] = [];
        $sql = "SELECT * FROM users ORDER BY id DESC";
        $result = $mysqli->query($sql);
        while($user = $result->fetch_assoc()){
            $data['users'][] = $user;
        }

    }else{
        $data['status'] = 'error';
        $data['message'] = 'No video found';
    }

}

if ($first == 'search-referee'){

    $keyword = $_POST['search'];
    $first_name = $_POST['first_name'];
    $last_name = $_POST['last_name'];
    $country = $_POST['country'];
    $status = $_POST['status'];
    $role = $_POST['role'];

    $sql = "SELECT * FROM refereeing WHERE 1=1";

    if (!empty($keyword)) {
        $sql .= " AND ( first_name LIKE
                        '%$keyword%'
                        OR
                        last_name LIKE
                        '%$keyword%'
                        OR
                        country LIKE
                        '%$keyword%'
                        OR
                        role LIKE
                        '%$keyword%'
                        )";
    }
    if (!empty($first_name)) {
        $sql .= " AND first_name = '$first_name'";
    }
    if (!empty($last_name)) {
        $sql .= " AND last_name = '$last_name'";
    }
    if (!empty($country)) {
        $sql .= " AND country = '$country'";
    }
    if (!empty($status)) {
        $sql .= " AND status = '$status'";
    }
    if (!empty($role)) {
        $sql .= " AND role = '$role'";
    }

    $result = $mysqli->query($sql);

    if($result->num_rows > 0){
        $data['status'] = 200;
        $data['referees'] = [];
        while($referee = $result->fetch_assoc()){
            $data['referees'][] = $referee;
        }

        $data['videos'] = [];
        $sql = "SELECT * FROM videos";
        $result = $mysqli->query($sql);
        while($videos = $result->fetch_assoc()){
            $data['videos'][] = $videos;
        }
    }else{
        $data['status'] = 'error';
        $data['message'] = 'No video found';
    }

}

if($first == 'add-channel'){

    $library_id = $_POST['library_id'];
    $channel_id = $_POST['channel_id'];
    $channel_name = $_POST['name'];
    $channel_path = $_POST['thumb2'];
    $images = $_POST['simage'];

    $time = time();

    if(sizeof($images) == 0){
        $data['status'] = 'error';
        $data['message'] = 'One or more slider image is required';
    }else{

        if($channel_id > 0){

            $sql = "SELECT * FROM channel WHERE channel_name = '$channel_name' AND id <> '$channel_id' AND library_id = $library_id LIMIT 1";
            $result = $mysqli->query($sql);
            $library = $result->fetch_assoc();

            if(is_null($library)){

                if(is_null($channel_path)){
                    $sql = "UPDATE `channel` SET `channel_name`='$channel_name' WHERE `id` = '$channel_id'";
                    $mysqli->query($sql);
                }else{
                    $sql = "UPDATE `channel` SET `channel_name`='$channel_name',`cover`='$channel_path' WHERE `id` = '$channel_id'";
                    $mysqli->query($sql);
                }

                if(sizeof($images) > 0){

                    $sql = "DELETE FROM `slider` WHERE type = 'channel' AND reference_id = '$channel_id' ";
                    $result = $mysqli->query($sql);

                    foreach($images as $image){

                        $parts = explode('_',$image);
                        $caption = $parts[1];

                        $sql = "INSERT INTO `slider`(`image`,`caption`, `type`, `reference_id`) VALUES ('$image','$caption','channel','$channel_id')";
                        $result = $mysqli->query($sql);
                    }
                }

                if($result){
                    $data['status'] = 200;
                }else{
                    $data['status'] = 'error';
                }
            }else{
                $data['status'] = 'error';
                $data['message'] = 'Channel name already exists';
            }

        }else{

            $sql = "SELECT * FROM channel WHERE channel_name = '$channel_name' AND library_id = $library_id LIMIT 1";
            $result = $mysqli->query($sql);
            $channel = $result->fetch_assoc();
            $sort_order = $_POST['sort_order'];

            if(is_null($channel)){

                if(is_null($channel_path)){
                    $data['status'] = 'error';
                    $data['message'] = 'Thumb image is required';
                }else{
                    $sql = "INSERT INTO `channel` (`channel_name`, `cover`, `library_id`, `sort_order`,`active`) VALUES ('$channel_name','$channel_path','$library_id','$sort_order','1')";
                    $result = $mysqli->query($sql);

                    if(sizeof($images) > 0){
                        foreach($images as $image){

                            $sql = "SELECT * FROM channel ORDER BY id DESC LIMIT 1";
                            $result = $mysqli->query($sql);
                            $channel = $result->fetch_assoc();
                            $channel_id = $channel['id'];

                            $parts = explode('_',$image);
                            $caption = $parts[1];

                            $sql = "INSERT INTO `slider`(`image`,`caption`, `type`, `reference_id`) VALUES ('$image', '$caption' ,'channel','$channel_id')";
                            $result = $mysqli->query($sql);
                        }
                    }

                    if($result){
                        $data['status'] = 200;
                    }else{
                        $data['status'] = 'error';
                    }
                }

            }else{
                $data['status'] = 'error';
                $data['message'] = 'Channel name already exists';
            }
        }
    }
}

if ($first == 'update-background-order')
{
    $post_order = $_POST["back_id"] ?? [];

    if (count($post_order) > 0){
        for ($order= 0; $order < count($post_order); $order++)
        {
            $sql = "UPDATE `background` SET `sort_order` = '$order' WHERE `id` = '$post_order[$order]'";
            $mysqli->query($sql);
        }
        echo true;
    }else{
        echo false;
        $data['status'] = 'error';
    }

    $data['status'] = 200;

}
if ($first == 'update-slider-order')
{
    $post_order = $_POST["slider_id"] ?? [];

    if (count($post_order) > 0){
        for ($order= 0; $order < count($post_order); $order++)
        {
            $sql = "UPDATE `slider` SET `sort_order` = '$order' WHERE `id` = '$post_order[$order]'";
            $mysqli->query($sql);
        }
        echo true;
    }else{
        echo false;
        $data['status'] = 'error';
    }

    $data['status'] = 200;

}

if ($first == 'add-referee'){
    $referee_id = $_POST['referee_id'];
    $referee_first = $_POST['referee-first'];
    $referee_last = $_POST['referee-last'];
    $referee_country = $_POST['referee-country'];
    $referee_role = $_POST['referee-role'];
    $referee_status = $_POST['referee-status'];

    if($referee_id > 0){
        $sql = "UPDATE `refereeing` SET `first_name`='$referee_first',`last_name`='$referee_last',`country`='$referee_country',`role`='$referee_role',`status`='$referee_status' WHERE `id` = '$referee_id'";
    }else{
        $sql = "INSERT INTO `refereeing`(`first_name`, `last_name`, `country`, `role`, `status`) VALUES ('$referee_first','$referee_last','$referee_country','$referee_role','$referee_status')";
    }
    $result = $mysqli->query($sql);
    if($result){
        $data['status'] = 200;
    }else{
        $data['status'] = 'error';
    }
}

if($first == 'add-topic'){

    $library_id = $_POST['library_id'];
    $channel_id = $_POST['channel_id'];
    $topic_id = $_POST['topic_id'];
    $name = $_POST['name'];
    $topic_path = $_POST['thumb'];
    $images = $_POST['simage'];


    $time = time();

    if(sizeof($images) == 0){
        $data['status'] = 'error';
        $data['message'] = 'One or more slider image is required';
    }else{

        if($topic_id > 0){

            $sql = "SELECT * FROM topic WHERE name = '$name' AND id <> '$topic_id' AND library_id = $library_id AND channel_id = $channel_id LIMIT 1";
            $result = $mysqli->query($sql);
            $topic = $result->fetch_assoc();

            if(is_null($topic)){

                $sql = "UPDATE `topic` SET `name`='$name',`status`= '1'  WHERE `id` = '$topic_id'";
                $mysqli->query($sql);

                if(sizeof($images) > 0){

                    $sql = "DELETE FROM `slider` WHERE type = 'topic' AND reference_id = '$topic_id' ";
                    $result = $mysqli->query($sql);

                    foreach($images as $image){

                        $parts = explode('_',$image);
                        $caption = $parts[1];

                        $sql = "INSERT INTO `slider`(`image`,`caption`, `type`, `reference_id`) VALUES ('$image','$caption','topic','$topic_id')";
                        $result = $mysqli->query($sql);
                    }
                }

                if($result){
                    $data['status'] = 200;
                }else{
                    $data['status'] = 'error';
                }
            }else{
                $data['status'] = 'error';
                $data['message'] = 'Topic name already exists';
            }

        }else{

            $sql = "SELECT * FROM topic WHERE name = '$name' AND library_id = $library_id AND channel_id = $channel_id LIMIT 1";
            $result = $mysqli->query($sql);
            $topic = $result->fetch_assoc();
            $sort_order = $_POST['sort_order'];

            if(is_null($topic)){


                $sql = "INSERT INTO `topic` (`name`, `cover`, `library_id`,`channel_id` ,`sort_order`,`status`) VALUES ('$name','','$library_id','$channel_id','$sort_order','1')";
                $result = $mysqli->query($sql);

                if(sizeof($images) > 0){
                    foreach($images as $image){

                        $sql = "SELECT * FROM topic ORDER BY id DESC LIMIT 1";
                        $result = $mysqli->query($sql);
                        $topic = $result->fetch_assoc();
                        $topic_id = $topic['id'];

                        $parts = explode('_',$image);
                        $caption = $parts[1];

                        $sql = "INSERT INTO `slider`(`image`,`caption`, `type`, `reference_id`) VALUES ('$image', '$caption' ,'topic','$topic_id')";
                        $result = $mysqli->query($sql);
                    }
                }

                if($result){
                    $data['status'] = 200;
                }else{
                    $data['status'] = 'error';
                }


            }else{
                $data['status'] = 'error';
                $data['message'] = 'Topic name already exists';
            }
        }
    }
}

if($first == 'update-channel-sorting'){
    try{
        $sort_order = $_POST['sort_order'];
        $library_id = $_POST['library_id'];

        $sql = "SELECT * FROM channel WHERE library_id = '$library_id' ORDER BY sort_order";
        $channels = $mysqli->query($sql);

        $index = 0;
        foreach ($channels as $channel) {

            $order = $sort_order[$index];
            $channel_id = $channel['id'];

            $sql = "UPDATE `channel` SET `sort_order`='$order' WHERE `id` = '$channel_id'";
            $mysqli->query($sql);

            $index++;
        }

        $data['status'] = 200;
    }catch(Exception $ex){
        $data['status'] = 'error';
    }
}

if($first == 'update-topic-sorting'){
    try{
        $sort_order = $_POST['sort_order'];
        $library_id = $_POST['library_id'];
        $channel_id = $_POST['channel_id'];

        $sql = "SELECT * FROM topic WHERE library_id = '$library_id' AND channel_id = '$channel_id' ORDER BY sort_order";
        $topics = $mysqli->query($sql);

        $index = 0;
        foreach ($topics as $topic) {

            $order = $sort_order[$index];
            $topic_id = $topic['id'];

            $sql = "UPDATE `topic` SET `sort_order`='$order' WHERE `id` = '$topic_id'";
            $mysqli->query($sql);

            $index++;
        }

        $data['status'] = 200;
    }catch(Exception $ex){
        $data['status'] = 'error';
    }
}



if($first == 'get-library'){

    $library_id = $_GET['library_id'];

    $sql = "SELECT * FROM libraries WHERE id = '$library_id' LIMIT 1";
    $result = $mysqli->query($sql);
    $library = $result->fetch_assoc();

    $sql = "SELECT * FROM slider WHERE reference_id = '$library_id' AND type = 'library' ";
    $result = $mysqli->query($sql);

    $images = [];
    $users = [];

    foreach($result as $image){
        array_push($images,$image);
    }

    $sql = "SELECT * FROM user_library WHERE library_id = '$library_id'";
    $rows = $mysqli->query($sql);

    foreach($rows as $row){
        array_push($users,$row['user_id']);
    }

    $data['status'] = 200;
    $data['payload'] = $library;
    $data['images'] = $images;
    $data['users'] = $users;
}

if($first == 'get-channel'){

    $channel_id = $_GET['channel_id'];

    $sql = "SELECT * FROM channel WHERE id = '$channel_id' LIMIT 1";
    $result = $mysqli->query($sql);
    $channel = $result->fetch_assoc();

    $sql = "SELECT * FROM slider WHERE reference_id = '$channel_id' AND type = 'channel' ";
    $result = $mysqli->query($sql);

    $images = [];

    foreach($result as $image){
        array_push($images,$image);
    }

    $data['status'] = 200;
    $data['payload'] = $channel;
    $data['images'] = $images;
}

if($first == 'get-topic'){

    $topic_id = $_GET['topic_id'];

    $sql = "SELECT * FROM topic WHERE id = '$topic_id' LIMIT 1";
    $result = $mysqli->query($sql);
    $topic = $result->fetch_assoc();

    $sql = "SELECT * FROM slider WHERE reference_id = '$topic_id' AND type = 'topic' ";
    $result = $mysqli->query($sql);

    $images = [];

    foreach($result as $image){
        array_push($images,$image);
    }


    $data['status'] = 200;
    $data['payload'] = $topic;
    $data['images'] = $images;
}

if($first == 'get-referee'){
    $id = $_POST['id'];
    $sql = "SELECT * FROM refereeing WHERE id = '$id' LIMIT 1";
    $result = $mysqli->query($sql);
    $referee = $result->fetch_assoc();

    $data['status'] = 200;
    $data['payload'] = $referee;
}

if($first == 'delete-referee'){
    $id = $_POST['id'];
    $sql = "DELETE FROM refereeing WHERE id = '$id'";
    $mysqli->query($sql);

    $data['status'] = 200;
    $data['message'] = mysqli_error($mysqli);
}


if($first == 'status-change-topic'){
    $topic_id = $_POST['topic_id'];
    $status = $_POST['status'];
    $sql = "UPDATE `topic` SET `status`= '$status' WHERE `id` = '$topic_id'";
    $mysqli->query($sql);
    $data['status'] = 200;
}

/*
 *  Admin Menu
 */
if($first == 'save-admin-menu'){
    $time = time();
    $name = $_POST['menu_name'];
    $link = $_POST['menu_link'];
    $icon = $_POST['icon_name'];
    $status = $_POST['menu_status'];
    $sql = "INSERT INTO `admin_menu`(`name`,`status`, `link`, `icon`, `created_at`) VALUES ('$name','$status','$link','$icon','$time')";
    $mysqli->query($sql);
    $data['status'] = 200;
}

if($first == 'edit-admin-menu'){
    $time = time();
    $id = $_POST['menu_id'];
    $name = $_POST['menu_name'];
    $link = $_POST['menu_link'];
    $icon = $_POST['icon_name'];
    $status = $_POST['menu_status'];
    $sql = "UPDATE `admin_menu` SET `name`='$name',`link`='$link',`icon`='$icon',`created_at`='$time',`status`='$status' WHERE `id` = '$id'";
    $mysqli->query($sql);
    $data['status'] = 200;
}

if($first == 'delete-admin-menu'){
    $menu_id = $_POST['menu_id'];
    $sql = "DELETE FROM `admin_menu` WHERE `id` = '$menu_id'";
    $mysqli->query($sql);
    $data['status'] = 200;
}

if ($first == 'status-change-menu') {
    $menu_id = $_POST['menu_id'];
    $status = $_POST['status'];
    $sql = "UPDATE `admin_menu` SET `status`= '$status' WHERE `id` = '$menu_id'";
    $mysqli->query($sql);
    $data['status'] = 200;
}

if ($first == 'status-change-video') {
    $video_id = $_POST['video_id'];
    $status = $_POST['status'];
    $sql = "UPDATE `videos` SET `active`= '$status' WHERE `id` = '$video_id'";
    $mysqli->query($sql);
    $data['status'] = 200;
}
if ($first == 'status-change-refereeing') {
    try {
        $id = $_POST['id'];
        $status = $_POST['status'];
        $sql = "UPDATE `refereeing` SET `status`= '$status' WHERE `id` = '$id'";
        $mysqli->query($sql);
        $data['status'] = 200;
    } catch (Exception $e) {
        $data['status'] = 500;
    }

}
/*
 *  Admin Sub Menu
 */
if($first == 'save-admin-submenu'){
    $time = time();
    $name = $_POST['menu_name'];
    $link = $_POST['menu_link'];
    $status = $_POST['menu_status'];
    $menu_on = $_POST['menu_on'];
    $sql = "INSERT INTO `admin_submenu`(`name`,`status`, `link`, `created_at`,`menu_id`) VALUES ('$name','$status','$link','$time','$menu_on')";
    $mysqli->query($sql);
    $data['status'] = 200;
}

if($first == 'edit-admin-submenu'){
    $time = time();
    $id = $_POST['menu_id'];
    $name = $_POST['menu_name'];
    $link = $_POST['menu_link'];
    $status = $_POST['menu_status'];
    $menu_on = $_POST['menu_on'];
    $sql = "UPDATE `admin_submenu` SET `name`='$name',`link`='$link',`created_at`='$time',`status`='$status',`menu_id`='$menu_on' WHERE `id` = '$id'";
    $mysqli->query($sql);
    $data['status'] = 200;
}

if ($first == 'status-change-submenu') {
    $menu_id = $_POST['menu_id'];
    $status = $_POST['status'];
    $sql = "UPDATE `admin_submenu` SET `status`= '$status' WHERE `id` = '$menu_id'";
    $mysqli->query($sql);
    $data['status'] = 200;
}

if($first == 'delete-admin-submenu'){
    $menu_id = $_POST['menu_id'];
    $sql = "DELETE FROM `admin_submenu` WHERE `id` = '$menu_id'";
    $mysqli->query($sql);
    $data['status'] = 200;
}

if($first == 'save-menu'){
    $time = time();
    $name = $_POST['menu_name'];
    $link = $_POST['menu_link'];
    $icon = $_POST['icon_name'];
    $sql = "INSERT INTO `menu`(`name`, `link`, `icon`, `created_at`) VALUES ('$name','$link','$icon','$time')";
    $mysqli->query($sql);
    $data['status'] = 200;
}
if($first == 'edit-menu'){
    $time = time();
    $id = $_POST['menu_id'];
    $name = $_POST['menu_name'];
    $link = $_POST['menu_link'];
    $icon = $_POST['icon_name'];
    $sql = "UPDATE `menu` SET `name`='$name',`link`='$link',`icon`='$icon',`created_at`='$time' WHERE `id` = '$id'";
    $mysqli->query($sql);
    $data['status'] = 200;
}
if($first == 'edit-video'){
    $id = $_POST['id'];
    $title = $_POST['title'];
    $video_id = $_POST['video_id'];
    $description = $_POST['description'];
    $thumbnail = $_POST['thumbnail'];
    $active = $_POST['active'];
    $channel_id = $_POST['channel_id'];
    $is_decision = $_POST['is_decision'];
    $is_explaination = $_POST['is_explaination'];
    $is_comment = $_POST['is_comment'];
    $topic_id = $_POST['topic_id'];
    $technical = $_POST['technical'];
    $disciplinary = $_POST['disciplinary'];
    $var_technical = $_POST['var_technical'];
    $var_disciplinary = $_POST['var_disciplinary'];
    $library_id  = $_POST['library_id'];

    if(is_null($thumbnail)){
        $sql = "UPDATE `videos` SET `title`='$title',`video_id`='$video_id',`description`='$description',`active`='$active',`channel_id`='$channel_id',`is_decision`='$is_decision',`is_explaination`='$is_explaination',`is_comment`='$is_comment',`topic_id`='$topic_id',`technical`='$technical',`disciplinary`='$disciplinary',`var_technical`='$var_technical',`var_disciplinary`='$var_disciplinary',`library_id`='$library_id' WHERE `id` = '$id'";
    }else{
        $sql = "UPDATE `videos` SET `title`='$title',`video_id`='$video_id',`description`='$description',`thumbnail`='$thumbnail',`active`='$active',`channel_id`='$channel_id',`is_decision`='$is_decision',`is_explaination`='$is_explaination',`is_comment`='$is_comment',`topic_id`='$topic_id',`technical`='$technical',`disciplinary`='$disciplinary',`var_technical`='$var_technical',`var_disciplinary`='$var_disciplinary',`library_id`='$library_id' WHERE `id` = '$id'";
    }

    $mysqli->query($sql);
    $data['status'] = 200;
}
if($first == 'delete-menu'){
    $menu_id = $_POST['menu_id'];
    $sql = "DELETE FROM `menu` WHERE `id` = '$menu_id'";
    $mysqli->query($sql);
    $data['status'] = 200;
}

if($first == 'status-change-library'){
    $library_id = $_POST['library_id'];
    $status = $_POST['status'];
    $sql = "UPDATE `libraries` SET `status`= '$status' WHERE `id` = '$library_id'";
    $mysqli->query($sql);
    $data['status'] = 200;
}
if($first == 'delete-library'){
    $library_id = $_POST['library_id'];
    $sql = "DELETE FROM `libraries` WHERE `id` = '$library_id'";
    $mysqli->query($sql);
    $data['status'] = 200;
}

if($first == 'delete-channel'){
    $channel_id = $_POST['channel_id'];
    $sql = "DELETE FROM `channel` WHERE `id` = '$channel_id'";
    $mysqli->query($sql);
    $data['status'] = 200;
}

if ($first == 'status-change-channel') {
    $channel_id = $_POST['channel_id'];
    $status = $_POST['status'];
    $sql = "UPDATE `channel` SET `active`= '$status' WHERE `id` = '$channel_id'";
    $mysqli->query($sql);
    $data['status'] = 200;
}

if($first == 'delete-topic'){
    $topic_id = $_POST['topic_id'];
    $sql = "DELETE FROM `topic` WHERE `id` = '$topic_id'";
    $mysqli->query($sql);
    $data['status'] = 200;
}

if($first == 'add-decision-type'){
    $name = $_POST['name'];
    $technical_decision = $_POST['technical_decision'];
    $disciplinary_decision = $_POST['disciplinary_decision'];
    $var_disciplinary_decision = $_POST['var_disciplinary_decision'];
    $var_technical_decision = $_POST['var_technical_decision'];
    $sql = "INSERT INTO `decisions`(`name`,`technical`, `disciplinary`, `type`,`var_disciplinary`,var_technical) VALUES ('$name', '$technical_decision' ,'$disciplinary_decision','Technical','$var_disciplinary_decision','$var_technical_decision')";
    $mysqli->query($sql);
    $data['status'] = 200;
}
if($first == 'get-decision-type'){
    $id = $_GET['id'];
    $sql = "SELECT * FROM `decisions` WHERE id = $id";
    $result = $mysqli->query($sql);
    $data['data'] = $result->fetch_assoc();
    $sql = "SELECT * FROM `decisions_information` where decision_id = $id";
    $results = $mysqli->query($sql);
    $types = [];

    foreach ($results as $type){
        array_push($types,$type);
    }

    $data['types'] = $types;
    $data['status'] = 200;
}
if($first == 'get-library-channels'){
    $id = $_GET['id'];
    $sql = "SELECT * FROM channel WHERE library_id = $id";
    $results = $mysqli->query($sql);
    $channels = [];
    foreach ($results as $type){
        array_push($channels,$type);
    }
    $data['channels'] = $channels;
    $data['status'] = 200;
}
if($first == 'get-channel-topics'){
    $id = $_GET['id'];
    $sql = "SELECT * FROM topic WHERE channel_id = $id";
    $results = $mysqli->query($sql);
    $topics = [];
    foreach ($results as $type){
        array_push($topics,$type);
    }
    $data['topics'] = $topics;
    $data['status'] = 200;
}
if($first == 'add-decision-info'){
    $id = $_POST['id'];
    $technical = $_POST['technical'];
    $disciplinary = $_POST['disciplinary'];
    $var_technical = $_POST['var_technical'];
    $var_disciplinary = $_POST['var_disciplinary'];
    $index = 0;

    if($id > 0){
        $sql = "DELETE FROM `decisions_information` where decision_id = $id";
        $results = $mysqli->query($sql);
    }

    foreach ($technical as $key => $tech){
        $disc = $disciplinary[$index];
        $var_tech = $var_technical[$index];
        $var_disc = $var_disciplinary[$index];
        $sql = "INSERT INTO `decisions_information`(`decision_id`, `technical`, `disciplinary`, `var_technical`, `var_disciplinary`) VALUES ($id,'$tech','$disc','$var_tech','$var_disc')";
        $results = $mysqli->query($sql);
        $index++;
    }

    $data['status'] = 200;
}
if($first == 'save-video'){

    $decisionType = $_POST['decision_type'];
    $sql = "SELECT * FROM decisions WHERE id = $decisionType";
    $result = $mysqli->query($sql);
    $decisionType = $result->fetch_assoc();
    $technical = $decisionType['technical'];
    $disciplinary = $decisionType['disciplinary'];

    $topics = $_POST['topics'];

    $full_dir                   = str_replace('ajax', '/', __DIR__);
    $video_file_full_path       = $full_dir . $_POST['video-location'];
    $filepath                   = explode('.', $_POST['video-location'])[0];

    $gif_video = substr($filepath, 0,strpos($filepath, '_video') - 10).sha1(time()). "_small_video_.gif";
    $shell     = shell_exec("$ffmpeg_b $gif_video_time -y -i $video_file_full_path ".$full_dir . $gif_video);

    $video_output_full_path_240 = $full_dir . $filepath . "_240p_converted.mp4";
    $video_output_full_path_360 = $full_dir . $filepath . "_360p_converted.mp4";
    $video_output_full_path_480 = $full_dir . $filepath . "_480p_converted.mp4";
    $video_output_full_path_720 = $full_dir . $filepath . "_720p_converted.mp4";
    $video_output_full_path_1080 = $full_dir . $filepath . "_1080p_converted.mp4";
    $video_output_full_path_2048 = $full_dir . $filepath . "_2048p_converted.mp4";
    $video_output_full_path_4096 = $full_dir . $filepath . "_4096p_converted.mp4";

    shell_exec("$ffmpeg_b -y -i $video_file_full_path -vcodec libx264 -preset {$pt->config->convert_speed} -filter:v scale=426:-2 -crf 26 $video_output_full_path_240 2>&1");
    PT_UploadToS3($filepath . "_240p_converted.mp4");
    shell_exec("$ffmpeg_b -y -i $video_file_full_path -vcodec libx264 -preset {$pt->config->convert_speed} -filter:v scale=640:-2 -crf 26 $video_output_full_path_360 2>&1");
    PT_UploadToS3($filepath . "_360p_converted.mp4");
    shell_exec("$ffmpeg_b -y -i $video_file_full_path -vcodec libx264 -preset {$pt->config->convert_speed} -filter:v scale=854:-2 -crf 26 $video_output_full_path_480 2>&1");
    PT_UploadToS3($filepath . "_480p_converted.mp4");
    shell_exec("$ffmpeg_b -y -i $video_file_full_path -vcodec libx264 -preset {$pt->config->convert_speed} -filter:v scale=1280:-2 -crf 26 $video_output_full_path_720 2>&1");
    PT_UploadToS3($filepath . "_720p_converted.mp4");
    shell_exec("$ffmpeg_b -y -i $video_file_full_path -vcodec libx264 -preset {$pt->config->convert_speed} -filter:v scale=1920:-2 -crf 26 $video_output_full_path_1080 2>&1");
    PT_UploadToS3($filepath . "_1080p_converted.mp4");
    shell_exec("$ffmpeg_b -y -i $video_file_full_path -vcodec libx264 -preset {$pt->config->convert_speed} -filter:v scale=2048:-2 -crf 26 $video_output_full_path_2048 2>&1");
    PT_UploadToS3($filepath . "_2048p_converted.mp4");
    shell_exec("$ffmpeg_b -y -i $video_file_full_path -vcodec libx264 -preset {$pt->config->convert_speed} -filter:v scale=3840:-2 -crf 26 $video_output_full_path_4096 2>&1");
    PT_UploadToS3($filepath . "_4096p_converted.mp4");


    $link = '';

    foreach($topics as $topic){

        $video_id = PT_GenerateKey(15, 15);

        $values = [
            $video_id,
            $pt->user->id,
            '',
            $_POST['title'],
            $_POST['explanation'],
            '',
            $_POST['video_location'],'','','','','','','',
            time(),
            date('Y-m-d H:i:s'),
            1,'',
            '00:00',
            0,1,12,12,0,0,date('Y/m'),0,1,'',
            1,1,1,1,1,0,0,0,0,
            0,'','',
            $gif_video,0,
            '','','','','','',
            1,0,'',0,0,'','','',0,
            '',0,'on',0,
            $topic['channel_id']
            ,'','',
            $_POST['decision'] == true,
            $_POST['enable_explanation'] == true,
            $_POST['comments'] == true,
            $topic['topic_id'],
            $_POST['library_id'],
            $technical,
            $disciplinary,
            $_POST['technical'],
            $_POST['disciplinary'],
            $_POST['var_technical'],
            $_POST['var_disciplinary'],
        ];


        $columns = [
            'video_id',
            'user_id',
            'short_id',
            'title',
            'description',
            'thumbnail',
            'video_location',
            'youtube',
            'vimeo',
            'daily',
            'facebook',
            'ok',
            'twitch',
            'twitch_type',
            'time',
            'time_date',
            'active',
            'tags',
            'duration',
            'size',
            'converted',
            'category_id',
            'cid',
            'views',
            'featured',
            'registered',
            'privacy',
            'age_restriction',
            'type',
            'approved',
            '240p',
            '360p',
            '480p',
            '720p',
            '1080p',
            '2048p',
            '4096p',
            'sell_video',
            'sub_category',
            'geo_blocking',
            'demo',
            'gif',
            'is_movie',
            'stars',
            'producer',
            'country',
            'movie_release',
            'quality',
            'rating',
            'monetization',
            'rent_price',
            'stream_name',
            'live_time',
            'live_ended',
            'agora_resource_id',
            'agora_sid',
            'license',
            'is_stock',
            'trailer',
            'embedding',
            'live_chating',
            'publication_date',
            'channel_id',
            'free_kick_decision',
            'yellow_card_decision',
            'is_decision',
            'is_explaination',
            'is_comment',
            'topic_id',
            'technical',
            'disciplinary',
            'var_technical',
            'var_disciplinary',
            'technical_value',
            'disciplinary_value',
            'library_id'

        ];


        $columns_string = implode('`,`', $columns);
        $values_string = implode("','", $values);

        $sql = "INSERT INTO `videos`(`".$columns_string."`) VALUES ('".$values_string."')";
        $mysqli->query($sql);

        //$link = PT_Link('watch/' . PT_Slug($_POST['title'], $video_id));
        $link = PT_Link('watch/' . $video_id);

    }

    $data['status'] = 200;
    $data['link'] = $link;

}
if($first == 'delete-decision-type'){
    $id = $_POST['id'];
    $sql = "DELETE FROM `decisions` where id = $id";
    $results = $mysqli->query($sql);
    $data['status'] = 200;
}
if($first == 'delete-decision-info'){
    $id = $_POST['id'];
    $sql = "DELETE FROM `decisions_information` where id = $id";
    $results = $mysqli->query($sql);
    $data['status'] = 200;
}
if($first == 'get-decision-info'){
    $id = $_POST['id'];
    $sql = "SELECT * FROM `decisions_information` where decision_id = $id order by id desc";
    $results = $mysqli->query($sql);

    $rows = [];

    foreach ($results as  $row) {
        array_push($rows,[ 'technical' => $row['technical'] , 'disciplinary' => $row['disciplinary'] , 'var_technical' => $row['var_technical'] , 'var_disciplinary' => $row['var_disciplinary'] ]);
    }

    $data['data'] = $rows;
    $data['status'] = 200;
}
if($first == 'search_user'){
    $user_name = $_POST['user_name'];
    $sql = "SELECT * FROM `users` WHERE (`username` LIKE '%$user_name%') OR (`ip_address` LIKE '%$user_name%')";
    $result = $mysqli->query($sql);
    $html = "";
    foreach ($result as  $this_user) {
        $html .= '<div class="user-search-result" rel="'.$this_user['id'].'">'.$this_user['username'].'</div>';
    }
    $data = array('status' => 200, 'html' => $html);
}

if($first == 'share_videos_list'){
    $getAllSharedVideos = getAllSharedVideos($pt->user->id);
    $html = "";
    $html .= '
    <div class="page-container">
    <div class="videos-latest-list play_list">
    <h4 class="ptitle">
        <div><svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" viewBox="0 0 24 24"><path fill="currentColor" d="M19,9H2V11H19V9M19,5H2V7H19V5M2,15H15V13H2V15M17,13V19L22,16L17,13Z"></path></svg></div> Shared Videos
    </h4>';
    if($getAllSharedVideos->num_rows > 0){
        foreach($getAllSharedVideos as $this_list){
            $html .='
        <div class="col-md-4 col-sm-6 play-lists" id="">
            <div class="plist_parent" data-id="" data-views="">
                <div class="avatar">';
            if (IS_LOGGED && $pt->isowner == true):
                if($pt->user->id == $this_list['shared_user_id']){
                    $html .='
                        <div class="albm_hover_bg">
                            <div class="albm_hover_bg_list">
                                <div class="del-list" rel="'.$this_list['shared_id'].'"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"><path fill="currentColor" d="M15,16H19V18H15V16M15,8H22V10H15V8M15,12H21V14H15V12M3,18A2,2 0 0,0 5,20H11A2,2 0 0,0 13,18V8H3V18M14,5H11L10,4H6L5,5H2V7H14V5Z" /></svg> Delete</div>
                            </div>
                        </div>';
                }
            endif;
            $html .= '
                    <a href="{{LINK video/watch/'.PT_Slug($this_list["title"], $this_list["video_id"].'&topic_id='.$topic_id = $_GET['topic_id']).'}}" data-load="?link1=watch&id='.PT_Link("watch/").PT_Slug($this_list["title"], $this_list["video_id"].'&topic_id='.$topic_id = $_GET['topic_id']).'&list='.$this_list['playlist_id'].'">
                        <img src="'.PT_Link('').$this_list["thumbnail"].'" alt="'.$this_list["title"].'" />
                    </a>
                    <div class="plist-name">
                        <h4><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="currentColor" d="M19,9H2V11H19V9M19,5H2V7H19V5M2,15H15V13H2V15M17,13V19L22,16L17,13Z" /></svg>'.$this_list["title"].'</h4>
                    </div>
                </div>
            </div>
        </div>';

        }
    }else{
        $html .= 'No data found!';
    }
    $html .= '</div>
        </div>
    <div class="clear"></div>';
    $data = array('status' => 200, 'html' => $html);
}

if($first == 'del-shared-list'){
    $user_id = $pt->user->id;
    $shared_list_id = $_POST['shared_list_id'];
    $sql = "DELETE FROM `shared_playlist` WHERE `id` = '$shared_list_id'";
    $result = $mysqli->query($sql);
    if($result){
        $html = 'success';
    }else{
        $html = 'failed';
    }
    $data = array('status' => 200, 'html' => $html);
}

if($first == 'share-playlist'){
    $user_id = $_POST['user_id'];
    $playlist_id = $_POST['list_id'];
    $sent_by = $pt->user->id;
    $sent_at = time();
    $status = '1';
    $getUserById = getUserById($user_id);
    if($getUserById->num_rows > 0){
        $sql = "INSERT INTO `shared_playlist`(`playlist_id`, `user_id`, `sent_by`, `sent_at`, `status`) VALUES ('$playlist_id','$user_id','$sent_by','$sent_at','$status')";
        $result = $mysqli->query($sql);
        $html = 'success';
    }else{
        $html = 'error';
    }
    $data = array('status' => 200, 'html' => $html);
}
if($first == 'add-slider'){
    $thumb = $_POST['thumb'];
    $sort_order = $_POST['sort_order'];

    $sql = "INSERT INTO `slider`(`image`,`type` ,`caption`, `sort_order`, `status`) VALUES ('$thumb','home','$caption','$sort_order','1')";
    $result = $mysqli->query($sql);
    if($result){
        $data['status'] = 200;
    }else{
        $data['status'] = $mysqli->getLastError();
    }
}

if ($first == 'change-slider-status') {
    $slider_id = $_POST['slider_id'];
    $status = $_POST['status'];
    $sql = "UPDATE `slider` SET `status` = '$status' WHERE `id` = '$slider_id'";
    $result = $mysqli->query($sql);
    if($result){
        $data['status'] = 200;
    }else{
        $data['status'] = $mysqli->getLastError();
    }
}


if ($first == 'change-background-status') {
    $background_id = $_POST['background_id'];
    $status = $_POST['status'];
    $sql = "UPDATE `background` SET `status` = '$status' WHERE `id` = '$background_id'";
    $result = $mysqli->query($sql);
    if($result){
        $data['status'] = 200;
    }else{
        $data['status'] = $mysqli->getLastError();
    }
}

if($first == 'del-background'){
    $background_id = $_POST['background_id'];
    $sql = "DELETE FROM `background` WHERE `id` = '$background_id'";
    $result = $mysqli->query($sql);
    $data['status'] = 200;
}

if($first == 'del-slider'){
    $slide_id = $_POST['slide_id'];
    $sql = "DELETE FROM `slider` WHERE `id` = '$slide_id'";
    $result = $mysqli->query($sql);
    $data['status'] = 200;
}

if ($first == 'save-design') {
    $saveSetting = false;
    if (isset($_FILES['logo']['name'])) {
        $fileInfo = array(
            'file' => $_FILES["logo"]["tmp_name"],
            'name' => $_FILES['logo']['name'],
            'size' => $_FILES["logo"]["size"]
        );
        $media    = PT_UploadLogo($fileInfo);
    }
    if (isset($_FILES['light-logo']['name'])) {
        $fileInfo = array(
            'file' => $_FILES["light-logo"]["tmp_name"],
            'name' => $_FILES['light-logo']['name'],
            'size' => $_FILES["light-logo"]["size"],
            'light-logo' => true
        );
        $media    = PT_UploadLogo($fileInfo);
    }
    if (isset($_FILES['favicon']['name'])) {
        $fileInfo = array(
            'file' => $_FILES["favicon"]["tmp_name"],
            'name' => $_FILES['favicon']['name'],
            'size' => $_FILES["favicon"]["size"],
            'favicon' => true
        );
        $media    = PT_UploadLogo($fileInfo);
    }
    $submit_data = array();
    foreach ($_POST as $key => $settings_to_save) {
        $submit_data[$key] = $settings_to_save;
    }
    $update = false;
    if (!empty($submit_data)) {
        foreach ($submit_data as $key => $value) {
            $update = $db->where('name', $key)->update(T_CONFIG, array('value' => PT_Secure($value, 0)));
        }
    }
    if ($update) {
        $data = array('status' => 200);
    }
    $data['status'] = 200;
}

if ($first == 'save-terms') {
    $saveSetting = false;
    foreach ($_POST as $key => $value) {
        if ($key != 'hash_id') {
            $saveSetting = $db->where('type', $key)->update(T_TERMS, array('text' => PT_Secure(base64_decode($value), 0)));
        }
    }
    if ($saveSetting) {
        $data['status'] = 200;
    }
}

if ($first == 'new-article') {
    $error = false;
    if (empty($_POST['title']) || empty($_POST['description']) || empty($_POST['text']) || empty($_POST['tags']) || empty($_FILES["image"])) {
        $error = 400;
    }
    else{

        if (strlen($_POST['title']) < 5) {
            $error = 401;
        }

        else if(strlen($_POST['description']) < 15){
            $error = 402;
        }

        else if(empty($_POST['text'])){
            $error = 403;
        }

        else if (!empty($_FILES["image"]["error"])) {
            $error = 404;
        }


        else if (!file_exists($_FILES["image"]["tmp_name"])) {
            $error = 405;
        }

        else if (file_exists($_FILES["image"]["tmp_name"])) {
            $image = getimagesize($_FILES["image"]["tmp_name"]);
            if (!in_array($image[2], array(
                IMAGETYPE_GIF,
                IMAGETYPE_JPEG,
                IMAGETYPE_PNG,
                IMAGETYPE_BMP
            ))){
                $error = 405;
            }
        }

        else if (empty($_POST['category']) || !in_array($_POST['category'],array_keys(get_object_vars($pt->categories)))) {
            $error = 406;
        }
    }

    if (empty($error)) {

        $file_info   = array(
            'file' => $_FILES['image']['tmp_name'],
            'size' => $_FILES['image']['size'],
            'name' => $_FILES['image']['name'],
            'type' => $_FILES['image']['type'],
            'crop' => array(
                'width' => 600,
                'height' => 400
            )
        );

        $file_upload     = PT_ShareFile($file_info);
        $insert          = false;
        $active          = (isset($_POST['draft'])) ? '0' : '1';

        if (!empty($file_upload['filename'])) {
            $post_image  = PT_Secure($file_upload['filename']);
            $insert_data = array(
                'title' => PT_Secure(PT_ShortText($_POST['title'],150)),
                'description' => PT_Secure(PT_ShortText($_POST['description'],200)),
                'category' => PT_Secure($_POST['category']),
                'image' => $post_image,
                'text' => htmlspecialchars($_POST['text']),
                'tags' => PT_Secure(PT_ShortText($_POST['tags']),250),
                'time' => time(),
                'user_id' => $pt->user->id,
                'active' => $active,
                'views' => 0,
                'shared' => 0,
            );

            $insert     = $db->insert(T_POSTS,$insert_data);
        }

        $data['status'] = ($insert) ? 200 : 500;
        $data['url']    = PT_Link('articles/read/' . PT_URLSlug($insert_data['title'],$insert));
    }

    else{
        $data['status'] = $error;
    }
}

if ($first == 'update-article') {
    $error = false;
    if (empty($_POST['title']) || empty($_POST['description']) || empty($_POST['text']) || empty($_POST['tags'])) {
        $error = 400;
    }
    else{

        if (strlen($_POST['title']) < 5) {
            $error = 401;
        }

        else if(strlen($_POST['description']) < 15){
            $error = 402;
        }

        else if(empty($_POST['text'])){
            $error = 403;
        }
        else if (!empty($_FILES["image"])) {

            if (!empty($_FILES["image"]["error"])) {
                $error = 404;
            }

            else if (!file_exists($_FILES["image"]["tmp_name"])) {
                $error = 405;
            }

            else if (file_exists($_FILES["image"]["tmp_name"])) {
                $image = getimagesize($_FILES["image"]["tmp_name"]);
                if (!in_array($image[2], array(
                    IMAGETYPE_GIF,
                    IMAGETYPE_JPEG,
                    IMAGETYPE_PNG,
                    IMAGETYPE_BMP
                ))){
                    $error = 405;
                }
            }
        }



        else if (empty($_POST['category']) || !in_array($_POST['category'],array_keys(get_object_vars($pt->categories)))) {
            $error = 406;
        }

        else if(empty($_POST['id']) || !is_numeric($_POST['id'])){
            $error = 500;
        }
    }

    if (empty($error)) {
        $insert      = false;
        $active      = (isset($_POST['draft'])) ? '0' : '1';
        $active      = (!empty($_POST['status']) && $_POST['status'] == '1') ? '1' : '0';
        $id          = PT_Secure($_POST['id']);

        $update_data = array(
            'title' => PT_Secure(PT_ShortText($_POST['title'],150)),
            'description' => PT_Secure(PT_ShortText($_POST['description'],200)),
            'category' => PT_Secure($_POST['category']),
            'text' => htmlspecialchars($_POST['text']),
            'tags' => PT_Secure(PT_ShortText($_POST['tags']),250),
            'time' => time(),
            'active' => $active,
            'shared' => 0,
        );

        if (!empty($_FILES["image"])) {
            $file_info   = array(
                'file' => $_FILES['image']['tmp_name'],
                'size' => $_FILES['image']['size'],
                'name' => $_FILES['image']['name'],
                'type' => $_FILES['image']['type'],
                'crop' => array(
                    'width' => 600,
                    'height' => 400
                )
            );
            $file_upload     = PT_ShareFile($file_info);
            if (!empty($file_upload['filename'])) {
                $update_data['image'] = PT_Secure($file_upload['filename']);
            }
            else{
                $error = true;
            }
        }

        $insert         = $db->where('id',$id)->update(T_POSTS,$update_data);
        $data['status'] = ($insert && empty($error)) ? 200 : 500;
        $data['url']    = PT_Link('articles/read/' . PT_URLSlug($update_data['title'],$id));
    }

    else{
        $data['status'] = $error;
    }
}

if ($first == 'delete-article') {
    if (!empty($_POST['id'])) {
        $article = $db->where('id',PT_Secure($_POST['id']))->getOne(T_POSTS);
        if (!empty($article)) {
            $s3      = ($pt->config->s3_upload == 'on' || $pt->config->ftp_upload == 'on' || $pt->config->spaces == 'on') ? true : false;
            if (file_exists($article->image)) {
                unlink($article->image);
            }

            else if ($s3 === true) {
                PT_DeleteFromToS3($article->image);
            }

            $delete  = $db->where('id',PT_Secure($_POST['id']))->delete(T_POSTS);
            $delete  = $db->where('post_id',PT_Secure($_POST['id']))->delete(T_DIS_LIKES);

            //Delete related data
            $post_comments = $db->where('post_id',PT_Secure($_POST['id']))->get(T_COMMENTS);

            foreach ($post_comments as $comment_data) {
                $delete    = $db->where('comment_id',$comment_data->id)->delete(T_COMMENTS_LIKES);
                $replies   = $db->where('comment_id',$comment_data->id)->get(T_COMM_REPLIES);
                $db->where('comment_id',$comment_data->id)->delete(T_COMM_REPLIES);

                foreach ($replies as $comment_reply) {
                    $db->where('reply_id',$comment_reply->id)->delete(T_COMMENTS_LIKES);
                }
            }

            if (!empty($post_comments)) {
                $delete    = $db->where('post_id',PT_Secure($_POST['id']))->delete(T_COMMENTS);
            }

            if ($delete) {
                $data = array('status' => 200);
            }
        }
    }
}

if ($first == 'delete-user-ad') {
    if (!empty($_POST['id'])) {
        $ad_data = $db->where('id',PT_Secure($_POST['id']))->getOne(T_USR_ADS);
        if (!empty($ad_data)) {
            $s3      = ($pt->config->s3_upload == 'on' || $pt->config->ftp_upload = 'on' || $pt->config->spaces == 'on') ? true : false;
            if (file_exists($ad_data->media)) {
                unlink($ad_data->media);
            }

            else if ($s3 === true) {
                PT_DeleteFromToS3($ad_data->media);
            }

            $delete  = $db->where('id',PT_Secure($_POST['id']))->delete(T_USR_ADS);
            if ($delete) {
                $data = array('status' => 200);
            }
        }
    }
}

if ($first == 'backup') {
    $backup = PT_Backup($sql_db_host, $sql_db_user, $sql_db_pass, $sql_db_name);
    if ($backup) {
        $data['status'] = 200;
        $data['date']   = date('d-m-Y');
    }
}


use Aws\S3\S3Client;

if ($first == 'testS3') {
    try {
        $s3Client = S3Client::factory(array(
            'version' => 'latest',
            'region' => $pt->config->region,
            'credentials' => array(
                'key' => $pt->config->amazone_s3_key,
                'secret' => $pt->config->amazone_s3_s_key
            )
        ));

        $buckets  = $s3Client->listBuckets();
        if (!empty($buckets)) {
            if ($s3Client->doesBucketExist($pt->config->s3_bucket_name)) {
                $data['status'] = 200;
                $array          = array(
                    'upload/photos/d-cover.jpg',
                    'upload/photos/d-avatar.jpg',
                    'upload/photos/f-avatar.png',
                    'upload/photos/thumbnail.jpg',
                );
                foreach ($array as $key => $value) {
                    $upload = PT_UploadToS3($value, array(
                        'delete' => 'no'
                    ));
                }
            }

            else {
                $data['status'] = 300;
            }
        }
        else {
            $data['status'] = 500;
        }
    }

    catch (Exception $e) {
        $data['status']  = 400;
        $data['message'] = $e->getMessage();
    }
}

if ($first == 'test_ftp') {
    try {
        $ftp = new \FtpClient\FtpClient();
        $ftp->connect($pt->config->ftp_host, false, $pt->config->ftp_port);
        $login = $ftp->login($pt->config->ftp_username, $pt->config->ftp_password);
        if (!empty($pt->config->ftp_path)) {
            if ($pt->config->ftp_path != "./") {
                $ftp->chdir($pt->config->ftp_path);
            }
        }
        $array          = array(
            'upload/photos/d-cover.jpg',
            'upload/photos/d-avatar.jpg',
            'upload/photos/f-avatar.png',
            'upload/photos/thumbnail.jpg',
        );
        foreach ($array as $key => $value) {
            $upload = PT_UploadToS3($value, array(
                'delete' => 'no',
            ));
        }
        $data['status'] = 200;
    } catch (Exception $e) {
        $data['status']  = 400;
        $data['message'] = $e->getMessage();
    }
    header("Content-type: application/json");
    echo json_encode($data);
    exit();
}
if ($first == 'test_spaces') {
    include_once("assets/import/spaces/spaces.php");
    try {
        $key        = $pt->config->spaces_key;
        $secret     = $pt->config->spaces_secret;
        $space_name = $pt->config->space_name;
        $region     = $pt->config->space_region;
        $space      = new SpacesConnect($key, $secret, $space_name, $region);
        $buckets    = $space->ListSpaces();
        $result     = $space->PutCORS(array(
            'AllowedHeaders' => array(
                'Authorization'
            ),
            'AllowedMethods' => array(
                'POST',
                'GET',
                'PUT'
            ), // REQUIRED
            'AllowedOrigins' => array(
                '*'
            ), // REQUIRED
            'ExposeHeaders' => array(),
            'MaxAgeSeconds' => 3000
        ));
        if (!empty($buckets)) {
            if (!empty($space->GetSpaceName())) {
                $data['status'] = 200;
                $array          = array(
                    'upload/photos/d-cover.jpg',
                    'upload/photos/d-avatar.jpg',
                    'upload/photos/f-avatar.png',
                    'upload/photos/thumbnail.jpg',
                );
                foreach ($array as $key => $value) {
                    $upload = PT_UploadToS3($value, array(
                        'delete' => 'no'
                    ));
                }
            } else {
                $data['status'] = 300;
            }
        } else {
            $data['status'] = 500;
        }
    }
    catch (Exception $e) {
        $data['status']  = 400;
        $data['message'] = $e->getMessage();
    }
    header("Content-type: application/json");
    echo json_encode($data);
    exit();
}
if ($first == 'add-field') {
    if (!empty($_POST['name']) && !empty($_POST['type']) && !empty($_POST['description'])) {
        $type              = PT_Secure($_POST['type']);
        $name              = PT_Secure($_POST['name']);
        $description       = PT_Secure($_POST['description']);
        $registration_page = 0;
        if (!empty($_POST['registration_page'])) {
            $registration_page = 1;
        }
        $profile_page = 0;
        if (!empty($_POST['profile_page'])) {
            $profile_page = 1;
        }
        $length = 32;
        if (!empty($_POST['length'])) {
            if (is_numeric($_POST['length']) && $_POST['length'] < 1001) {
                $length = PT_Secure($_POST['length']);
            }
        }
        $placement_array = array(
            'profile',
            'general',
            'social',
            'none'
        );
        $placement       = 'profile';
        if (!empty($_POST['placement'])) {
            if (in_array($_POST['placement'], $placement_array)) {
                $placement = PT_Secure($_POST['placement']);
            }
        }
        $re_data = array(
            'name' => $name,
            'description' => $description,
            'length' => $length,
            'placement' => $placement,
            'registration_page' => $registration_page,
            'profile_page' => $profile_page,
            'active' => '1'
        );
        if (!empty($_POST['options'])) {
            $options              = @explode("\n", trim($_POST['options']));
            $re_data['options']   = PT_Secure(implode($options, ','));
        }

        $re_data['type']    = $type;
        $add                = PT_RegisterNewField($re_data);

        if ($add) {
            $data['status'] = 200;
        }
    }

    else {
        $data = array(
            'status' => 400,
            'message' => 'Please fill all the required fields'
        );
    }
}

if ($first == 'delfield' && !empty($_GET['id'])) {
    $data = array('status' => 304);
    if (pt_delete_field($_GET['id']) === true) {
        $data['status'] = 200;
    }
}

if ($first == 'update-field') {
    if (!empty($_POST['name']) && !empty($_POST['description']) && !empty($_POST['id'])) {
        $name              = PT_Secure($_POST['name']);
        $description       = PT_Secure($_POST['description']);
        $registration_page = 0;

        if (!empty($_POST['registration_page'])) {
            $registration_page = 1;
        }
        $profile_page = 0;
        if (!empty($_POST['profile_page'])) {
            $profile_page = 1;
        }
        $active = '0';
        if (!empty($_POST['active'])) {
            $active = '1';
        }
        $length = 32;
        if (!empty($_POST['length'])) {
            if (is_numeric($_POST['length']) && $_POST['length'] < 1001) {
                $length = PT_Secure($_POST['length']);
            }
        }
        $placement_array = array(
            'profile',
            'general',
            'social',
            'none'
        );
        $placement       = 'profile';

        if (!empty($_POST['placement'])) {
            if (in_array($_POST['placement'], $placement_array)) {
                $placement = PT_Secure($_POST['placement']);
            }
        }
        $up_data = array(
            'name' => $name,
            'description' => $description,
            'length' => $length,
            'placement' => $placement,
            'registration_page' => $registration_page,
            'profile_page' => $profile_page,
            'active' => $active
        );

        if (!empty($_POST['options'])) {
            $options            = @explode("\n", trim($_POST['options']));
            $up_data['options'] = implode($options, ',');
            $up_data['type']    = 'select';
        }

        $table = T_FIELDS;
        $add   = $db->where('id',$_POST['id'])->update($table,$up_data);
        if ($add) {
            $data['status'] = 200;
        }
    }

    else{
        $data = array(
            'status' => 400,
            'message' => 'Please fill all the required fields'
        );
    }
}

if ($first == 'withdrawal-requests' && !empty($_POST['id']) && !empty($_POST['a'])) {
    $request = (is_numeric($_POST['id']) && is_numeric($_POST['a']) && in_array($_POST['a'], array(1,2,3)));

    if ($request === true) {
        $request_id = PT_Secure($_POST['id']);
        if ($_POST['a'] == 1) {
            $request_data = $db->where('id',$request_id)->getOne(T_WITHDRAWAL_REQUESTS);
            if (!empty($request_data) && $request_data->status != 1) {
                $requiring = $db->where('id',$request_data->user_id)->getOne(T_USERS);
                if (!empty($requiring)) {
                    $db->where('id',$request_data->user_id)->update(T_USERS,array(
                        'balance' => ($requiring->balance -= $request_data->amount)
                    ));
                }
            }

            $db->where('id',$request_id)->update(T_WITHDRAWAL_REQUESTS,array('status' => 1));
        }

        else if ($_POST['a'] == 2) {
            $db->where('id',$request_id)->update(T_WITHDRAWAL_REQUESTS,array('status' => 2));
        }

        else if ($_POST['a'] == 3) {
            $db->where('id',$request_id)->delete(T_WITHDRAWAL_REQUESTS);
        }

        $data['status'] = 200;
    }
}

if ($first == 'verification' && !empty($_POST['id']) && !empty($_POST['a'])) {
    $request = (is_numeric($_POST['id']) && is_numeric($_POST['a']) && in_array($_POST['a'], array(1,2,3)));

    if ($request === true) {

        $request_id    = PT_Secure($_POST['id']);
        $request_data  = $db->where('id',$request_id)->getOne(T_VERIF_REQUESTS);

        if ($_POST['a'] == 1 && !empty($request_data)) {
            $up_data = array(
                'verified' => 1
            );

            $db->where('id',$request_data->user_id)->update(T_USERS,$up_data);
            $db->where('id',$request_id)->delete(T_VERIF_REQUESTS);
            $data['status'] = 200;
        }

        else if ($_POST['a'] == 2 && !empty($request_data)) {
            $user_data      = PT_UserData($request_data->user_id);
            $data['status'] = 200;
            $data['html']   = PT_LoadAdminPage('verification-requests/view',array(
                'ID' => $request_data->id,
                'USERNAME' => $request_data->name,
                'USER_AVATAR' => $user_data->avatar,
                'TEXT' => $request_data->message,
                'DATE' => date("Y-F-d",$request_data->time),
                'IMG' => PT_GetMedia($request_data->media_file),
            ));
        }

        else if ($_POST['a'] == 3) {
            $db->where('id',$request_id)->delete(T_VERIF_REQUESTS);
            $data['status'] = 200;
        }
    }
}

if ($first == 'monetization' && !empty($_POST['id']) && !empty($_POST['a'])) {
    $request = (is_numeric($_POST['id']) && is_numeric($_POST['a']) && in_array($_POST['a'], array(1,2,3)));

    if ($request === true) {

        $request_id    = PT_Secure($_POST['id']);
        $request_data  = $db->where('id',$request_id)->getOne(T_MON_REQUESTS);

        if ($_POST['a'] == 1 && !empty($request_data)) {
            $up_data = array(
                'monetization' => 1
            );

            $db->where('id',$request_data->user_id)->update(T_USERS,$up_data);
            if (file_exists($request_data->personal_photo)) {
                @unlink(trim($request_data->personal_photo));
            }
            else if($pt->config->s3_upload == 'on' || $pt->config->ftp_upload == 'on' || $pt->config->spaces == 'on'){
                @PT_DeleteFromToS3($request_data->personal_photo);
            }

            if (file_exists($request_data->id_photo)) {
                @unlink(trim($request_data->id_photo));
            }
            else if($pt->config->s3_upload == 'on' || $pt->config->ftp_upload == 'on' || $pt->config->spaces == 'on'){
                @PT_DeleteFromToS3($request_data->id_photo);
            }
            $db->where('id',$request_id)->delete(T_MON_REQUESTS);

            $notif_data = array(
                'notifier_id' => $pt->user->id,
                'recipient_id' => $request_data->user_id,
                'type' => 'monetization_accept',
                'url' => "settings/monetization",
                'time' => time()
            );
            pt_notify($notif_data);
            $data['status'] = 200;
        }

        else if ($_POST['a'] == 2 && !empty($request_data)) {
            $user_data      = PT_UserData($request_data->user_id);
            $data['status'] = 200;
            $data['html']   = PT_LoadAdminPage('monetization-requests/view',array(
                'ID' => $request_data->id,
                'USERNAME' => $request_data->name,
                'USER_AVATAR' => $user_data->avatar,
                'TEXT' => $request_data->message,
                'DATE' => date("Y-F-d",$request_data->time),
                'IMG' => PT_GetMedia($request_data->personal_photo),
                'IMG_ID' => PT_GetMedia($request_data->id_photo),
            ));
        }

        else if ($_POST['a'] == 3) {
            $notif_data = array(
                'notifier_id' => $pt->user->id,
                'recipient_id' => $request_data->user_id,
                'type' => 'monetization_decline',
                'url' => "settings/monetization",
                'time' => time()
            );
            pt_notify($notif_data);

            if (file_exists($request_data->personal_photo)) {
                @unlink(trim($request_data->personal_photo));
            }
            else if($pt->config->s3_upload == 'on' || $pt->config->ftp_upload == 'on' || $pt->config->spaces == 'on'){
                @PT_DeleteFromToS3($request_data->personal_photo);
            }

            if (file_exists($request_data->id_photo)) {
                @unlink(trim($request_data->id_photo));
            }
            else if($pt->config->s3_upload == 'on' || $pt->config->ftp_upload == 'on' || $pt->config->spaces == 'on'){
                @PT_DeleteFromToS3($request_data->id_photo);
            }
            $db->where('id',$request_id)->delete(T_MON_REQUESTS);
            $data['status'] = 200;
        }
    }
}

if ($first == 'reports' && !empty($_POST['id']) && !empty($_POST['a'])) {
    $request = (is_numeric($_POST['id']) && is_numeric($_POST['a']) && in_array($_POST['a'], array(1,2,3)));

    if ($request === true) {

        $report_id     = PT_Secure($_POST['id']);
        $report_data  = $db->where('id',$report_id)->getOne(T_REPORTS);

        if ($_POST['a'] == 1) {
            $db->where('id',$report_id)->delete(T_REPORTS);
            $data['status'] = 200;
        }

        else if ($_POST['a'] == 2 && !empty($report_data)) {
            $user_data      = PT_UserData($report_data->user_id);
            $data['status'] = 200;
            $data['html']   = PT_LoadAdminPage('manage-video-reports/view',array(
                'ID' => $report_data->id,
                'USERNAME' => $user_data->name,
                'USER_AVATAR' => $user_data->avatar,
                'TEXT' => $report_data->text,
                'DATE' => date("Y-F-d",$report_data->time),
            ));
        }

        else if ($_POST['a'] == 3 && !empty($report_data)) {
            $del = PT_DeleteVideo($report_data->video_id);

            if ($del) {
                $data['status'] = 200;
                $db->where('id',$report_id)->delete(T_REPORTS);
            }
        }
    }
}

if ($first == 'copy_reports' && !empty($_POST['id']) && is_numeric($_POST['id'])) {
    $report_id     = PT_Secure($_POST['id']);
    $report_data  = $db->where('id',$report_id)->getOne(T_COPYRIGHT);

    if ($_POST['a'] == 2 && !empty($report_data)) {
        $user_data      = PT_UserData($report_data->user_id);
        $data['status'] = 200;
        $data['html']   = PT_LoadAdminPage('copy_report/view',array(
            'ID' => $report_data->id,
            'USERNAME' => $user_data->name,
            'USER_AVATAR' => $user_data->avatar,
            'TEXT' => $report_data->text,
            'DATE' => date("Y-F-d",$report_data->time),
        ));
    }
    else if ($_POST['a'] == 3 && !empty($report_data)) {

        $data['status'] = 200;
        $db->where('id',$report_id)->delete(T_COPYRIGHT);
    }
}

if ($first == 'add_announcement') {
    $text           = (!empty($_POST['text'])) ? PT_Secure($_POST['text']) : "";
    $data['status'] = 400;
    $re_data        = array(
        'text'      => $text,
        'active'    => '1',
        'time'      => time()
    );

    $insert_id          = $db->insert(T_ANNOUNCEMENTS,$re_data);

    if (!empty($insert_id)) {
        $announcement   = $db->where('id',$insert_id)->getOne(T_ANNOUNCEMENTS);
        $data['status'] = 200;
        $data['html']   =  PT_LoadAdminPage("manage-announcements/active",array(
            'ANN_ID'    => $announcement->id,
            'ANN_VIEWS' => 0,
            'ANN_TEXT'  => PT_Decode($announcement->text),
            'ANN_TIME'  => PT_Time_Elapsed_String($announcement->time),
        ));
    }
}


if ($first == 'delete-announcement') {
    $request        = (!empty($_POST['id']) && is_numeric($_POST['id']));
    $data['status'] = 400;
    if ($request === true) {
        $announcement_id = PT_Secure($_POST['id']);
        $db->where('id',$announcement_id)->delete(T_ANNOUNCEMENTS);
        $data['status'] = 200;
    }
}

if ($first == 'toggle-announcement') {
    $request        = (!empty($_POST['id']) && is_numeric($_POST['id']));
    $data['status'] = 400;

    if ($request === true) {

        $announcement_id    = PT_Secure($_POST['id']);
        $announcement       = $db->where('id',$announcement_id)->getOne(T_ANNOUNCEMENTS);
        if (!empty($announcement)) {
            $status         = ($announcement->active == 1) ? '0' : '1';

            $db->where('id',$announcement_id)->update(T_ANNOUNCEMENTS,array('active' => $status));
            $data['status'] = 200;
            echo $status;
            exit();
        }

    }
}

if ($first == 'banip' && !empty($_POST['ip'])) {
    $data        = array('status' => 400);
    $request     = filter_var($_POST['ip'], FILTER_VALIDATE_IP);
    //if (!empty($request)){
    $table   = T_BANNED_IPS;
    $re_data = array(
        'ip_address' => $_POST['ip'],
        'time'       => time()
    );

    $ban_id  =  $db->insert($table,$re_data);
    $ban_ip  = $db->where('id',$ban_id)->getOne($table);

    if (!empty($ban_ip)) {
        $data['status']       = 200;
        $data['html']         = PT_LoadAdminPage("ban-users/list",array(
            'BANNEDIP_ID'     => $ban_ip->id,
            'BANNEDIP_TIME'   => PT_Time_Elapsed_String($ban_ip->time),
            'BANNEDIP_ADDR'   => $ban_ip->ip_address,
        ));
    }
    //}
}

if ($first == 'unbanip') {
    $data    = array('status' => 400);
    $request = (!empty($_POST['id']) && is_numeric($_POST['id']));
    if (!empty($request)){
        $table  = T_BANNED_IPS;
        $ban_id = PT_Secure($_POST['id']);
        $db->where('id',$ban_id)->delete($table);
        $data['status'] = 200;
    }
}

if ($first == 'save-custom-design-settings') {
    $data     = array('status' => 200);
    $code     = array();
    $code[]   = (!empty($_POST['header_js']))  ? $_POST['header_js']  : "";
    $code[]   = (!empty($_POST['footer_js']))  ? $_POST['footer_js']  : "";
    $code[]   = (!empty($_POST['css_styles'])) ? $_POST['css_styles'] : "";
    $errors   = pt_custom_design('save',$code);

    if (!empty($errors)) {
        $data = array('status' => 500,'errors' => $errors);
    }
}

if ($first == 'reset_apps_key') {

    $app_key     = md5(time());
    $db->where('name', 'server_key')->update(T_CONFIG, array('value' => $app_key));
    // $data_config = array(
    //     'apps_api_key' => $app_key
    // );

    // foreach ($data_config as $name => $value) {
    //     $db->where('name', $name)->update(T_CONFIG, array('value' => PT_Secure($value, 0)));
    // }

    $data['status']  = 200;
    $data['app_key'] = $app_key;
}


if ($first == 'get_lang_key' && !empty($_GET['lang_name']) && !empty($_GET['id'])) {
    $html     = '';
    $lang_key = PT_Secure($_GET['id']);
    $lang_nm  = PT_Secure($_GET['lang_name']);
    $langs    = $db->where('lang_key',$lang_key)->getOne(T_LANGS,array($lang_nm));

    if (!empty($langs)) {
        foreach ($langs as $key => $lang_value) {
            $html .= PT_LoadAdminPage('edit-lang/form-list',array(
                'KEY' => ($key),
                'LANG_KEY' => ucfirst($key),
                'LANG_VALUE' => $lang_value,
            ));
        }
    }

    else {
        $html = "<h4 class='text-center'>Keyword not found</h4>";
    }

    $data['status'] = 200;
    $data['html']   = $html;
}


if ($first == 'update_lang_key' && !empty($_POST['id_of_key'])) {
    $up_data   = array();
    $id_of_key = PT_Secure($_POST['id_of_key']);

    foreach ($langs as $lang) {
        if (!empty($_POST[$lang])) {
            $up_data[$lang] = PT_Secure($_POST[$lang]);
        }
    }

    $update = $db->where('lang_key',$id_of_key)->update(T_LANGS,$up_data);

    if ($update) {
        $data['status'] = 200;
    }
}

if ($first == 'add_new_lang' && !empty($_POST['lang'])) {

    if (in_array(strtolower($_POST['lang']), $langs)) {
        $data['status']  = 400;
    }

    else {
        $lang_name = PT_Secure($_POST['lang']);
        $lang_name = strtolower($lang_name);
        $t_langs   = T_LANGS;

        $sql       = "
            ALTER TABLE `$t_langs` ADD `$lang_name` 
            TEXT CHARACTER 
            SET utf8 COLLATE utf8_unicode_ci 
            NULL DEFAULT NULL
        ";

        $query       = mysqli_query($sqlConnect,$sql);

        if ($query) {

            $english = pt_get_langs('english');
            $content = file_get_contents('assets/langs/english.php');
            $fp      = fopen("assets/langs/$lang_name.php", "wb");
            fwrite($fp, $content);
            fclose($fp);

            foreach ($english as $key => $lang) {
                mysqli_query($sqlConnect,"UPDATE `$t_langs` SET `{$lang_name}` = '$lang' WHERE `lang_key` = '{$key}'");
            }

            $data['status'] = 200;
        }
    }
}

if ($first == 'add_new_lang_key' && !empty($_POST['lang_key'])) {
    $lang_key  = PT_Secure($_POST['lang_key']);
    $mysqli    = $db->where('lang_key',$lang_key)->getValue(T_LANGS,'count(*)');

    if ($mysqli == 0) {

        $insert_id = $db->insert(T_LANGS,array('lang_key' => $lang_key));

        if ($insert_id) {
            $data['status'] = 200;
            $data['url']    = PT_LoadAdminLinkSettings('manage-languages');
        }
    }

    else {
        $data['status']  = 400;
    }
}

if ($first == 'delete_lang' && !empty($_GET['id'])) {
    if (in_array($_GET['id'], $langs)) {
        $lang_name = PT_Secure($_GET['id']);
        $t_langs   = T_LANGS;
        $query     = mysqli_query($sqlConnect, "ALTER TABLE `$t_langs` DROP COLUMN `$lang_name`");
        if ($query) {
            if (file_exists("assets/langs/$lang_name.php")) {
                unlink("assets/langs/$lang_name.php");
            }
            $data['status'] = 200;
        }
    }
}

if ($first == 'get_user_ad' && !empty($_POST['id'])) {
    $data['status'] = 400;
    if (is_numeric($_POST['id']) && $_POST['id'] > 0) {
        $id = PT_Secure($_POST['id']);
        $ad = $db->where('id',$id)->getOne(T_USR_ADS);
        if (!empty($ad)) {
            $pt->type = $ad->category;
            $user_data      = PT_UserData($ad->user_id);
            $data['html']   = PT_LoadAdminPage('manage-user-ads/view',array(
                'ID' => $ad->id,
                'USERNAME' => $user_data->name,
                'USER_AVATAR' => $user_data->avatar,
                'DATE' => date("Y-F-d",$ad->posted),
                'IMG' => PT_GetMedia($ad->media),
            ));
            $data['status'] = 200;
        }
    }
}




if ($first == 'load-more-twitch')  {
    if (!empty($_POST['query']) && !empty($_POST['pageToken'])) {
        $query = PT_Secure(urlencode($_POST['query']));
        $limit = 50;
        if (!empty($_POST['limit']) && $limit < 101) {
            $limit = (int) PT_Secure($_POST['limit']);
        }
        $page_id = PT_Secure($_POST['pageToken']);

        $channelsApi = 'https://api.twitch.tv/kraken/channels/'.$query.'/videos?limit='.$limit.'&offset='.$page_id;
        $clientId = $pt->config->twitch_api;
        $ch = curl_init();

        curl_setopt_array($ch, array(
            CURLOPT_HTTPHEADER => array(
                'Client-ID: ' . $clientId,
                'Accept: application/vnd.twitchtv.v4+json'
            ),
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_URL => $channelsApi
        ));
        //curl_setopt($ch, CURLOPT_POSTFIELDS, $data);

        $response = curl_exec($ch);


        curl_close($ch);
        $get_videos = json_decode($response);
        if (!empty($get_videos)) {
            if (!empty($get_videos->_total)) {
                $ids = array();
                foreach ($get_videos->videos as $key => $video) {
                    $check_if_exists = $db->where('daily', substr($video->_id, 1))->getValue(T_VIDEOS, 'count(*)');
                    if ($check_if_exists == 0) {
                        $ids[] = substr($video->_id, 1);
                    }
                }
                $next_token = ($page_id + $limit);
                if (!empty($ids)) {
                    $videos_html = '';
                    foreach ($get_videos->videos as $key => $video) {
                        $thumb = PT_GetMedia('upload/photos/thumbnail.jpg');
                        if (!empty($video->thumbnails->medium[0]->url)) {
                            $thumb = $video->thumbnails->medium[0]->url;
                        } else if (!empty($video->thumbnails->large[0]->url)) {
                            $thumb = $video->thumbnails->large[0]->url;
                        }
                        $thumb = str_replace('http://', 'https://', $thumb);
                        $tags = '';
                        //                   if (is_array($video->tags)) {
                        //                          $tags_array = array();
                        //                          $tag_count = 0;
                        //  foreach ($video->tags as $key => $tag) {
                        //      if ($tag_count < 11) {
                        //                                  $tags_array[] = $tag;
                        //                              }
                        //                              $tag_count++;
                        //  }
                        //  $tags = implode(',', $tags_array);
                        // }
                        $duration = '00:00';
                        if (!empty($video->duration)) {
                            $duration = gmdate("i:s", $video->duration);
                        }
                        $title = '';
                        if (!empty($video->title)) {
                            $title = $video->title;
                        }
                        $description = '';
                        if (!empty($video->description)) {
                            $description = $video->description;
                        }
                        $array_data = array(
                            'ID' => substr($video->_id, 1),
                            'TITLE' => $title,
                            'DESC' => $description,
                            'THUMB' => $thumb,
                            'TAGS' => $tags,
                            'DURATION' => $duration,
                            'open_from_home_folder' => 1
                        );
                        $videos_html .= PT_LoadAdminPage('import-from-dailymotion/list', $array_data);
                    }
                    if (!empty($videos_html)) {
                        $data = array('status' => 200, 'html' => $videos_html, 'token' => $next_token);
                    }
                }
            }
        }
    }
}
if ($first == 'import-twitch-videos') {
    if (!empty($_POST['videos'])) {
        $ids = array();
        $category_id = 0;
        if (!empty($_POST['category_id'])) {
            if (in_array($_POST['category_id'], array_keys(ToArray($pt->categories)))) {
                $category_id = $_POST['category_id'];
            }
        }
        foreach ($_POST['videos'] as $key => $data_fro_ajax) {
            $video_id  = PT_GenerateKey(15, 15);
            $video_id_ = $data_fro_ajax['video_id'];
            $title = $data_fro_ajax['title'];
            $description = $data_fro_ajax['description'];
            $duration = $data_fro_ajax['duration'];
            $thumb = $data_fro_ajax['thumb'];
            $tags = $data_fro_ajax['tags'];
            $insert = false;
            if (strpos($thumb, 'upload/photos/thumbnail')) {
                $thumb = 'upload/photos/thumbnail.jpg';
            }
            $check_for_video = $db->where('video_id', $video_id)->getValue(T_VIDEOS, 'count(*)');
            if ($check_for_video > 0) {
                $video_id = PT_GenerateKey(15, 15);
            }
            $link_regex = '/(http\:\/\/|https\:\/\/|www\.)([^\ ]+)/i';
            $i          = 0;
            preg_match_all($link_regex, PT_Secure($description), $matches);
            foreach ($matches[0] as $match) {
                $match_url           = strip_tags($match);
                $syntax              = '[a]' . urlencode($match_url) . '[/a]';
                $description = str_replace($match, $syntax, $description);
            }

            $user_id = $user->id;
            if (!empty($_POST['user_id']) && is_numeric($_POST['user_id']) && $_POST['user_id'] > 0) {
                $user_id = PT_Secure($_POST['user_id']);
            }
            $data_insert = array(
                'video_id' => $video_id,
                'user_id' => $user_id,
                'title' => PT_Secure($title),
                'description' => PT_Secure($description),
                'tags' => PT_Secure($tags),
                'duration' => $duration,
                'category_id' => $category_id,
                'twitch' => $video_id_,
                'twitch_type' => 'videos',
                'thumbnail' => $thumb,
                'time' => time(),
                'registered' => date('Y') . '/' . intval(date('m'))
            );
            if (!empty($_POST['sub_category_id'])) {
                $is_found = $db->where('type',PT_Secure($_POST['category_id']))->where('lang_key',PT_Secure($_POST['sub_category_id']))->getValue(T_LANGS,'COUNT(*)');
                if ($is_found > 0) {
                    $data_insert['sub_category'] = PT_Secure($_POST['sub_category_id']);
                }
            }
            $insert      = $db->insert(T_VIDEOS, $data_insert);
            if ($insert) {
                if (empty($_SESSION['imported-videos'])) {
                    $_SESSION['imported-videos'] = 1;
                } else {
                    $_SESSION['imported-videos']++;
                }
            }
        }
        if ($insert) {
            $data = array('status' => 200);
        }
    }
}

/* -------------- Raheel -----------------*/
/* -------------- 23/08/2021 -------------*/

if ($first == 'add_new_category') {
    $category = PT_Secure($_POST['category']);
    $parent_id = 0;

    $sql = "INSERT INTO `categories`(`category`,`parent_id`) VALUES ('$category','$parent_id')";
    $result = $mysqli->query($sql);

    $data['status'] = 200;
}

if ($first == 'update_category') {
    $category = PT_Secure($_POST['category']);
    $id = PT_Secure($_POST['id']);
    $parent_id = 0;

    $sql = "UPDATE `categories` SET `category`='$category' WHERE `id` = $id";
    $mysqli->query($sql);

    $data['status'] = 200;
}

if($first == 'delete_category'){
    $id = $_POST['id'];
    $sql = "DELETE FROM `categories` WHERE `id` = '$id'";
    $mysqli->query($sql);
    $data['status'] = 200;
}

if ($first == 'add_new_subcategory') {
    $category = PT_Secure($_POST['category']);
    $parent_id = PT_Secure($_POST['category']);

    $sql = "INSERT INTO `categories`(`category`,`parent_id`) VALUES ('$category','$parent_id')";
    $result = $mysqli->query($sql);

    $data['status'] = 200;
}


if ($first == 'edit_subcategory') {

    $category = PT_Secure($_POST['category']);
    $parent_id = PT_Secure($_POST['category']);

    $sql = "UPDATE `category` SET `categories`='$category', `parent_id` = $parent_id WHERE `id` = $id";
    $result = $mysqli->query($sql);

    $data['status'] = 200;
}

if ($first == 'add_new_decision') {
    $name = PT_Secure($_POST['name']);
    $type = PT_Secure($_POST['type']);

    $sql = "INSERT INTO `decisions`(`name`,`type`) VALUES ('$name','$type')";
    $result = $mysqli->query($sql);

    $data['status'] = 200;
}

if ($first == 'update_decision') {
    $name = PT_Secure($_POST['name']);
    $type = PT_Secure($_POST['type']);
    $id = PT_Secure($_POST['id']);

    $sql = "UPDATE `decisions` SET `name`='$name', `type` = '$type' WHERE `id` = $id";
    $mysqli->query($sql);

    $data['status'] = 200;
}

if($first == 'delete_decision'){
    $id = $_POST['id'];
    $sql = "DELETE FROM `decisions` WHERE `id` = $id";
    $mysqli->query($sql);
    $data['status'] = 200;
}

if ($first == 'add_new_channel') {
    $user_id = PT_Secure($_POST['user_id']);
    $channel_name = PT_Secure($_POST['channel_name']);
    $description = PT_Secure($_POST['description']);
    $thumbnail = PT_Secure($_POST['thumb_image']);
    $cover = PT_Secure($_POST['cover_image']);
    $categories = $_POST['categories'];
    $users = $_POST['users'];
    $time = time();

    $sql = "INSERT INTO `channel`(`user_id`,`channel_name`,`description`,`cover`,`thumbnail`,`time`,`active`) VALUES ($user_id,'$channel_name','$description','$cover','$thumbnail','$time',1)";
    $result = $mysqli->query($sql);

    $sql = "SELECT * FROM channel ORDER BY id DESC LIMIT 1";
    $result = $mysqli->query($sql);
    $channel = $result->fetch_assoc();

    $channel_id = $channel['id'];

    foreach ($categories as $key => $category_id) {
        $sql = "INSERT INTO `channel_category`(`channel_id`,`category_id`) VALUES ($channel_id,$category_id)";
        $mysqli->query($sql);
    }

    foreach ($users as $key => $user_id) {
        $sql = "INSERT INTO `user_channel`(`channel_id`,`user_id`) VALUES ($channel_id,$user_id)";
        $mysqli->query($sql);
    }

    $data['status'] = 200;
}

if ($first == 'update_channel') {
    $channel_id = $_POST['channel_id'];
    $description = PT_Secure($_POST['description']);
    $channel_name = PT_Secure($_POST['channel_name']);
    $cover = PT_Secure($_POST['cover_image']);
    $users = $_POST['users'];
    $time = time();

    if(isset($_POST['thumb_image'])){
        $thumbnail = PT_Secure($_POST['thumb_image']);
        $sql = "UPDATE `channel` SET `channel_name`='$channel_name', `description` = '$description', `cover` = '$cover',`thumbnail` = '$thumbnail', `time` = '$time' WHERE `id` = $channel_id";
        $mysqli->query($sql);

    }else{
        $sql = "UPDATE `channel` SET `channel_name`='$channel_name', `description` = '$description', `cover` = '$cover',`time` = '$time' WHERE `id` = $channel_id";
        $mysqli->query($sql);
    }

    $categories = $_POST['categories'];

    $sql = "DELETE FROM channel_category WHERE channel_id = $channel_id";
    $result = $mysqli->query($sql);

    foreach ($categories as $key => $category_id) {
        $sql = "INSERT INTO `channel_category`(`channel_id`,`category_id`) VALUES ($channel_id,'$category_id')";
        $mysqli->query($sql);
    }

    $sql = "DELETE FROM user_channel WHERE channel_id = $channel_id";
    $result = $mysqli->query($sql);

    foreach ($users as $key => $user_id) {
        $sql = "INSERT INTO `user_channel`(`channel_id`,`user_id`) VALUES ($channel_id,$user_id)";
        $mysqli->query($sql);
    }

    $data['status'] = 200;
}

if($first == 'delete_channel'){
    $id = $_POST['id'];
    $sql = "DELETE FROM `channel` WHERE `id` = $id";
    $mysqli->query($sql);

    $sql = "DELETE FROM `channel_category` WHERE `channel_id` = $id";
    $mysqli->query($sql);

    $data['status'] = 200;
}


/* -------------- Raheel -----------------*/
if ($first == 'get_category_langs' && !empty($_POST['lang_key'])) {
    $data['status'] = 400;
    $pt->edit_category = $db->where('lang_key',PT_Secure($_POST['lang_key']))->getOne(T_LANGS);
    if (!empty($pt->edit_category)) {
        $data['html'] = PT_LoadAdminPage('manage_categories/langs_list');
        $data['status'] = 200;
    }
}
if ($first == 'edit_category' && !empty($_POST['lang_key'])) {

    $data['status'] = 400;
    $data['message'] = 'Please check your details';
    $update = false;
    $update_data = array();
    foreach ($pt->langs as $key => $lang) {
        if (!empty($_POST[$lang])) {
            $update_data[$lang] = PT_Secure($_POST[$lang]);
            $update = true;
        }
    }
    if ($update == true && !empty($update_data)) {
        $db->where('lang_key',PT_Secure($_POST['lang_key']))->update(T_LANGS,$update_data);
        $data = array('status' => 200);
    }


    // $data['status'] = 400;
    // $error = '';
    // if (empty($_POST['english']) && empty($_POST['arabic']) && empty($_POST['dutch']) && empty($_POST['french']) && empty($_POST['german']) && empty($_POST['russian']) && empty($_POST['spanish']) && empty($_POST['turkish'])) {
    //     $error = 'Please check your details';
    //     $data['message'] = $error;
    // }
    // if (empty($error)) {
    //     $update_data = array();
    //     if (!empty($_POST['english'])) {
    //         $update_data['english'] = PT_Secure($_POST['english']);
    //     }
    //     if (!empty($_POST['arabic'])) {
    //         $update_data['arabic'] = PT_Secure($_POST['arabic']);
    //     }
    //     if (!empty($_POST['dutch'])) {
    //         $update_data['dutch'] = PT_Secure($_POST['dutch']);
    //     }
    //     if (!empty($_POST['french'])) {
    //         $update_data['french'] = PT_Secure($_POST['french']);
    //     }
    //     if (!empty($_POST['german'])) {
    //         $update_data['german'] = PT_Secure($_POST['german']);
    //     }
    //     if (!empty($_POST['russian'])) {
    //         $update_data['russian'] = PT_Secure($_POST['russian']);
    //     }
    //     if (!empty($_POST['spanish'])) {
    //         $update_data['spanish'] = PT_Secure($_POST['spanish']);
    //     }
    //     if (!empty($_POST['turkish'])) {
    //         $update_data['turkish'] = PT_Secure($_POST['turkish']);
    //     }
    //     $db->where('lang_key',PT_Secure($_POST['lang_key']))->update(T_LANGS,$update_data);
    //     $data['status'] = 200;
    // }
}
if ($first == 'delete_category' && !empty($_POST['lang_key'])) {
    if ($_POST['lang_key'] != 'other') {
        $db->where('lang_key',PT_Secure($_POST['lang_key']))->delete(T_LANGS);
        $db->where('type',PT_Secure($_POST['lang_key']))->delete(T_LANGS);
        $db->where('category_id',PT_Secure($_POST['lang_key']))->update(T_VIDEOS,array('sub_category' => '',
            'category_id' => 'other'));
        $data['status'] = 200;
    }
}

if ($first == 'add_sub_category') {
    $data['status'] = 400;
    $data['message'] = 'Please check your details';
    $add = false;
    $insert_data = array();
    foreach ($pt->langs as $key => $lang) {
        if (!empty($_POST[$lang])) {
            $insert_data[$lang] = PT_Secure($_POST[$lang]);
            $add = true;
        }
    }
    $count = $db->where('lang_key',PT_Secure($_POST['key']))->getValue(T_LANGS,'COUNT(*)');
    if ($count == 0) {
        $add = false;
    }
    if ($add == true && !empty($insert_data)) {
        $insert_data['type'] = PT_Secure($_POST['key']);
        $id = $db->insert(T_LANGS,$insert_data);
        $db->where('id',$id)->update(T_LANGS,array('lang_key' => 'sub__'.$id));
        $data = array('status' => 200);
    }
}

if ($first == 'delete_sub_category') {
    $data['status'] = 400;
    if (!empty($_POST['sub_id'])) {
        if ($_POST['sub_id'] != 'other') {
            $db->where('lang_key',PT_Secure($_POST['sub_id']))->delete(T_LANGS);
            $db->where('sub_category',PT_Secure($_POST['sub_id']))->update(T_VIDEOS,array('sub_category' => ''));
            $data['status'] = 200;
        }
    }
}

if ($first == 'add_movie_category') {
    $data['status'] = 400;
    $data['message'] = 'Please check your details';
    $add = false;
    $insert_data = array();
    foreach ($pt->langs as $key => $lang) {
        if (!empty($_POST[$lang])) {
            $insert_data[$lang] = PT_Secure($_POST[$lang]);
            $add = true;
        }
    }
    if ($add == true && !empty($insert_data)) {
        $insert_data['type'] = 'movie_category';
        $id = $db->insert(T_LANGS,$insert_data);
        $db->where('id',$id)->update(T_LANGS,array('lang_key' => $id));
        $data = array('status' => 200);
    }
}

if ($first == 'add_new_page') {
    if (!empty($_POST['page_name']) && !empty($_POST['page_content']) && !empty($_POST['page_title'])) {
        $page_name    = PT_Secure($_POST['page_name']);
        $page_content = PT_Secure(str_replace(array("\r","\n"),"",$_POST['page_content']));
        $page_title   = PT_Secure($_POST['page_title']);
        $page_type    = 0;
        if (!empty($_POST['page_type'])) {
            $page_type = 1;
        }
        if (!preg_match('/^[\w]+$/', $page_name)) {
            $data = array(
                'status' => 400,
                'message' => 'Invalid page name characters'
            );
            header("Content-type: application/json");
            echo json_encode($data);
            exit();
        }
        $data_ = array(
            'page_name' => $page_name,
            'page_content' => $page_content,
            'page_title' => $page_title,
            'page_type' => $page_type
        );
        $add = $db->insert(T_CUSTOM_PAGES,$data_);
        if ($add) {
            $data['status'] = 200;
        }
    } else {
        $data = array(
            'status' => 400,
            'message' => 'Please fill all the required fields'
        );
    }
}

if ($first == 'delete_custom_page') {
    if (!empty($_POST['id']) && is_numeric($_POST['id']) && $_POST['id'] > 0) {
        $id = PT_Secure($_POST['id']);
        $db->where('id',$id)->delete(T_CUSTOM_PAGES);
        $data['status'] = 200;
    }
}

if ($first == 'edit_page') {

    if (!empty($_POST['page_id']) && !empty($_POST['page_name']) && !empty($_POST['page_content']) && !empty($_POST['page_title'])) {
        $page_name    = $_POST['page_name'];
        $page_content = $_POST['page_content'];
        $page_title   = $_POST['page_title'];
        $page_type    = 0;
        if (!empty($_POST['page_type'])) {
            $page_type = 1;
        }
        if (!preg_match('/^[\w]+$/', $page_name)) {
            $data = array(
                'status' => 400,
                'message' => 'Invalid page name characters'
            );
            header("Content-type: application/json");
            echo json_encode($data);
            exit();
        }
        $data_ = array(
            'page_name' => $page_name,
            'page_content' => $page_content,
            'page_title' => $page_title,
            'page_type' => $page_type
        );
        $add = $db->where('id',PT_Secure($_POST['page_id']))->update(T_CUSTOM_PAGES,$data_);
        if ($add) {
            $data['status'] = 200;
        }
    } else {
        $data = array(
            'status' => 400,
            'message' => 'Please fill all the required fields'
        );
    }
}
if ($first == 'select_currency') {
    if (!empty($_POST['currency']) && in_array($_POST['currency'], $pt->config->currency_array)) {
        $currency = PT_Secure($_POST['currency']);
        $db->where('name', 'payment_currency')->update(T_CONFIG, array('value' => $currency));
        if (in_array($_POST['currency'], $pt->paypal_currency)) {
            $db->where('name', 'paypal_currency')->update(T_CONFIG, array('value' => $currency));
        }
        if (in_array($_POST['currency'], $pt->checkout_currency)) {
            $db->where('name', 'checkout_currency')->update(T_CONFIG, array('value' => $currency));
        }
        if (in_array($_POST['currency'], $pt->stripe_currency)) {
            $db->where('name', 'stripe_currency')->update(T_CONFIG, array('value' => $currency));
        }
    }
    $data = array(
        'status' => 200
    );
}
if ($first == 'add_new_curreny') {
    $data = array(
        'status' => 400
    );
    if (!empty($_POST['currency']) && !empty($_POST['currency_symbol'])) {
        $pt->config->currency_array[] = PT_Secure($_POST['currency']);
        $pt->config->currency_symbol_array[PT_Secure($_POST['currency'])] = PT_Secure($_POST['currency_symbol']);
        $db->where('name', 'currency_array')->update(T_CONFIG, array('value' => serialize($pt->config->currency_array)));
        $db->where('name', 'currency_symbol_array')->update(T_CONFIG, array('value' => serialize($pt->config->currency_symbol_array)));
        $data = array(
            'status' => 200
        );
    }

}
if ($first == 'edit_curreny') {
    if (!empty($_POST['currency']) && !empty($_POST['currency_symbol']) && in_array($_POST['currency_id'], array_keys($pt->config->currency_array))) {
        $pt->config->currency_array[$_POST['currency_id']] = PT_Secure($_POST['currency']);
        $pt->config->currency_symbol_array[PT_Secure($_POST['currency'])] = PT_Secure($_POST['currency_symbol']);
        $db->where('name', 'currency_array')->update(T_CONFIG, array('value' => serialize($pt->config->currency_array)));
        $db->where('name', 'currency_symbol_array')->update(T_CONFIG, array('value' => serialize($pt->config->currency_symbol_array)));
        $data = array(
            'status' => 200
        );
    }

}
if ($first == 'remove__curreny') {
    if (!empty($_POST['currency'])) {
        if (in_array($_POST['currency'], $pt->config->currency_array)) {
            foreach ($pt->config->currency_array as $key => $currency) {
                if ($currency == $_POST['currency']) {
                    if (in_array($currency,array_keys($pt->config->currency_symbol_array))) {
                        unset($pt->config->currency_symbol_array[$currency]);
                    }
                    unset($pt->config->currency_array[$key]);
                }
            }
            if ($pt->config->payment_currency == $_POST['currency']) {
                if (!empty($pt->config->currency_array)) {
                    $db->where('name', 'payment_currency')->update(T_CONFIG, array('value' => reset($pt->config->currency_array)));
                }
            }
            $db->where('name', 'currency_array')->update(T_CONFIG, array('value' => serialize($pt->config->currency_array)));
            $db->where('name', 'currency_symbol_array')->update(T_CONFIG, array('value' => serialize($pt->config->currency_symbol_array)));
        }
    }
    $data = array(
        'status' => 200
    );
}
if ($first == 'remove_multi_curreny') {
    if (!empty($_POST['ids'])) {
        foreach ($_POST['ids'] as $key => $value) {
            if (in_array($value, $pt->config->currency_array)) {
                foreach ($pt->config->currency_array as $key2 => $currency) {
                    if ($currency == $value) {
                        if (in_array($currency,array_keys($pt->config->currency_symbol_array))) {
                            unset($pt->config->currency_symbol_array[$currency]);
                        }
                        unset($pt->config->currency_array[$key2]);
                    }
                }
                if ($pt->config->payment_currency == $value) {
                    if (!empty($pt->config->currency_array)) {
                        $db->where('name', 'payment_currency')->update(T_CONFIG, array('value' => reset($pt->config->currency_array)));
                    }
                }
                $db->where('name', 'currency_array')->update(T_CONFIG, array('value' => serialize($pt->config->currency_array)));
                $db->where('name', 'currency_symbol_array')->update(T_CONFIG, array('value' => serialize($pt->config->currency_symbol_array)));
            }
        }
    }
    $data = array(
        'status' => 200
    );
}
if ($first == 'remove_multi_lang') {
    if (!empty($_POST['ids'])) {
        foreach ($_POST['ids'] as $key => $value) {
            if (in_array($value, $langs)) {
                $lang_name = PT_Secure($value);
                $t_langs   = T_LANGS;
                $query     = mysqli_query($sqlConnect, "ALTER TABLE `$t_langs` DROP COLUMN `$lang_name`");
                if ($query) {
                    if (file_exists("assets/langs/$lang_name.php")) {
                        unlink("assets/langs/$lang_name.php");
                    }
                }
            }
        }
        $data = ['status' => 200];
    }
}
if ($first == 'remove_multi_fields') {
    if (!empty($_POST['ids'])) {
        foreach ($_POST['ids'] as $key => $value) {
            pt_delete_field(PT_Secure($value));
        }
        $data = ['status' => 200];
    }
}
if ($first == 'delete-multi-report') {
    if (!empty($_POST['ids']) && !empty($_POST['type']) && in_array($_POST['type'], array('safe','delete'))) {
        foreach ($_POST['ids'] as $key => $value) {
            if (is_numeric($value) && $value > 0) {
                $report_id = PT_Secure($value);
                $report_data  = $db->where('id',$report_id)->getOne(T_REPORTS);
                if ($_POST['type'] == 'delete') {
                    $del = PT_DeleteVideo($report_data->video_id);
                    if ($del) {
                        $data['status'] = 200;
                        $db->where('id',$report_id)->delete(T_REPORTS);
                    }
                }
                elseif ($_POST['type'] == 'safe') {
                    $db->where('id',$report_id)->delete(T_REPORTS);
                }
            }
        }
        $data = ['status' => 200];
    }
}
if ($first == 'remove_multi_invitation') {
    if (!empty($_POST['ids'])) {
        foreach ($_POST['ids'] as $key => $value) {
            if (is_numeric($value)) {
                $id = PT_Secure($value);
                $db->where('id',$id)->delete(T_INVITATIONS);
            }
        }
        $data = ['status' => 200];
    }
}
if ($first == 'remove_multi_copy') {
    if (!empty($_POST['ids'])) {
        foreach ($_POST['ids'] as $key => $value) {
            if (is_numeric($value)) {
                $id = PT_Secure($value);
                $db->where('id',$id)->delete(T_COPYRIGHT);
            }
        }
        $data = ['status' => 200];
    }
}
if ($first == 'remove_multi_page') {
    if (!empty($_POST['ids'])) {
        foreach ($_POST['ids'] as $key => $value) {
            if (is_numeric($value)) {
                $id = PT_Secure($value);
                $db->where('id',$id)->delete(T_CUSTOM_PAGES);
            }
        }
        $data = ['status' => 200];
    }
}
if ($first == 'remove_multi_activity') {
    if (!empty($_POST['ids'])) {
        foreach ($_POST['ids'] as $key => $value) {
            if (!empty($value) && is_numeric($value)) {
                $article = $db->where('id',PT_Secure($value))->getOne(T_ACTIVITES);
                if (!empty($article)) {
                    $s3      = ($pt->config->s3_upload == 'on' || $pt->config->ftp_upload = 'on' || $pt->config->spaces == 'on') ? true : false;
                    if (file_exists($article->image)) {
                        unlink($article->image);
                    }

                    else if ($s3 === true) {
                        PT_DeleteFromToS3($article->image);
                    }

                    $delete  = $db->where('id',PT_Secure($value))->delete(T_ACTIVITES);
                    $delete  = $db->where('activity_id',PT_Secure($value))->delete(T_DIS_LIKES);

                    //Delete related data
                    $post_comments = $db->where('activity_id',PT_Secure($value))->get(T_COMMENTS);

                    foreach ($post_comments as $comment_data) {
                        $delete    = $db->where('comment_id',$comment_data->id)->delete(T_COMMENTS_LIKES);
                        $replies   = $db->where('comment_id',$comment_data->id)->get(T_COMM_REPLIES);
                        $db->where('comment_id',$comment_data->id)->delete(T_COMM_REPLIES);

                        foreach ($replies as $comment_reply) {
                            $db->where('reply_id',$comment_reply->id)->delete(T_COMMENTS_LIKES);
                        }
                    }

                    if (!empty($post_comments)) {
                        $delete    = $db->where('activity_id',PT_Secure($value))->delete(T_COMMENTS);
                    }
                }
            }
        }
        $data = ['status' => 200];
    }
}
if ($first == 'remove_multi_ban') {
    if (!empty($_POST['ids'])) {
        foreach ($_POST['ids'] as $key => $value) {
            if (is_numeric($value)){
                $table  = T_BANNED_IPS;
                $ban_id = PT_Secure($value);
                $db->where('id',$ban_id)->delete($table);
            }
        }
        $data = ['status' => 200];
    }
}
if ($first == 'remove_multi_ad') {
    if (!empty($_POST['ids'])) {
        foreach ($_POST['ids'] as $key => $value) {
            if (is_numeric($value)) {
                $delete = $db->where('id', PT_Secure($value))->delete(T_VIDEO_ADS);
            }
        }
        $data = ['status' => 200];
    }
}
if ($first == 'remove_multi_user_ad') {
    if (!empty($_POST['ids'])) {
        foreach ($_POST['ids'] as $key => $value) {
            if (is_numeric($value)) {
                $ad_data = $db->where('id',PT_Secure($value))->getOne(T_USR_ADS);
                if (!empty($ad_data)) {
                    $s3      = ($pt->config->s3_upload == 'on' || $pt->config->ftp_upload = 'on' || $pt->config->spaces == 'on') ? true : false;
                    if (file_exists($ad_data->media)) {
                        unlink($ad_data->media);
                    }

                    else if ($s3 === true) {
                        PT_DeleteFromToS3($ad_data->media);
                    }

                    $delete  = $db->where('id',PT_Secure($value))->delete(T_USR_ADS);
                }
            }
        }
        $data = ['status' => 200];
    }
}
if ($first == 'delete-multi-article') {
    if (!empty($_POST['ids']) && !empty($_POST['type']) && in_array($_POST['type'], array('activate','deactivate','delete'))) {
        foreach ($_POST['ids'] as $key => $value) {
            if (is_numeric($value) && $value > 0) {
                $article = $db->where('id',PT_Secure($value))->getOne(T_POSTS);
                if ($_POST['type'] == 'delete') {

                    if (!empty($article)) {
                        $s3      = ($pt->config->s3_upload == 'on' || $pt->config->ftp_upload == 'on' || $pt->config->spaces == 'on') ? true : false;
                        if (file_exists($article->image)) {
                            unlink($article->image);
                        }

                        else if ($s3 === true) {
                            PT_DeleteFromToS3($article->image);
                        }

                        $delete  = $db->where('id',PT_Secure($value))->delete(T_POSTS);
                        $delete  = $db->where('post_id',PT_Secure($value))->delete(T_DIS_LIKES);

                        //Delete related data
                        $post_comments = $db->where('post_id',PT_Secure($value))->get(T_COMMENTS);

                        foreach ($post_comments as $comment_data) {
                            $delete    = $db->where('comment_id',$comment_data->id)->delete(T_COMMENTS_LIKES);
                            $replies   = $db->where('comment_id',$comment_data->id)->get(T_COMM_REPLIES);
                            $db->where('comment_id',$comment_data->id)->delete(T_COMM_REPLIES);

                            foreach ($replies as $comment_reply) {
                                $db->where('reply_id',$comment_reply->id)->delete(T_COMMENTS_LIKES);
                            }
                        }

                        if (!empty($post_comments)) {
                            $delete    = $db->where('post_id',PT_Secure($value))->delete(T_COMMENTS);
                        }
                    }
                }
                elseif ($_POST['type'] == 'activate') {
                    if (!empty($article)) {
                        $db->where('id',PT_Secure($value))->update(T_POSTS,array('active' => '1'));
                    }
                }
                elseif ($_POST['type'] == 'deactivate') {
                    if (!empty($article)) {
                        $db->where('id',PT_Secure($value))->update(T_POSTS,array('active' => '0'));
                    }
                }
            }
        }
        $data = ['status' => 200];
    }
}
if ($first == 'delete-multi-payment') {
    if (!empty($_POST['ids']) && !empty($_POST['type']) && in_array($_POST['type'], array('paid','declined','delete'))) {
        foreach ($_POST['ids'] as $key => $value) {
            if (is_numeric($value) && $value > 0) {
                $value = PT_Secure($value);
                $request_data = $db->where('id',$value)->getOne(T_WITHDRAWAL_REQUESTS);
                if ($_POST['type'] == 'delete') {
                    $db->where('id',$value)->delete(T_WITHDRAWAL_REQUESTS);
                }
                elseif ($_POST['type'] == 'paid') {
                    if (!empty($request_data) && $request_data->status != 1) {
                        $requiring = $db->where('id',$request_data->user_id)->getOne(T_USERS);
                        if (!empty($requiring)) {
                            $db->where('id',$request_data->user_id)->update(T_USERS,array(
                                'balance' => ($requiring->balance -= $request_data->amount)
                            ));
                        }
                    }

                    $db->where('id',$value)->update(T_WITHDRAWAL_REQUESTS,array('status' => 1));
                }
                elseif ($_POST['type'] == 'declined') {
                    $db->where('id',$value)->update(T_WITHDRAWAL_REQUESTS,array('status' => 2));
                }
            }
        }
        $data = ['status' => 200];
    }
}
if ($first == 'remove_multi_category') {
    if (!empty($_POST['ids'])) {
        foreach ($_POST['ids'] as $key => $value) {
            if ($value != 'other') {
                $db->where('lang_key',PT_Secure($value))->delete(T_LANGS);
                $db->where('type',PT_Secure($value))->delete(T_LANGS);
                $db->where('category_id',PT_Secure($value))->update(T_VIDEOS,array('sub_category' => '',
                    'category_id' => 'other'));
            }
        }
        $data = ['status' => 200];
    }

}
if ($first == 'remove_multi_category_') {
    if (!empty($_POST['ids'])) {
        foreach ($_POST['ids'] as $key => $value) {
            if ($value != 'other') {
                $db->where('lang_key',PT_Secure($value))->delete(T_LANGS);
                $db->where('type',PT_Secure($value))->delete(T_LANGS);
                $db->where('category_id',PT_Secure($value))->update(T_VIDEOS,array('sub_category' => '',
                    'category_id' => 'other'));
            }
        }
        $data = ['status' => 200];
    }

}
if ($first == 'remove_multi_sub_category') {
    if (!empty($_POST['ids'])) {
        foreach ($_POST['ids'] as $key => $value) {
            if (!empty($value)) {
                if ($value != 'other') {
                    $db->where('lang_key',PT_Secure($value))->delete(T_LANGS);
                    $db->where('sub_category',PT_Secure($value))->update(T_VIDEOS,array('sub_category' => ''));
                }
            }
        }
        $data = ['status' => 200];
    }

}
if ($first == 'remove_multi_comment') {
    if (!empty($_POST['ids'])) {
        foreach ($_POST['ids'] as $key => $value) {
            if (!empty($value)) {
                $id = PT_Secure($value);
                $comment_data = $db->where('id', $id)->getOne(T_COMMENTS);
                RegisterPoint($comment_data->video_id, "comments",'-',$comment_data->user_id);
                $delete_comment = $db->where('id', $id)->delete(T_COMMENTS);
                if ($delete_comment) {
                    $delete_comments_likes   = $db->where('comment_id', $id)->delete(T_COMMENTS_LIKES);
                    $comments_replies        = $db->where('comment_id', $id)->get(T_COMM_REPLIES);
                    $delete_comments_replies = $db->where('comment_id', $id)->delete(T_COMM_REPLIES);
                    if (!empty($comments_replies)) {
                        foreach ($comments_replies as $reply) {
                            $db->where('reply_id', $reply->id)->delete(T_COMMENTS_LIKES);
                        }
                    }
                }
            }
        }
        $data = ['status' => 200];
    }

}
if ($first == 'remove_multi_movie') {
    if (!empty($_POST['ids'])) {
        foreach ($_POST['ids'] as $key => $value) {
            if (is_numeric($value)) {
                $get_video = $db->where('id', PT_Secure($value))->getOne(T_VIDEOS);
                RegisterPoint($get_video->id, "upload",'-',$get_video->user_id);
                $delete = PT_DeleteVideo($get_video->id);
            }
        }
        $data = ['status' => 200];
    }

}
if ($first == 'delete_multi_monetization_request') {
    if (!empty($_POST['ids']) && !empty($_POST['type']) && in_array($_POST['type'], array('verify','delete'))) {
        foreach ($_POST['ids'] as $key => $value) {
            if (is_numeric($value) && $value > 0) {
                $request_id    = PT_Secure($value);
                $request_data  = $db->where('id',$request_id)->getOne(T_MON_REQUESTS);
                if ($_POST['type'] == 'delete') {
                    $notif_data = array(
                        'notifier_id' => $pt->user->id,
                        'recipient_id' => $request_data->user_id,
                        'type' => 'monetization_decline',
                        'url' => "settings/monetization",
                        'time' => time()
                    );
                    pt_notify($notif_data);

                    if (file_exists($request_data->personal_photo)) {
                        @unlink(trim($request_data->personal_photo));
                    }
                    else if($pt->config->s3_upload == 'on' || $pt->config->ftp_upload == 'on' || $pt->config->spaces == 'on'){
                        @PT_DeleteFromToS3($request_data->personal_photo);
                    }

                    if (file_exists($request_data->id_photo)) {
                        @unlink(trim($request_data->id_photo));
                    }
                    else if($pt->config->s3_upload == 'on' || $pt->config->ftp_upload == 'on' || $pt->config->spaces == 'on'){
                        @PT_DeleteFromToS3($request_data->id_photo);
                    }
                    $db->where('id',$request_id)->delete(T_MON_REQUESTS);
                }
                elseif ($_POST['type'] == 'verify') {
                    $up_data = array(
                        'monetization' => 1
                    );

                    $db->where('id',$request_data->user_id)->update(T_USERS,$up_data);
                    if (file_exists($request_data->personal_photo)) {
                        @unlink(trim($request_data->personal_photo));
                    }
                    else if($pt->config->s3_upload == 'on' || $pt->config->ftp_upload == 'on' || $pt->config->spaces == 'on'){
                        @PT_DeleteFromToS3($request_data->personal_photo);
                    }

                    if (file_exists($request_data->id_photo)) {
                        @unlink(trim($request_data->id_photo));
                    }
                    else if($pt->config->s3_upload == 'on' || $pt->config->ftp_upload == 'on' || $pt->config->spaces == 'on'){
                        @PT_DeleteFromToS3($request_data->id_photo);
                    }
                    $db->where('id',$request_id)->delete(T_MON_REQUESTS);

                    $notif_data = array(
                        'notifier_id' => $pt->user->id,
                        'recipient_id' => $request_data->user_id,
                        'type' => 'monetization_accept',
                        'url' => "settings/monetization",
                        'time' => time()
                    );
                    pt_notify($notif_data);
                }
            }
        }
        $data = ['status' => 200];
    }
}
if ($first == 'delete_multi_request') {
    if (!empty($_POST['ids']) && !empty($_POST['type']) && in_array($_POST['type'], array('verify','delete'))) {
        foreach ($_POST['ids'] as $key => $value) {
            if (is_numeric($value) && $value > 0) {
                if ($_POST['type'] == 'delete') {
                    $db->where('id',PT_Secure($value))->delete(T_VERIF_REQUESTS);
                }
                elseif ($_POST['type'] == 'verify') {
                    $request_data  = $db->where('id',PT_Secure($value))->getOne(T_VERIF_REQUESTS);
                    $up_data = array(
                        'verified' => 1
                    );

                    $db->where('id',$request_data->user_id)->update(T_USERS,$up_data);
                    $db->where('id',PT_Secure($value))->delete(T_VERIF_REQUESTS);
                }
            }
        }
        $data = ['status' => 200];
    }
}
if ($first == 'delete-multi-videos') {
    if (!empty($_POST['ids']) && !empty($_POST['type']) && in_array($_POST['type'], array('approve','disapprove','delete'))) {
        foreach ($_POST['ids'] as $key => $value) {
            if (is_numeric($value) && $value > 0) {
                if ($_POST['type'] == 'delete') {
                    $delete = PT_DeleteVideo(PT_Secure($value));
                }
                elseif ($_POST['type'] == 'approve') {
                    $update_to = 1;
                    $db->where('id', PT_Secure($value))->update(T_VIDEOS, array('approved' => $update_to));
                }
                elseif ($_POST['type'] == 'disapprove') {
                    $update_to = 0;
                    $db->where('id', PT_Secure($value))->update(T_VIDEOS, array('approved' => $update_to));
                }
            }
        }
        $data = ['status' => 200];
    }
}
if ($first == 'delete_multi_users') {
    if (!empty($_POST['ids']) && !empty($_POST['type']) && in_array($_POST['type'], array('activate','deactivate','delete'))) {
        foreach ($_POST['ids'] as $key => $value) {
            if (is_numeric($value) && $value > 0) {
                if ($_POST['type'] == 'delete') {
                    $delete = PT_DeleteUser(PT_Secure($value));
                }
                elseif ($_POST['type'] == 'activate') {
                    $db->where('id', PT_Secure($value));

                    $update_data = array('active' => 1,'email_code' => '');
                    $update = $db->update(T_USERS, $update_data);
                }
                elseif ($_POST['type'] == 'deactivate') {
                    $db->where('id', PT_Secure($value));

                    $update_data = array('active' => 0,'email_code' => '');
                    $update = $db->update(T_USERS, $update_data);
                }
            }
        }
        $data = ['status' => 200];
    }
}
if ($first == 'delete_receipt') {
    if (!empty($_GET['receipt_id'])) {
        $user_id = PT_Secure($_GET['user_id']);
        $id = PT_Secure($_GET['receipt_id']);
        $photo_file = PT_Secure($_GET['receipt_file']);
        $receipt = $db->where('id',$id)->getOne('bank_receipts',array('*'));

        $notif_data = array(
            'notifier_id' => $pt->user->id,
            'recipient_id' => $receipt->user_id,
            'type' => 'bank_decline',
            'url' => "",
            'time' => time()
        );
        pt_notify($notif_data);

        $db->where('id',$id)->delete('bank_receipts');
        if (file_exists($photo_file)) {
            @unlink(trim($photo_file));
        }
        else if($pt->config->s3_upload == 'on' || $pt->config->ftp_upload == 'on' || $pt->config->spaces == 'on'){
            @PT_DeleteFromToS3($photo_file);
        }
        $data = array(
            'status' => 200
        );
    }
}


if ($first == 'approve_receipt') {
    if (!empty($_GET['receipt_id'])) {
        $id = PT_Secure($_GET['receipt_id']);
        $receipt = $db->where('id',$id)->getOne('bank_receipts',array('*'));

        if($receipt){
            $updated = $db->where('id',$id)->update('bank_receipts',array('approved'=>1,'approved_at'=>time()));
            if ($updated === true) {
                if ($receipt->mode == 'wallet') {
                    $amount = $receipt->price;
                    $user = PT_UserData($receipt->user_id);

                    $update  = array('wallet' => ($user->wallet += $amount));
                    $db->where('id',$user->id)->update(T_USERS,$update);
                    $payment_data         = array(
                        'user_id' => $user->id,
                        'paid_id'  => $user->id,
                        'admin_com'    => 0,
                        'currency'    => $pt->config->payment_currency,
                        'time'  => time(),
                        'amount' => $amount,
                        'type' => 'ad'
                    );
                    $db->insert(T_VIDEOS_TRSNS,$payment_data);


                    //$result = mysqli_query($sqlConnect, "UPDATE " . T_USERS . " SET `wallet` = `wallet` + " . $amount . " WHERE `user_id` = '" . $receipt->user_id . "'");
                    // if ($result) {
                    //     $create_payment_log = mysqli_query($sqlConnect, "INSERT INTO " . T_PAYMENT_TRANSACTIONS . " (`userid`, `kind`, `amount`, `notes`) VALUES ('" . $receipt->user_id . "', 'WALLET', '" . $amount . "', 'bank receipts')");
                    // }
                    $notif_data = array(
                        'notifier_id' => $pt->user->id,
                        'recipient_id' => $receipt->user_id,
                        'type' => 'bank_wallet',
                        'url' => "ads",
                        'time' => time()
                    );
                    pt_notify($notif_data);
                }
                elseif (($receipt->mode == 'pay' || $receipt->mode == 'rent') && !empty($receipt->video_id)) {
                    $video = PT_GetVideoByID($receipt->video_id, 0,0,2);
                    $notify_sent = false;
                    if (!empty($video->is_movie)) {

                        $payment_data         = array(
                            'user_id' => $video->user_id,
                            'video_id'    => $video->id,
                            'paid_id'  => $receipt->user_id,
                            'admin_com'    => 0,
                            'currency'    => $pt->config->payment_currency,
                            'time'  => time()
                        );
                        if (!empty($receipt->mode) && $receipt->mode == 'rent') {
                            $payment_data['type'] = 'rent';
                            $total = $video->rent_price;
                        }
                        else{
                            $total = $video->sell_video;
                        }

                        $payment_data['amount'] = $total;
                        $db->insert(T_VIDEOS_TRSNS,$payment_data);
                    }
                    else{
                        $payment_currency = $pt->config->payment_currency;

                        if (!empty($receipt->mode) && $receipt->mode == 'rent') {
                            $admin__com = $pt->config->admin_com_rent_videos;
                            if ($pt->config->com_type == 1) {
                                $admin__com = ($pt->config->admin_com_rent_videos * $video->rent_price)/100;
                                $payment_currency = $pt->config->payment_currency.'_PERCENT';
                            }
                            $payment_data         = array(
                                'user_id' => $video->user_id,
                                'video_id'    => $video->id,
                                'paid_id'  => $receipt->user_id,
                                'amount'    => $video->rent_price,
                                'admin_com'    => $pt->config->admin_com_rent_videos,
                                'currency'    => $payment_currency,
                                'time'  => time(),
                                'type' => 'rent'
                            );
                            $balance = $video->rent_price - $admin__com;
                        }
                        else{
                            $admin__com = $pt->config->admin_com_sell_videos;
                            if ($pt->config->com_type == 1) {
                                $admin__com = ($pt->config->admin_com_sell_videos * $video->sell_video)/100;
                                $payment_currency = $pt->config->payment_currency.'_PERCENT';
                            }

                            $payment_data         = array(
                                'user_id' => $video->user_id,
                                'video_id'    => $video->id,
                                'paid_id'  => $receipt->user_id,
                                'amount'    => $video->sell_video,
                                'admin_com'    => $pt->config->admin_com_sell_videos,
                                'currency'    => $payment_currency,
                                'time'  => time()
                            );
                            $balance = $video->sell_video - $admin__com;

                        }

                        // $admin__com = $pt->config->admin_com_sell_videos;
                        // $payment_currency = $pt->config->payment_currency;
                        // if ($pt->config->com_type == 1) {
                        //     $admin__com = ($pt->config->admin_com_sell_videos * $video->sell_video)/100;
                        //     $payment_currency = $pt->config->payment_currency.'_PERCENT';
                        // }
                        // $payment_data         = array(
                        //     'user_id' => $video->user_id,
                        //     'video_id'    => $video->id,
                        //     'paid_id'  => $receipt->user_id,
                        //     'amount'    => $video->sell_video,
                        //     'admin_com'    => $pt->config->admin_com_sell_videos,
                        //     'currency'    => $payment_currency,
                        //     'time'  => time()
                        // );
                        $db->insert(T_VIDEOS_TRSNS,$payment_data);
                        //$balance = $video->sell_video - $admin__com;
                        $db->rawQuery("UPDATE ".T_USERS." SET `balance` = `balance`+ '".$balance."' , `verified` = 1 WHERE `id` = '".$video->user_id."'");
                    }
                    if ($notify_sent == false) {
                        $uniq_id = $video->video_id;
                        $notif_data = array(
                            'notifier_id' => $pt->user->id,
                            'recipient_id' => $video->user_id,
                            'type' => 'paid_to_see',
                            'url' => "watch/$uniq_id",
                            'video_id' => $video->id,
                            'time' => time()
                        );

                        pt_notify($notif_data);
                    }

                    $notif_data = array(
                        'notifier_id' => $pt->user->id,
                        'recipient_id' => $receipt->user_id,
                        'type' => 'bank_wallet',
                        'url' => "watch/$uniq_id",
                        'time' => time()
                    );
                    pt_notify($notif_data);
                }
                elseif ($receipt->mode == 'subscribe' && !empty($receipt->profile_id)) {
                    $user_id = $receipt->profile_id;
                    $user = PT_UserData($user_id);
                    $notifier_data = PT_UserData($receipt->user_id);
                    $admin__com = ($pt->config->admin_com_subscribers * $user->subscriber_price)/100;
                    $payment_currency = $pt->config->payment_currency.'_PERCENT';
                    $payment_data         = array(
                        'user_id' => $user_id,
                        'video_id'    => 0,
                        'paid_id'  => $receipt->user_id,
                        'amount'    => $user->subscriber_price,
                        'admin_com'    => $pt->config->admin_com_subscribers,
                        'currency'    => $payment_currency,
                        'time'  => time(),
                        'type' => 'subscribe'
                    );
                    $db->insert(T_VIDEOS_TRSNS,$payment_data);
                    $balance = $user->subscriber_price - $admin__com;
                    $db->rawQuery("UPDATE ".T_USERS." SET `balance` = `balance`+ '".$balance."' WHERE `id` = '".$user_id."'");
                    $insert_data         = array(
                        'user_id' => $user_id,
                        'subscriber_id' => $receipt->user_id,
                        'time' => time(),
                        'active' => 1
                    );
                    $create_subscription = $db->insert(T_SUBSCRIPTIONS, $insert_data);
                    if ($create_subscription) {

                        $notif_data = array(
                            'notifier_id' => $receipt->user_id,
                            'recipient_id' => $user_id,
                            'type' => 'subscribed_u',
                            'url' => ('@' . $notifier_data->username),
                            'time' => time()
                        );

                        pt_notify($notif_data);
                    }
                    $notif_data = array(
                        'notifier_id' => $pt->user->id,
                        'recipient_id' => $receipt->user_id,
                        'type' => 'bank_pro',
                        'url' => ('@' . $user->username),
                        'time' => time()
                    );
                    pt_notify($notif_data);

                    $data['status'] = 200;
                }
                else{
                    $sum          = intval($pt->config->pro_pkg_price);
                    $update = array('is_pro' => 1,'verified' => 1);
                    $go_pro = $db->where('id',$receipt->user_id)->update(T_USERS,$update);
                    if ($go_pro === true) {
                        $payment_data         = array(
                            'user_id' => $receipt->user_id,
                            'type'    => 'pro',
                            'amount'  => $sum,
                            'date'    => date('n') . '/' . date('Y'),
                            'expire'  => strtotime("+30 days")
                        );

                        $db->insert(T_PAYMENTS,$payment_data);
                        $db->where('user_id',$receipt->user_id)->update(T_VIDEOS,array('featured' => 1));
                        $_SESSION['upgraded'] = true;
                        $notif_data = array(
                            'notifier_id' => $pt->user->id,
                            'recipient_id' => $receipt->user_id,
                            'type' => 'bank_pro',
                            'url' => "go_pro",
                            'time' => time()
                        );
                        pt_notify($notif_data);
                    }
                }
                $data = array(
                    'status' => 200
                );
            }
        }
        $data = array(
            'status' => 200,
            'data' => $receipt
        );
    }
}

if ($first == 'test_message') {
    $send_message_data = array(
        'from_email' => $pt->config->email,
        'from_name' => $pt->config->name,
        'to_email' => $pt->config->email,
        'to_name' => $pt->user->name,
        'subject' => 'Test Message From ' . $pt->config->name,
        'charSet' => 'utf-8',
        'message_body' => 'If you can see this message, then your SMTP configuration is working fine.',
        'is_html' => false
    );
    $send_message      = PT_SendMessage($send_message_data);
    if ($send_message === true) {
        $data['status'] = 200;
    } else {
        $data['status'] = 400;
        $data['error']  = "Error found while sending the email, the information you provided are not correct, please test the email settings on your local device and make sure they are correct. ";
    }
}

if ($first == 'fake_views_likes') {
    if (!empty($_POST['video_id']) && is_numeric($_POST['video_id']) && $_POST['video_id'] > 0) {
        if ($_POST['views'] <= 10000 && $_POST['likes'] <= 10000) {
            $video = PT_GetVideoByID(PT_Secure($_POST['video_id']), 0, 0 , 2);
            if (!empty($video) && (!empty($_POST['views']) || !empty($_POST['likes']))) {
                PT_RunInBackground(array('status' => 200));
                if (!empty($_POST['views']) && is_numeric($_POST['views']) && $_POST['views'] > 0) {

                    $sql="INSERT INTO ".T_VIEWS." (`video_id`, `time`) VALUES ";

                    for($i = 0; $i < $_POST['views']; $i++){
                        $sql.="('{$video->id}', '".time()."'),";
                    }

                    $sql = rtrim($sql, ",");
                    $db->rawQuery($sql);
                    $db->where('id', $video->id)->update(T_VIDEOS, array('views' => $db->inc(PT_Secure($_POST['views']))));
                }

                if (!empty($_POST['likes']) && is_numeric($_POST['likes']) && $_POST['likes'] > 0) {

                    $sql="INSERT INTO ".T_DIS_LIKES." (`video_id`, `time`,`type`) VALUES ";

                    for($i = 0; $i < $_POST['likes']; $i++){
                        $sql.="('{$video->id}', '".time()."','1'),";
                    }

                    $sql = rtrim($sql, ",");
                    $db->rawQuery($sql);
                }
                $data['status'] = 200;

            }
            else{
                $data['message'] = $lang->please_check_details;
            }
        }
        else{
            $data['message'] = "Views or Likes can not be more than 10000";
        }
    }
    else{
        $data['message'] = $lang->please_check_details;
    }
}

if ($first == 'get_users') {
    if (!empty($_POST['name'])) {
        $name = PT_Secure($_POST['name']);
        $user = $pt->user->id;
        $html = '';
        $users = $db->rawQuery("SELECT `id` FROM " . T_USERS . " WHERE `id` <> {$user} AND `active` = '1' AND `username`  LIKE '%$name%' LIMIT 25");
        if (!empty($users)) {
            foreach ($users as $key => $value) {
                $pt->user_data = PT_UserData($value->id);
                if (!empty($pt->user_data)) {
                    $html .= PT_LoadAdminPage('mass-notifications/list');
                }
            }
            $data['status'] = 200;
            $data['html'] = $html;
        }
    }
}

if ($first == 'mass_notifications') {
    $data  = array(
        'status' => 304,
        'message' => $lang->please_check_details
    );
    $error = false;
    $users = array();
    if (!isset($_POST['url']) || !isset($_POST['description'])) {
        $error = true;
    } else {
        if (!filter_var($_POST['url'], FILTER_VALIDATE_URL)) {
            $error = true;
        }
        if (strlen($_POST['description']) < 5 || strlen($_POST['description']) > 300) {
            $error = true;
        }
    }
    if (!$error) {
        $user = $pt->user->id;
        if (empty($_POST['notifc-users'])) {
            $users = array();
            $ids = $db->rawQuery("SELECT `id` FROM " . T_USERS . " WHERE `id` <> {$user} AND `active` = '1'");
            foreach ($ids as $key => $value) {
                $users[] = $value->id;
            }
        } elseif ($_POST['notifc-users'] && strlen($_POST['notifc-users']) > 0) {
            $users = explode(',', $_POST['notifc-users']);
        }
        $link  = PT_Secure($_POST['url']);
        $text  = PT_Secure($_POST['description']);
        $time  = time();
        $sql   = "INSERT INTO " . T_NOTIFICATIONS . " (`notifier_id`,`recipient_id`,`type`,`text`,`full_link`,`time`) VALUES ";
        $val   = array();

        foreach ($users as $user_id) {
            if ($user != $user_id) {
                $val[] = "('$user','$user_id','admin_notification','$text','$link','$time')";
            }
        }

        $query = mysqli_query($sqlConnect, ($sql . implode(',', $val)));

        $data = array(
            'status' => 200,
            'message' => $lang->notification_sent
        );
    }
}

if ($first == 'insert-invitation') {
    $time  = time();
    $code  = uniqid(rand(), true);
    $invitation_id = $db->insert(T_INVITATIONS,array('code' => $code,
        'posted' => $time));
    if (!empty($invitation_id)) {
        $pt->key_info = $db->where('id',$invitation_id)->getOne(T_INVITATIONS);
        $pt->key_info->url  = $pt->config->site_url . '/register?invite='.$code;
        $data['html']   = PT_LoadAdminPage('manage-invitation-keys/list');
        $data['status'] = 200;
    }
}

if ($first == 'rm-invitation') {
    if (!empty($_GET['id'])) {
        $id = PT_Secure($_GET['id']);
        $db->where('id',$id)->delete(T_INVITATIONS);
        $data['status'] = 200;
    }
}

if ($first == 'auto_friend') {
    if (!empty($_GET['users'])) {
        $save = $db->where('name', 'auto_subscribe')->update(T_CONFIG, array('value' => $_GET['users']));
        if ($save) {
            $data['status'] = 200;
        }
    }
    else{
        $save = $db->where('name', 'auto_subscribe')->update(T_CONFIG, array('value' => ''));
        if ($save) {
            $data['status'] = 200;
        }
    }
}

if ($first == 'auto_delete') {
    if (!empty($_GET['selected_type']) && $_GET['selected_type'] == 'keyword' && !empty($_GET['selected_keyword']) && !empty($_GET['selected_time']) && in_array($_GET['selected_time'], array('all','today','this_week','this_month','this_year'))) {
        $keyword = PT_Secure($_GET['selected_keyword']);
        if ($pt->config->total_videos > 1000000) {
            $where = "MATCH (title) AGAINST ('$keyword')";
        }
        else {
            $where = "(title LIKE '%$keyword%' OR tags LIKE '%$keyword%' OR description LIKE '%$keyword%')";
        }

        $time_start = '';
        $time_end = '';


        if ($_GET['selected_time'] == 'today') {
            $time_start = strtotime(date('M')." ".date('d').", ".date('Y')." 12:00am");
            $time_end = strtotime(date('M')." ".date('d').", ".date('Y')." 11:59pm");
        }
        if ($_GET['selected_time'] == 'this_week') {
            $time = strtotime(date('l').", ".date('M')." ".date('d').", ".date('Y'));

            if (date('l') == 'Saturday') {
                $time_start = strtotime(date('M')." ".date('d').", ".date('Y')." 12:00am");
            }
            else{
                $time_start = strtotime('last saturday, 12:00am', $time);
            }

            if (date('l') == 'Friday') {
                $time_end = strtotime(date('M')." ".date('d').", ".date('Y')." 11:59pm");
            }
            else{
                $time_end = strtotime('next Friday, 11:59pm', $time);
            }
        }
        if ($_GET['selected_time'] == 'this_month') {
            $time_start = strtotime("1 ".date('M')." ".date('Y')." 12:00am");
            $time_end = strtotime(cal_days_in_month(CAL_GREGORIAN, date('m'), date('Y'))." ".date('M')." ".date('Y')." 11:59pm");
        }
        if ($_GET['selected_time'] == 'this_year') {
            $time_start = strtotime("1 January ".date('Y')." 12:00am");
            $time_end = strtotime("31 December ".date('Y')." 11:59pm");
        }

        if ($_GET['selected_time'] != 'all' && !empty($time_start) && !empty($time_end)) {
            $where .= " AND time >= ".$time_start." AND time <= ".$time_end;
        }


        $videos = $db->where($where)->get(T_VIDEOS);
    }
    elseif (!empty($_GET['selected_type']) && $_GET['selected_type'] == 'category' && !empty($_GET['selected_category']) && in_array($_GET['selected_category'], array_keys(ToArray($pt->categories))) && !empty($_GET['selected_time']) && in_array($_GET['selected_time'], array('all','today','this_week','this_month','this_year'))) {

        $category_filter = PT_Secure($_GET['selected_category']);
        $where = "`category_id` = '$category_filter'";
        $time_start = '';
        $time_end = '';


        if ($_GET['selected_time'] == 'today') {
            $time_start = strtotime(date('M')." ".date('d').", ".date('Y')." 12:00am");
            $time_end = strtotime(date('M')." ".date('d').", ".date('Y')." 11:59pm");
        }
        if ($_GET['selected_time'] == 'this_week') {
            $time = strtotime(date('l').", ".date('M')." ".date('d').", ".date('Y'));

            if (date('l') == 'Saturday') {
                $time_start = strtotime(date('M')." ".date('d').", ".date('Y')." 12:00am");
            }
            else{
                $time_start = strtotime('last saturday, 12:00am', $time);
            }

            if (date('l') == 'Friday') {
                $time_end = strtotime(date('M')." ".date('d').", ".date('Y')." 11:59pm");
            }
            else{
                $time_end = strtotime('next Friday, 11:59pm', $time);
            }
        }
        if ($_GET['selected_time'] == 'this_month') {
            $time_start = strtotime("1 ".date('M')." ".date('Y')." 12:00am");
            $time_end = strtotime(cal_days_in_month(CAL_GREGORIAN, date('m'), date('Y'))." ".date('M')." ".date('Y')." 11:59pm");
        }
        if ($_GET['selected_time'] == 'this_year') {
            $time_start = strtotime("1 January ".date('Y')." 12:00am");
            $time_end = strtotime("31 December ".date('Y')." 11:59pm");
        }

        if ($_GET['selected_time'] != 'all' && !empty($time_start) && !empty($time_end)) {
            $where .= " AND time >= ".$time_start." AND time <= ".$time_end;
        }
        $videos = $db->where($where)->get(T_VIDEOS);
    }

    if (!empty($videos)) {
        $data = array('status' => 200);
        ob_end_clean();
        header("Content-Encoding: none");
        header("Connection: close");
        ignore_user_abort();
        ob_start();
        header('Content-Type: application/json');
        echo json_encode($data);
        $size = ob_get_length();
        header("Content-Length: $size");
        ob_end_flush();
        flush();
        session_write_close();
        if (is_callable('fastcgi_finish_request')) {
            fastcgi_finish_request();
        }
        foreach ($videos as $key => $video) {
            PT_DeleteVideo($video->id);
        }
    }
    else{
        $data = array('status' => 400);
    }
}

if ($first == 'test_s3_2') {
    try {
        $s3Client = S3Client::factory(array(
            'version' => 'latest',
            'region' => $pt->config->region_2,
            'credentials' => array(
                'key' => $pt->config->amazone_s3_key_2,
                'secret' => $pt->config->amazone_s3_s_key_2
            )
        ));

        $buckets  = $s3Client->listBuckets();
        $result   = $s3Client->putBucketCors(array(
            'Bucket' => $pt->config->bucket_name_2, // REQUIRED
            'CORSConfiguration' => array( // REQUIRED
                'CORSRules' => array( // REQUIRED
                    array(
                        'AllowedHeaders' => array(
                            'Authorization'
                        ),
                        'AllowedMethods' => array(
                            'POST',
                            'GET',
                            'PUT'
                        ), // REQUIRED
                        'AllowedOrigins' => array(
                            '*'
                        ), // REQUIRED
                        'ExposeHeaders' => array(),
                        'MaxAgeSeconds' => 3000
                    )
                )
            )
        ));
        if (!empty($buckets)) {
            if ($s3Client->doesBucketExist($pt->config->bucket_name_2)) {
                $data['status'] = 200;
            } else {
                $data['status'] = 300;
            }
        } else {
            $data['status'] = 500;
        }
    }

    catch (Exception $e) {
        $data['status']  = 400;
        $data['message'] = $e->getMessage();
    }
}
if ($first == 'newsletters') {
    if (!empty($_POST['subject']) && !empty($_POST['message'])) {
        $users = $db->where('newsletters',1)->get(T_USERS);
        if (!empty($users)) {
            PT_RunInBackground(array('status' => 300));
            foreach ($users as $key => $value) {
                $user = PT_UserData($value->id);
                $send_message_data = array(
                    'from_email' => $pt->config->email,
                    'from_name' => $pt->config->name,
                    'to_email' => $user->email,
                    'to_name' => $user->name,
                    'subject' => $_POST['subject'],
                    'charSet' => 'utf-8',
                    'message_body' => $_POST['message'],
                    'is_html' => false
                );
                $send_message      = PT_SendMessage($send_message_data);
            }
            $data['status'] = 200;
        }
        else{
            $data['status'] = 400;
            $data['message'] = 'there is no user subscribed to newsletters';
        }
    }
    else{
        $data['status'] = 400;
        $data['message'] = 'please check your details';
    }
}
if ($first == 'ReadNotify') {
    $db->where('recipient_id',0)->where('admin',1)->where('seen',0)->update(T_NOTIFICATIONS,array('seen' => time()));
}



// if ($first == 'save_edited_sub') {
//     $data['status'] = 400;
//     if ((!empty($_POST['sub_id']) && is_numeric($_POST['sub_id']) && $_POST['sub_id'] > 0) && !empty($_POST['text'])) {
//         $cat_id = PT_Secure($_POST['sub_id']);
//         $sub_name = PT_Secure($_POST['text']);
//         $db->where('id',$cat_id)->update(T_SUB_CATEGORIES,array('name' => $sub_name));
//         $data['status'] = 200;
//         $data['text'] = $sub_name;
//     }
// }
// if ($first == 'new-movie') {
//     if (PT_IsAdmin() == true) {
//         if (empty($_POST['name']) || empty($_POST['description']) || !isset($_FILES["cover"]["tmp_name"])) {
//             $error = $error_icon . $lang->please_check_details;
//             if (empty($_FILES["cover"]["tmp_name"]) || (!isset($_FILES["source"]["tmp_name"]) && empty($_POST['iframe']) && empty($_POST['other']))) {
//                 if (!empty($_FILES["cover"]["error"]) || !empty($_FILES["source"]["error"])) {
//                     $error = $error_icon . 'The file is too big, please increase your server upload limit in php.ini';
//                 } else {
//                     $error = $error_icon . $lang->please_check_details;
//                 }
//             }
//         } else {
//             if (strlen($_POST['name']) < 3) {
//                 $error = $error_icon . " Please enter a valid name";
//             }
//             if (empty($_POST['genre'])) {
//                 $error = $error_icon . " Please choose a genre";
//             }
//             if (empty($_POST['stars'])) {
//                 $error = $error_icon . "Please enter the names of the stars";
//             }
//             if (empty($_POST['producer'])) {
//                 $error = $error_icon . "Please enter the producer's name";
//             }
//             if (empty($_POST['country'])) {
//                 $error = $error_icon . $lang->please_check_details;
//             }
//             if (empty($_POST['quanlity'])) {
//                 $error = $error_icon . $lang->please_check_details;
//             }
//             if (empty($_POST['release']) || !is_numeric($_POST['release'])) {
//                 $error = $error_icon . "Please select movie release";
//             }
//             if (empty($_POST['duration']) || !is_numeric($_POST['duration'])) {
//                 $error = $error_icon . "Please select the duration of the movie";
//             }
//             if (strlen($_POST['description']) < 32) {
//                 $error = $error_icon . 'description should be more than 32 ';
//             }
//             if (!isset($_FILES["source"]) && empty($_POST['iframe']) && empty($_POST['other'])) {
//                 $error = $error_icon . " Please select movie";
//             }
//             if (!file_exists($_FILES["cover"]["tmp_name"])) {
//                 $error = $error_icon . " Select the cover to the movie";
//             }
//             if (empty($_POST['rating']) || !is_numeric($_POST['rating']) || $_POST['rating'] < 1 || $_POST['rating'] > 10) {
//                 $error = $error_icon . "Rating must be between 1 -> 10";
//             }
//         }
//         if (!empty($_FILES["cover"]["tmp_name"])) {
//             if (file_exists($_FILES["cover"]["tmp_name"])) {
//                 $cover = getimagesize($_FILES["cover"]["tmp_name"]);
//                 if ($cover[0] > 400 || $cover[1] > 570) {
//                     $error = $error_icon . " Cover size should not be more than 400x570 ";
//                 }
//             }
//         }
//         if (empty($error)) {
//             $registration_data = array(
//                 'name' =>  PT_Secure($_POST['name']),
//                 'genre' => PT_Secure($_POST['genre']),
//                 'stars' => PT_Secure($_POST['stars']),
//                 'producer' => PT_Secure($_POST['producer']),
//                 'country' => PT_Secure($_POST['country']),
//                 'release' => PT_Secure($_POST['release']),
//                 'quality' => PT_Secure($_POST['quanlity']),
//                 'duration' => PT_Secure($_POST['duration']),
//                 'description' => PT_Secure($_POST['description']),
//                 'iframe' => (!empty($_POST['iframe']) && pt_is_url($_POST['iframe'])) ? $_POST['iframe'] : '',
//                 'video' => (!empty($_POST['other']) && pt_is_url($_POST['other'])) ? $_POST['other'] : '',
//                 'rating' => PT_Secure($_POST['rating'])
//             );
//             $film_id = $db->insert(T_MOVIES,$registration_data);
//             if ($film_id && is_numeric($film_id)) {
//                 $update_film = array();
//                 if (!empty($_FILES["source"]["tmp_name"]) && empty($_POST['youtube']) && empty($_POST['other'])) {
//                     $fileInfo              = array(
//                         'file' => $_FILES["source"]["tmp_name"],
//                         'name' => $_FILES['source']['name'],
//                         'size' => $_FILES["source"]["size"],
//                         'type' => $_FILES["source"]["type"],
//                         'types' => 'mp4,mov,webm,flv'
//                     );
//                     $media                 = PT_ShareFile($fileInfo);
//                     $update_film['source'] = $media['filename'];
//                 }
//                 if (!empty($_FILES["cover"]["tmp_name"])) {
//                     $fileInfo             = array(
//                         'file' => $_FILES["cover"]["tmp_name"],
//                         'name' => $_FILES['cover']['name'],
//                         'size' => $_FILES["cover"]["size"],
//                         'type' => $_FILES["cover"]["type"],
//                         'types' => 'jpeg,jpg,png,bmp,gif',
//                         'compress' => false
//                     );
//                     $media                = PT_ShareFile($fileInfo);
//                     $update_film['cover'] = $media['filename'];
//                 }
//                 if (count($update_film) > 0) {
//                     $db->where('id',$film_id)->update(T_MOVIES,$update_film);
//                     $data = array(
//                         'status' => 200,
//                         'message' => $success_icon . ' New movie was successfully added'
//                     );
//                 }
//             }
//         } else {
//             $data = array(
//                 'status' => 500,
//                 'message' => $error
//             );
//         }
//     }
// }