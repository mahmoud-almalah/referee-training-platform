<?php
if (IS_LOGGED == false) {
    $data = array(
        'status' => 400,
        'error' => 'Not logged in'
    );
    echo json_encode($data);
    exit();
}
$data['status'] = 400;
if (!empty($_POST['user_id'])) {
    $id = PT_Secure($_POST['user_id']);
    $is_follower = $db->where('user_id', $id)->where('follower_id', $user->id)->getValue(T_FOLLOWERS, "count(*)");
    if ($is_follower > 0) {
        // if ($pt->config->payed_subscribers == 'on') {
        //     $check_if_payed = $db->where('user_id', $id)->where('paid_id', $user->id)->where('type','subscribe')->getValue(T_VIDEOS_TRSNS, 'count(*)');
        //     if ($check_if_payed > 0) {
        //         $db->where('user_id', $id)->where('paid_id', $user->id)->where('type','subscribe')->delete(T_VIDEOS_TRSNS);
        //     }
        // }
        $delete_sub = $db->where('user_id', $id)->where('follower_id', $user->id)->delete(T_FOLLOWERS);
        if ($delete_sub) {
            $data = array(
                'status' => 304
            );
        }

        $notif_data = array(
            'notifier_id' => $pt->user->id,
            'recipient_id' => $id,
            'type' => 'unfollow_u',
            'url' => ('@' . $pt->user->username),
            'time' => time()
        );

        pt_notify($notif_data);
    } 
    else {
            $insert_data = array(
                'user_id' => $id,
                'follower_id' => $user->id,
                'status' => 1,
                'time' => time(),
                'active' => 1
            );
            $create_subscription = $db->insert(T_FOLLOWERS, $insert_data);
            if ($create_subscription) {
                $data = array(
                    'status' => 200
                );

                $notif_data = array(
                    'notifier_id' => $pt->user->id,
                    'recipient_id' => $id,
                    'type' => 'follow_u',
                    'url' => ('@' . $pt->user->username),
                    'time' => time()
                );
                pt_notify($notif_data);
            }
    }
}