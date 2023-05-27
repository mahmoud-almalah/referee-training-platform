<div class="thumbs-container scroller-grid-content scroller-grid-content-1"
     id="scroller-grid-content">
    <?php
    $i = 1;
    foreach($pt->all_sidebar_videos as $video ){
        ?>
        <div class="video-thumb" id="video-thumb">
            <span class="video-index"><?php echo $i++; ?></span>
            <span class="video-time">{{DURATION}}</span>
            <a href="{{URL}}" data-load="?link1=watch&topic_id={{TOPIC_ID}}&id={{V_ID}}">
                <img src="{{THUMBNAIL}}" alt="{{TITLE}}"
                     style="width:168px;height:95px; border: 3px solid yellow;"
                >
            </a>
        </div>
    <?php } $i++; ?>
</div>


<div class="video-wrapper top-video-wrapper pt_video_side_vids" data-sidebar-video="{{ID}}">
    <div class="video-thumb">
        <a href="{{URL}}" data-load="?link1=watch&topic_id={{TOPIC_ID}}&id={{V_ID}}">
            <img src="{{THUMBNAIL}}" alt="{{TITLE}}">
            <div class="play_hover_btn" onmouseenter="show_gif(this,'{{GIF}}')" onmouseleave="hide_gif(this)"></div>
            <div class="video-duration">{{DURATION}}</div>
            <div class="video-duration" style="margin-right: 145px;">{{INDEX}}</div>
        </a>
    </div>
    <div class="yp_watch_sugg">
        <a href="{{URL}}" data-load="?link1=watch&topic_id={{TOPIC_ID}}&id={{V_ID}}">
            <div class="video-title">{{TITLE}}</div>
            <div class="video-publisher">{{USER_NAME}}</div>
            <div class="video-publisher">{{VIEWS}} {{LANG views}}</div>
        </a>
    </div>
</div>