<div class='modal fade' id='tambahjadwalsusulan' style='display: none;'>
    <div class='modal-dialog'>
        <div class='modal-content'>
            <div class='modal-header bg-primary'>
                <button class='close' data-dismiss='modal'><span aria-hidden='true'><i class='glyphicon glyphicon-remove'></i></span></button>
                <h4 class='modal-title'><i class="fas fa-business-time fa-fw"></i> Tambah Jadwal Ujian Susulan</h4>
            </div>
            <div class='modal-body'>
                <form id="formtambahujiansusulan" method='post'>
                    <div class='form-group'>
                        <label>Nama Jenis Ujian</label>
                        <select name='kode_ujian' class='form-control' required='true'>
                            <option value=''>Pilih Jenis Ujian </option>
                            <?php
                            $namaujianx = mysqli_query($koneksi, "SELECT * FROM jenis where status='aktif' order by nama ASC");
                            while ($ujian = mysqli_fetch_array($namaujianx)) {
                                echo "<option value='$ujian[id_jenis]'>$ujian[id_jenis] - $ujian[nama] </option>";
                            }
                            ?>
                        </select>
                    </div>
                    <div class='form-group'>
                        <div class='row'>
                            <div class='col-md-6'>
                                <label>Tanggal Mulai Ujian</label>
                                <input type='text' name='tgl_ujian' class='tgl form-control' autocomplete='off' required='true' />
                            </div>
                            <div class='col-md-6'>
                                <label>Tanggal Waktu Expired</label>
                                <input type='text' name='tgl_selesai' class='tgl form-control' autocomplete='off' required='true' />
                            </div>
                        </div>
                    </div>
                    <div class='row'>
                        <div class='col-md-4'>
                            <div class='form-group'>
                                <label>Sesi</label>
                                <select name='sesi' class='form-control' required='true'>
                                    <?php
                                    $sesix = mysqli_query($koneksi, "SELECT * from sesi");
                                    while ($sesi = mysqli_fetch_array($sesix)) {
                                        echo "<option value='$sesi[kode_sesi]'>$sesi[kode_sesi]</option>";
                                    }
                                    ?>
                                </select>
                            </div>
                        </div>
                        <div class='col-md-4'>
                            <div class='form-group'>
                                <label>Lama ujian (menit)</label>
                                <input type='number' name='lama_ujian' class='form-control' required='true' id="lamaujian-tambah" />
                            </div>
                        </div>
                        <div class='col-md-4'>
                            <div class='form-group'>
                                <label>Waktu selesai (menit)</label>
                                <i class="fas fa-question-circle text-primary"  data-toggle="tooltip" data-placement="top" title="Waktu untuk tombol selesai bisa diklik"></i>
                                <input type='number' name='waktuselesai' class='form-control' id="waktuselesai-tambah" />
                            </div>
                        </div>
                    </div>

                    <div class='form-group'>
                        <label></label><br>
                        <label>
                            <input type='checkbox' class='icheckbox_square-green' name='acak' value='1' /> Acak Soal
                        </label>
                        <label>
                            <input type='checkbox' class='icheckbox_square-green' name='acakopsi' value='1' /> Acak Opsi
                        </label>
                        <label>
                            <input type='checkbox' class='icheckbox_square-green' name='token' value='1' /> Token Soal
                        </label>

                        <label>
                            <input type='checkbox' class='icheckbox_square-green' name='hasil' value='1' /> Hasil Tampil
                        </label>
                        <label>
                            <input type='checkbox' class='icheckbox_square-green' name='reset' value='1' /> Reset Login
                        </label>
                    </div>
                    <div class='modal-footer'>
                        <button name='tambahjadwal' class='btn btn-sm btn-flat btn-success'><i class='fa fa-check'></i> Simpan Semua</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>