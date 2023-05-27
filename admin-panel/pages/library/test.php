<?php
$allUsers = getUsers();
$allGroups = getUserGroups();
$getAllLibraries = getAllLibraries();
?>

<div class="container-fluid">
    <div>
        <h3>Manage Libraries</h3>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="{{LINK admin-cp}}">Dashboard</a>
                </li>
                <li class="breadcrumb-item active" aria-current="page">Manage Libraries</li>
            </ol>
        </nav>
    </div>

    <div id="alert-container"></div>

    <div class="row">
        <div class="col-lg-12 col-md-12">
            <div class="card">
                <div class="card-body">
                    <button class="btn btn-info pull-right" data-toggle="modal" data-target="#add-library">Add Library
                    </button>
                    <h6 class="card-title">All Libraries</h6>
                    <div class="btn-file d-flex align-items-center row">
                        <table class="table table-hover" id="sortable-table">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Thumb Image</th>
                                <th>Background Image</th>
                                <th>Channels</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <?php $i = 1; ?>
                            <?php
                            foreach ($getAllLibraries as $library) {
                                $status = ($library['status'] == 1) ? "checked" : "";
                                ?>
                                <tbody>
                                <tr id="<?php echo $library['sort_order']; ?>">
                                    <th scope="row"><?php echo $i; ?></th>
                                    <td><?php echo $library['name']; ?></td>
                                    <td>
                                        <a href="{{LINK backend/<?= $library['path']; ?>}}" target="_blank">
                                            <img src="{{LINK backend/<?= $library['path']; ?>}}" alt="" width="100"
                                                 height="75" class="img"/>
                                        </a>
                                    </td>
                                    <td>
                                        <a href="{{LINK backend/<?= $library['back_img']; ?>}}" target="_blank">
                                            <img src="{{LINK backend/<?= $library['back_img']; ?>}}" alt="" width="150"
                                                 height="75" class="img"/>
                                        </a>
                                    </td>
                                    <td>
                                        <a href="{{manage-channels?library_id=<?= $library['id'] ?>"
                                           class="btn btn-info">View Channels</a>
                                    </td>
                                    <td>
                                        <a class="btn bg-success admn_table_btn edit-library "
                                           rel="<?= $library['id'] ?>">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                 viewBox="0 0 24 24">
                                                <path fill="currentColor"
                                                      d="M20.71,7.04C21.1,6.65 21.1,6 20.71,5.63L18.37,3.29C18,2.9 17.35,2.9 16.96,3.29L15.12,5.12L18.87,8.87M3,17.25V21H6.75L17.81,9.93L14.06,6.18L3,17.25Z"></path>
                                            </svg>
                                            Edit</a>

                                        <button class="btn bg-danger delete_library admn_table_btn"
                                                rel="<?= $library['id'] ?>">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                 viewBox="0 0 24 24">
                                                <path fill="currentColor"
                                                      d="M19,4H15.5L14.5,3H9.5L8.5,4H5V6H19M6,19A2,2 0 0,0 8,21H16A2,2 0 0,0 18,19V7H6V19Z"></path>
                                            </svg>
                                            Delete
                                        </button>
                                    </td>
                                </tr>
                                </tbody>
                                <?php
                                $i++;
                            }
                            ?>
                        </table>
                        <span class="wait-wave"></span>
                    </div>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>

    <div class="modal fade" id="add-library" tabindex="-1" rel="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add Library</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form class="d-settings" id="library_form">
                        <input type="hidden" name="id" id="library-id" value="0">
                        <div class="form-group">
                            <label for="library-name">Library Name</label>
                            <input type="text" class="form-control" id="library-name" name="name"
                                   placeholder="Enter Library Name">
                        </div>
                        <div class="form-group">
                            <label for="select-group">Select Group</label>
                            <select class="form-control" id="select-group" name="group_id">
                                <option value="">Select Group</option>
                                <?php
                                foreach ($allGroups as $group) {
                                    ?>
                                    <option value="<?php echo $group['id']; ?>" data-ids="<?= $group['user_ids'] ?>" ><?php echo $group['name']; ?></option>
                                    <?php
                                }
                                ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="all-users">Select User</label>
                            <select class="form-control" id="all-users" name="user_ids[]" multiple>
                                <option value="">Select User</option>
                                <?php foreach ($allUsers as $user) { ?>
                                    <?php if ($user['id'] != $pt->user_session) { ?>

                                        <option value="<?php echo $user['id']; ?>"><?php echo $user['username']; ?></option>
                                    <?php }
                                } ?>
                            </select>
                        </div>
                        <div class="form-group d-none">
                            <label for="library-sort-order">Sort Order</label>
                            <input type="number" min="0" value="<?= $i ?>" name="sort_order" class="form-control"
                                   required id="library-sort-order"/>
                        </div>
                            <div class="form-group">
                                <label for="library-thumb">Thumb Image</label>
                                <div class="btn-file d-flex align-items-center">
                                    <div class="mr-3 change-file-ico">
                                        <div id="drag-and-drop-zone3">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                 viewBox="0 0 24 24">
                                                <path fill="currentColor"
                                                      d="M16.5,6V17.5A4,4 0 0,1 12.5,21.5A4,4 0 0,1 8.5,17.5V5A2.5,2.5 0 0,1 11,2.5A2.5,2.5 0 0,1 13.5,5V15.5A1,1 0 0,1 12.5,16.5A1,1 0 0,1 11.5,15.5V6H10V15.5A2.5,2.5 0 0,0 12.5,18A2.5,2.5 0 0,0 15,15.5V5A4,4 0 0,0 11,1A4,4 0 0,0 7,5V17.5A5.5,5.5 0 0,0 12.5,23A5.5,5.5 0 0,0 18,17.5V6H16.5Z"/>
                                            </svg>
                                            <input type="file" class="form-control" id="library-thumb" name="path"
                                                   title="Click to add Files">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="final-form1"></div>
                            <hr>
                            <div>
                                <ul class="list-unstyled p-2 d-flex flex-column col" id="file1">
                                    <li class="text-muted text-center empty">No file uploaded.</li>
                                </ul>
                            </div>
                            <div class="form-group">
                                <label for="library-back-img">Background Image</label>
                                <div class="btn-file d-flex align-items-center">
                                    <div class="mr-3 change-file-ico">
                                        <div id="drag-and-drop-zone2">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                 viewBox="0 0 24 24">
                                                <path fill="currentColor"
                                                      d="M16.5,6V17.5A4,4 0 0,1 12.5,21.5A4,4 0 0,1 8.5,17.5V5A2.5,2.5 0 0,1 11,2.5A2.5,2.5 0 0,1 13.5,5V15.5A1,1 0 0,1 12.5,16.5A1,1 0 0,1 11.5,15.5V6H10V15.5A2.5,2.5 0 0,0 12.5,18A2.5,2.5 0 0,0 15,15.5V5A4,4 0 0,0 11,1A4,4 0 0,0 7,5V17.5A5.5,5.5 0 0,0 12.5,23A5.5,5.5 0 0,0 18,17.5V6H16.5Z"/>
                                            </svg>
                                            <input type="file" class="form-control" id="back_img" name="back_img"
                                                   title="Click to add Files">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="final-form2"></div>
                            <hr>
                            <div>
                                <ul class="list-unstyled p-2 d-flex flex-column col" id="file2">
                                    <li class="text-muted text-center empty">No files uploaded.</li>
                                </ul>
                            </div>
                            <div class="form-group">
                                <label id="library-slider">Slider</label>
                                <div class="btn-file d-flex align-items-center">
                                    <div class="mr-3 change-file-ico">
                                        <div id="drag-and-drop-zone1">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                 viewBox="0 0 24 24">
                                                <path fill="currentColor"
                                                      d="M16.5,6V17.5A4,4 0 0,1 12.5,21.5A4,4 0 0,1 8.5,17.5V5A2.5,2.5 0 0,1 11,2.5A2.5,2.5 0 0,1 13.5,5V15.5A1,1 0 0,1 12.5,16.5A1,1 0 0,1 11.5,15.5V6H10V15.5A2.5,2.5 0 0,0 12.5,18A2.5,2.5 0 0,0 15,15.5V5A4,4 0 0,0 11,1A4,4 0 0,0 7,5V17.5A5.5,5.5 0 0,0 12.5,23A5.5,5.5 0 0,0 18,17.5V6H16.5Z"/>
                                            </svg>
                                            <input type="file" class="form-control" id="library-slider" name="slider[]"
                                                   title="Click to add Files" multiple>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="final-form3"></div>
                            <hr>
                            <div>
                                <ul class="list-unstyled p-2 d-flex flex-column col" id="file3">
                                    <li class="text-muted text-center empty">No files uploaded.</li>
                                </ul>
                            </div>
                        </form>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary m-t-15 waves-effect" form="library_form">Save
                            </button>
                        </div>
                </div>
            </div>
        </div>
    </div>
    <style type="text/css">
        .btn-file {
            position: relative;
            overflow: hidden;
            cursor: pointer;
        }

        .btn-file input[type=file] {
            position: absolute;
            top: 0;
            right: 0;
            min-width: 100%;
            min-height: 100%;
            font-size: 100px;
            text-align: right;
            opacity: 0;
            outline: none;
            background: #fff;
            cursor: inherit;
            display: block;
        }

        .change-file-ico svg {
            border-radius: 50%;
            background: rgb(2 154 214 / 15%);
            color: #029ad6;
            padding: 10px;
            width: 50px;
            height: 50px;
        }

        .change-file-input {
            padding: 3px 6px;
            border: 0;
            line-height: 1;
            background: rgb(0 0 0 / 10%);
            border-radius: 2em;
            font-size: 13px;
            width: 100%;
        }
    </style>

    <link href="<?php echo PT_LoadAdminLink('assets/css/jquery.dm-uploader.css'); ?>" rel="stylesheet"/>
    <script src="<?php echo PT_LoadAdminLink('assets/js/demo-config.js'); ?>"></script>
    <script src="<?php echo PT_LoadAdminLink('assets/js/demo-ui.js'); ?>"></script>
    <script src="<?php echo PT_LoadAdminLink('assets/js/jquery.dm-uploader.js'); ?>"></script>
    <script src="<?php echo PT_LoadAdminLink('assets/js/jquery.tablednd.js'); ?>"></script>

    <script type="text/html" id="files-template">
        <li class="media">
            <div class="media-body mb-1">
                <p class="mb-2">
                    <strong>%%filename%%</strong> - Status: <span class="text-muted">Waiting</span>
                </p>
                <div class="progress mb-2">
                    <div class="progress-bar progress-bar-striped progress-bar-animated bg-primary"
                         role="progressbar"
                         style="width: 0"
                         aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                    </div>
                </div>
            </div>
        </li>
    </script>

    <script>
        $(document).ready(function () {
            $('#add-library').on('hidden.bs.modal', function () {
                $('#library_form')[0].reset();
                $('#file1').html('<li class="text-muted text-center empty">No files uploaded.</li>');
                $('#file2').html('<li class="text-muted text-center empty">No files uploaded.</li>');
                $('#file3').html('<li class="text-muted text-center empty">No files uploaded.</li>');
                $('#finalfilesform1').html('')
                $('#finalfilesform2').html('')
                $('#finalfilesform3').html('')
            })

            $('#add-library').on('shown.bs.modal', function () {
                $('#all-users').select2();
            })

            $("#sortable-table").tableDnD({
                onDragStop: function (table, row) {

                    const rows = table.tBodies[0].rows;
                    const sort_order = [];
                    for (let i = 0; i < rows.length; i++) {
                        sort_order.push(rows[i].id);
                    }
                    $.ajax({
                        url: '{{LINK aj/ap/update-library-sorting}}',
                        type: 'post',
                        data: {sort_order: sort_order},
                        success: function (data) {
                            if (data.status === 200) {
                                $(table).find("tr").each(function (index) {
                                    if (index > 0) {
                                        $(this).find("th").html(index);
                                    }
                                });
                                $('#alert-container').html(`
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                Sort order has been updated successfully
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        `);
                            } else {
                                $('#alert-container').html(`
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                Unable to update sort order. Please refresh page and try again.
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        `);
                            }
                        }
                    });
                },
            });
        });
        $(document).ready(function () {
            $(document).on('change', '#all-groups', function () {

                let ids = $(this).find(':selected').data('ids')
                if (ids !== undefined) {
                    let users = ids.split(',');
                    $('#all-users').val(users).trigger('change');
                }
            })
        });
        $(function () {
            $(document).on('submit', '#library_form', function (e) {
                e.preventDefault();
                const form_data = $('#library_form').serialize();
                $.ajax({
                    url: '{{LINK aj/ap/add-library}}',
                    type: 'POST',
                    data: form_data,
                    processData: false,
                    contentType: false,
                    beforeSend: function () {
                        //$('#slider_form').find('.waves-effect').text('Please wait..');
                    },
                    success: function (data) {
                        if (data.status === 200) {
                            $('#name-error').html('');
                            if ($('#library-id').val() > 0) {
                                $('#alert-container').html(`
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                Library has been updated successfully
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        `);
                            } else {
                                $('#alert-container').html(`
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                Library has been added successfully
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        `);
                            }
                            $('#add-library').modal('hide');
                            setTimeout(() => {
                                location.reload();
                            }, 2000)
                        } else {
                            $('#alert-container').html(`
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            ${data.message}
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    `);
                            $('#add-library').modal('hide');
                        }
                    }
                });
            });
        });
        $(document).on('click', '.edit-library', function () {
            let library_id = $(this).attr('rel');

            $.ajax({
                url: '{{LINK aj/ap/get-library}}',
                type: 'GET',
                data: {library_id: library_id},

                beforeSend: function () {
                    //$('.wait-wave').text('Please wait..');
                },
                success: function (data) {
                    if (data.status === 200) {
                        let {name, sort_order, id, path, back_img} = data.payload;
                        let images = data.images;
                        let users = data.users;

                        $('#library-id').val(id);
                        $('#library-name').val(name);
                        $('#library-sort-order').val(sort_order);
                        $('#path').val(path);
                        $('#back_img').val(back_img);
                        $('#all-users').val(users).trigger('change');
                        $('#add-library').modal('show');

                        $('#final-form1').append(`<input type="hidden" name="finalfilesform1" value="${path}">`);
                        $('#final-form2').append(`<input type="hidden" name="finalfilesform2" value="${back_img}">`);
                        $('#file1').html(`
                            <li class="media">
                                <div class="media-body mb-1">
                                  <p class="mb-2">
                                    <strong>${path}</strong> - Status: <span class="status text-uploading">Uploaded</span>
                                  </p>
                                  <div class="progress mb-2">
                                    <div class="progress-bar progress-bar-striped progress-bar-animated bg-primary bg-" role="progressbar" style="width: 100%;" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">100%</div>
                                    </div>
                                </div>
                            </li>
                        `);
                        $('#file2').html(`
                             <li class="media">
                                <div class="media-body mb-1">
                                  <p class="mb-2">
                                    <strong>${back_img}</strong> - Status: <span class="status text-uploading">Uploaded</span>
                                  </p>
                                  <div class="progress mb-2">
                                    <div class="progress-bar progress-bar-striped progress-bar-animated bg-primary bg-" role="progressbar" style="width: 100%;" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">100%</div>
                                    </div>
                                </div>
                            </li>
                        `);

                        if (images.length > 0) {

                            images.map(image => {

                                $('#final-form3').append(`<input type="hidden" id='hidden-${image.id}' class="dm-images" name="simage[]" value="${image.image}">`);

                                $('#file3').append(`
                            <li class="media row-${image.id}">
                                <div class="media-body mb-1">
                                  <p class="mb-2">
                                    <strong>${image.caption}</strong> - Status: <span class="status text-uploading">Uploaded</span>
                                    <button class="btn btn-small btn-sm btn-danger remove-row "  data-id='${image.id}' type="button" >Remove</button>
                                  </p>
                                  <div class="progress mb-2">
                                    <div class="progress-bar progress-bar-striped progress-bar-animated bg-primary bg-" role="progressbar" style="width: 100%;" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">100%</div>
                                    </div>
                                </div>
                            </li>
                        `);
                            })
                        }
                    }
                }
            });
        });
        $(document).on('click', '.delete_library', function () {
            const confirmBox = confirm('Are you sure you want to delete this library');

            if (confirmBox) {

                const library_id = $(this).attr('rel');
                const btn = $(this);
                $.ajax({
                    url: '{{LINK aj/ap/delete-library}}',
                    type: 'POST',
                    data: {library_id: library_id},

                    beforeSend: function () {
                        //$('.wait-wave').text('Please wait..');
                    },
                    success: function (data) {
                        if (data.status === 200) {
                            $(btn).closest('tr').remove();
                            $('#alert-container').html(`
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            Library has been deleted successfully
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    `);
                        }
                        $('.wait-wave').text('');
                    }
                });
            }
        });

        $(document).on('click', '.remove-row', function () {
            let id = $(this).data('id');

            $(`.row-${id}`).remove();
            $(`#hidden-${id}`).remove();

        });
    </script>

</div>
