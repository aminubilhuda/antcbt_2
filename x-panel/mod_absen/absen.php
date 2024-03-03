<div class='row'>
    <div class='col-md-3'></div>
    <div class='col-md-6'>
        <div class='box box-solid'>
            <div class='box-header with-border'>
                <h3 class='box-title'>Daftar Hadir Peserta</h3>
                <div class='box-tools pull-right '>
                    <button id='btnabsen' class='btn btn-sm btn-flat btn-success'
                        onclick="frames['frameresult'].print()"><i class='fa fa-print'></i> Print</button>
                </div>
            </div><!-- /.box-header -->
            <div class='box-body'>
                <?= $info ?>
                <div class='form-group'>
                    <div class='form-group'>
                        <label>Pilih Ruang</label>
                        <select id='absenruang' class='form-control' onchange=printabsen();>
                            <option>Pilih Ruang</option>
                            <?php $sql_ruang = mysqli_query($koneksi, "SELECT * FROM ruang"); ?>
                            <?php while ($ruang = mysqli_fetch_array($sql_ruang)) : ?>
                            <option value="<?= $ruang['kode_ruang'] ?>"><?= $ruang['keterangan'] ?></option>
                            <?php endwhile ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="">Nama Proktor</label>
                        <select class="form-control" name="proktor" id="proktor" required onchange=printabsen();>
                            <option value="AMINU BIL HUDA">AMINU BIL HUDA</option>
                            <option value="DYNAR CANDRA SUKMAWAN, S.Pd">DYNAR CANDRA SUKMAWAN, S.Pd</option>
                        </select>
                        <!-- <input type="text" class="form-control" name="proktor" id="proktor" value="" required
                            onchange=printabsen();> -->
                    </div>
                </div>
            </div><!-- /.box-body -->
        </div><!-- /.box -->
    </div>
</div>
<iframe id='loadabsen' name='frameresult' src='mod_absen/print_absen.php'
    style='border:none;width:0px;height:0px;'></iframe>
<script>
function printabsen() {
    var idruang = $('#absenruang option:selected').val();
    var proktor = $('#proktor').val();
    $('#loadabsen').attr('src', 'mod_absen/print_absen.php?id_ruang=' + idruang + '&proktor=' + proktor);
}
</script>