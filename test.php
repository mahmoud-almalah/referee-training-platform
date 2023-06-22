<?php
$allReferees = getAllRefereeing();
?>
<h2>Referees Info</h2>
<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <div class="form-group">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                <path fill="currentColor"
                      d="M13,9H18.5L13,3.5V9M6,2H14L20,8V20A2,2 0 0,1 18,22H6C4.89,22 4,21.1 4,20V4C4,2.89 4.89,2 6,2M17,19V13L14,15.2V13H7V19H14V16.8L17,19Z"/>
            </svg>
            <label>Referee Name</label>
            <select class="form-control select2" name="referee_name" id="refereeName">
                <option value="0">Select Referee Name</option>
                <?php
                foreach ($allReferees as $referee) {
                    if ($referee['role'] == 'referee') {
                        ?>
                        <option value="<?php echo $referee['id']; ?>"><?php echo $referee['first_name'] . ' ' . $referee['last_name'] . ' (' . $referee['country'] . ')'; ?></option>
                        <?php
                    }}
                    ?>
            </select>

        </div>
    </div>
    <div class="col-md-2"></div>
</div>