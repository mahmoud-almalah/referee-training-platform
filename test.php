<?php
$allReferees = getAllRefereeing();
?>
<style>
    .table-responsive1 {
        overflow-x: auto;
    }

    #user-avatar {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        align-items: center;
        margin-right: 10px;
    }

    .change_status {
        margin-bottom: 5px;
    }

    .btn-group-xs > .btn, .btn-xs {
        margin-left: 0;
    }

    .btn-group-xs > .btn, .btn-xs {
        padding: .25rem .4rem;
        font-size: .875rem;
        line-height: .5;
        border-radius: .2rem;
    }

    .btn-success {
        color: #fff;
        background-color: #28a745;
        border-color: #28a745;
    }

    .btn {
        display: inline-block;
        font-weight: 400;
        color: #212529;
        text-align: center;
        vertical-align: middle;
        cursor: pointer;
        border: 1px solid transparent;
        padding: .375rem .75rem;
        font-size: .875rem;
        line-height: 1.5;
        border-radius: .25rem;
    }

    .btn-group-xs > .btn, .btn-xs {
        padding: .25rem .4rem;
        font-size: .875rem;
        line-height: .5;
        border-radius: .2rem;
    }

    .btn-group-xs > .btn, .btn-xs {
        margin-left: 0;
    }

    .btn-danger {
        color: #fff;
        background-color: #dc3545;
        border-color: #dc3545;
    }

    .btn {
        display: inline-block;
        font-weight: 400;
        color: #212529;
        text-align: center;
        vertical-align: middle;
        cursor: pointer;
        border: 1px solid transparent;
        padding: .375rem .75rem;
        font-size: .875rem;
        line-height: 1.5;
        border-radius: .25rem;
    }

    .btn-group-xs > .btn, .btn-xs {
        padding: .25rem .4rem;
        font-size: .875rem;
        line-height: .5;
        border-radius: .2rem;
    }

    .btn-group-xs > .btn, .btn-xs {
        margin-left: 0;
    }

    .btn-primary {
        color: #fff;
        background-color: #007bff;
        border-color: #007bff;
    }

    .btn {
        display: inline-block;
        font-weight: 400;
        color: #212529;
        text-align: center;
        vertical-align: middle;
        cursor: pointer;
        border: 1px solid transparent;
        padding: .375rem .75rem;
        font-size: .875rem;
        line-height: 1.5;
        border-radius: .25rem;
    }
</style>
<div class="container-fluid">
    <div>
        <h3>Manage Refereeing</h3>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="#">Home</a>
                </li>
                <li class="breadcrumb-item">
                    <a href="#">Refereeing</a>
                </li>
                <li class="breadcrumb-item active" aria-current="page">Manage Refereeing</li>
            </ol>
        </nav>
    </div>
    <div class="row">
        <div class="col-lg-12 col-md-12">
            <div class="card">
                <div class="card-body">
                    <h6 class="card-title">Manage Refereeing</h6>
                    <div class="d-settings-alert"></div>
                    <div class="clearfix"></div>
                    <div class="table-responsive1">
                        <table class="table table-bordered table-striped table-hover" id="video-table">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Full Name</th>
                                <th>Country</th>
                                <th>Role</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php
                                foreach ($allReferees as $referees){
                            ?>
                            <tr id="<?php echo $referees['id']; ?>">
                                    <td><?php echo $referees['id']; ?></td>
                                    <td><?php echo $referees['first_name'] . ' ' . $referees['last_name']; ?></td>
                                    <td><?php echo $referees['country']; ?></td>
                                    <td><?php echo $referees['role']; ?></td>
                                    <td>
                                        <?php
                                            if ($referees['status'] == 'Positive'){
                                                echo '<span class="badge badge-success">Active</span>';
                                            }else{
                                                echo '<span class="badge badge-danger">Inactive</span>';
                                            }
                                        ?>
                                    </td>
                                    <td>
                                    </td>
                                </tr>

                            <?php
                                }
                            ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>