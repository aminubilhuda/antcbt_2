<?php
require("../../config/config.default.php");
require("../../config/config.function.php");
require("../../config/functions.crud.php");
(isset($_SESSION['id_pengawas'])) ? $id_pengawas = $_SESSION['id_pengawas'] : $id_pengawas = 0;
($id_pengawas == 0) ? header('location:index.php') : null;
$id_kelas = @$_GET['id_kelas'];
if (date('m') >= 7 and date('m') <= 12) {
    $ajaran = date('Y') . "/" . (date('Y') + 1);
} elseif (date('m') >= 1 and date('m') <= 6) {
    $ajaran = (date('Y') - 1) . "/" . date('Y');
}
$kelas = mysqli_fetch_array(mysqli_query($koneksi, "SELECT * FROM kelas WHERE id_kelas='$id_kelas'"));
?>
<style>
@page {
    size: A4;
    margin: 20px;
}

body {
    font-size: 12px;
    margin: 0;
    padding: 0;
}

.container {
    display: flex;
    flex-wrap: wrap;
    justify-content: flex-start;
    align-items: flex-start;
    max-width: 100%;
}

.card {
    /* width: calc(50% - 20px); */
    width: 360px;
    /* Lebar tetap dalam piksel */
    height: 280px;
    border: 1px solid #666;
    margin-bottom: 10px;
    /* Mengurangi margin bawah */
    padding: 5px;
    box-sizing: border-box;
    /* margin-right: 10px; */
    /* Mengurangi margin kanan */
    /* margin-top: 20px; */
    /* Mengurangi margin atas */
    margin-left: 10px;
    page-break-inside: avoid;
    outline: 1px solid black;
    /* Garis luar */
    outline-offset: -5px;
    /* Untuk mengatur jarak antara border dan konten */
}

.header {
    text-align: center;
    margin-bottom: 10px;
}

.logo img {
    max-height: 60px;
}

.content {
    margin-top: 10px;
}

.student-info p {
    margin: 5px 0;
}

.ttd {
    text-align: right;
}

.ukuranText {
    font-size: 14px
}

hr {
    background: linear-gradient(to right, red, orange, yellow, green, blue, indigo, violet);
    /* Menerapkan gradient horizontal */
    height: 3px;
    /* Mengatur tinggi garis */
    border: none;
    /* Menghapus border */
    margin: 10px 0;
    /* Mengatur margin atas dan bawah */
}
</style>
</head>

<body>
    <div class="container">
        <?php 
        $siswaQ = mysqli_query($koneksi, "SELECT * FROM siswa WHERE id_kelas='$id_kelas' ORDER BY nama ASC"); 
        $count = 0; // Menghitung jumlah kartu yang telah ditampilkan
        $total_siswa = mysqli_num_rows($siswaQ); // Jumlah total siswa
        ?>
        <?php while ($siswa = mysqli_fetch_array($siswaQ)) : ?>
        <?php
            $nopeserta = $siswa['no_peserta'];
            $count++;
            ?>
        <div class="card">
            <table>
                <tr>
                    <td style="text-align:right; vertical-align:top">
                        <img src='../../foto/logo_tut.svg' height='60px'>
                    </td>
                    <td class="ukuranText">
                        <center>
                            <b>
                                <?= strtoupper($setting['header_kartu']) ?><BR>
                                <?= strtoupper($setting['sekolah']) ?><BR>
                                TAHUN PELAJARAN <?= $ajaran ?>
                            </b>
                        </center>
                    </td>
                    <td>
                    <td style="text-align:right; vertical-align:top">
                        <img src="../../<?= $setting['logo'] ?>" height='60px' />
                    </td>
                    </td>
                </tr>
            </table>
            <hr>
            <table class="content">
                <tr class="student-info">
                    <td style="width: 120px">No Peserta</td>
                    <td>:</td>
                    <td><?= $siswa['no_peserta'] ?></td>
                </tr>
                <tr>
                    <td>Nama </td>
                    <td>:</td>
                    <td width="450px">
                        <font size="2"><?= $siswa['nama'] ?></font>
                    </td>
                </tr>
                <tr>
                    <td>Kelas / Sesi </td>
                    <td>:</td>
                    <td><?= $kelas['nama'] ?> / Sesi <?= $siswa['sesi'] ?></td>
                </tr>
                <tr>
                    <td>Username </td>
                    <td>:</td>
                    <td><b><?= $siswa['username'] ?></b></td>
                </tr>
                <tr>
                    <td>Password </td>
                    <td>:</td>
                    <td><b><?= $siswa['password'] ?></b></td>
                </tr>
                <tr>
                    <td>Ruang </td>
                    <td>:</td>
                    <td><?= $siswa['ruang'] ?></td>
                </tr>
                <tr>
                    <td>No Meja </td>
                    <td>:</td>
                    <td>Meja <?= $siswa['no_meja'] ?></td>
                </tr>
            </table>
        </div>
        <?php if ($count % 6 == 0 || $count == $total_siswa) : ?>
        <div style="width: 100%; height: 20px;"></div> <!-- Untuk memberi jarak antara kartu dan tepi bawah halaman -->
        <div class="card-page-break"></div>
        <?php endif; ?>
        <?php endwhile; ?>
    </div>
</body>