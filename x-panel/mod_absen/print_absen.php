<?php
require("../../config/config.default.php");
require("../../config/config.function.php");
require("../../config/functions.crud.php");

(isset($_SESSION['id_pengawas'])) ? $id_pengawas = $_SESSION['id_pengawas'] : $id_pengawas = 0;
($id_pengawas == 0) ? header('location:index.php') : null;
$idserver = $setting['kode_sekolah'];
echo "<link rel='stylesheet' href='$homeurl/dist/css/cetak.min.css'>";

$getruang = @$_GET['id_ruang'];
$getproktor = @$_GET['proktor'];

$lebarusername = '10%';
$lebarnopes = '18%';

if (date('m') >= 7 and date('m') <= 12) {
    $ajaran = date('Y') . "/" . (date('Y') + 1);
} elseif (date('m') >= 1 and date('m') <= 6) {
    $ajaran = (date('Y') - 1) . "/" . date('Y');
}

$cariruang = mysqli_fetch_array(mysqli_query($koneksi, "SELECT * FROM ruang WHERE kode_ruang='$getruang'"));
$ruang = $cariruang['kode_ruang'];
$ruangan = $cariruang['keterangan'];
$proktor = $cariruang['proktor'];
$setting = mysqli_fetch_array(mysqli_query($koneksi, "SELECT * FROM setting WHERE id_setting='1'"));
$jenis = mysqli_fetch_array(mysqli_query($koneksi, "SELECT * FROM jenis WHERE status = 'aktif'"));

$querysesi = mysqli_query($koneksi, "SELECT sesi FROM siswa WHERE ruang = '$ruang' GROUP BY sesi");

while ($sesii = mysqli_fetch_array($querysesi)):
    $sesi = $sesii['sesi'];

    $querykelas = mysqli_query($koneksi, "SELECT id_kelas FROM siswa WHERE ruang = '$ruang' AND sesi = '$sesi' GROUP BY id_kelas");

    while ($kelass = mysqli_fetch_array($querykelas)):
        $kelas = $kelass['id_kelas'];

        $ckck = mysqli_query($koneksi, "SELECT * FROM siswa WHERE sesi='$sesi' and ruang='$ruang' and id_kelas='$kelas'");

        $jumlahData = mysqli_num_rows($ckck);
if ($jumlahData == 0) {
    echo "<span style='font-size:30; color:red'>Tidak ada Peserta Ujian dengan mapel" . $mapelx["nama"] . ", pada: <br>= sesi: " . $sesi . ", <br>= ruang: " . $ruangan . ", <br>= kelas: " . $kelas . "</span>";
    echo mysqli_error($koneksi);
    die;
}
$jumlahn = '25';
$n = ceil($jumlahData / $jumlahn);

$nomer = 1;

$date = date_create($cektanggal['tgl_ujian']);
?>

<?php for ($i = 1; $i <= $n; $i++) : ?>
    <?php
    $mulai = $i - 1;
    $batas = ($mulai * $jumlahn);
    $startawal = $batas;
    $batasakhir = $batas + $jumlahn;
    ?>

    <?php if ($i == $n) : ?>
        <div class='page'>
            <table width='100%'>
                <tr>
                    <!-- <td width='100'><img src='../../foto/logo_tut.svg' width='80'></td> -->
                    <td width='150' style="text-align:center;"><img src="<?= $homeurl . '/' . $setting['logo'] ?>" height='75'></td>
                    <td style="text-align:center">
                        <strong class='f12'>
                            BERITA ACARA <BR>
                            <?= strtoupper($jenis['nama']) ?> <BR>
                            TAHUN PELAJARAN <?= $ajaran ?><BR>
                            <?= $setting['sekolah'] ?>
                        </strong>
                    </td>
                    <!-- <td width='100'><img src="<?= $homeurl . '/' . $setting['logo'] ?>" height='75'></td> -->
                    <td width='150'>&nbsp;</td>
                </tr>
            </table>
            <table class='detail'>
                <tr>
                <td>
                    <p style="line-height: 2em; font-size: 13">Pada hari ini &nbsp;<span style='width:90px;'>&nbsp;</span>&nbsp;
                    tanggal &nbsp;<span style='width:150px;'>&nbsp;</span>&nbsp; bulan &nbsp;<span style='width:90px;'>&nbsp;</span>&nbsp; tahun <?= ucwords(terbilang(date("Y"))) ?> telah
                    diselenggarakan <?= ucwords($jenis['nama']) ?> untuk mata pelajaran &nbsp;<span
                        style='width:240px;'>&nbsp;</span>&nbsp; dari pukul &nbsp;<span style='width:90px;'>&nbsp;</span>&nbsp;
                    sampai dengan pukul &nbsp;<span style='width:90px;'>&nbsp;</span>&nbsp; di Ruang <?= $ruangan ?> Sesi
                    <?= $sesi ?>.</p>
                </td>
                </tr>
                <tr>
                <td style="text-align:center">
                    <strong class='f12'>DAFTAR HADIR SISWA <?= $kelas ?></strong>
                </td>
                </tr>
            </table>
            <table class='it-grid it-cetak' width='100%'>
                <tr height=40px>
                    <th>No.</th>
                    <!-- <th>Username</th> -->
                    <th>Nomor Peserta</th>
                    <th>Nama Peserta<BR> </th>
                    <th>Kelas</th>
                    <th>Tanda Tangan</th>
                    <th>Ket</th>
                </tr>
                <?php
                    $ckck = mysqli_query($koneksi, "SELECT * FROM siswa WHERE sesi='$sesi' AND ruang='$ruang' AND id_kelas='$kelas' limit $batas,$jumlahn");
                ?>
                <?php while ($f = mysqli_fetch_array($ckck)) : ?>
                    <?php if ($nomer % 2 == 0) : ?>
                        <tr>
                            <td style="text-align:center;width:15">&nbsp;<?= $nomer ?>.</td>
                            <!-- <td width='<?= $lebarusername ?>' style="text-align:center">&nbsp;<?= $f['username'] ?></td> -->
                            <td width='<?= $lebarnopes ?>' style="text-align:center">&nbsp;<?= $f['no_peserta'] ?></td>
                            <td width='*'>&nbsp;<?= $f['nama'] ?></td>
                            <td width='100' style="text-align:center">&nbsp;<?= $f['id_kelas'] ?></td>
                            <td width='150'><span style='float:right;width:80px;'>&nbsp;<?= $nomer ?>.</span></td>
                            <td width='6%'>&nbsp;</td>
                        </tr>
                    <?php else : ?>
                        <tr>
                            <td style="text-align:center;width:15">&nbsp;<?= $nomer ?>.</td>
                            <!-- <td width='<?= $lebarusername ?>' style="text-align:center">&nbsp;<?= $f['username'] ?></td> -->
                            <td width='<?= $lebarnopes ?>' style="text-align:center">&nbsp;<?= $f['no_peserta'] ?></td>
                            <td width='*'>&nbsp;<?= $f['nama'] ?></td>
                            <td width='100' style="text-align:center">&nbsp;<?= $f['id_kelas'] ?></td>
                            <td width='150'><span style='float:left;width:80px;'>&nbsp;<?= $nomer ?>.</span></td>
                            <td width='6%'>&nbsp;</td>
                        </tr>
                    <?php endif; ?>
                    <?php
                    $nomer++;
                    $jlhhdr = ($nomer - 1);
                    ?>
                <?php endwhile; ?>
            </table>
            <!-- <table>
                <tr>
                    <td colspan='2'><strong><i>Keterangan : </i></strong></td>
                </tr>
                <tr>
                    <td>1. Dibuat rangkap 3 (tiga), masing-masing untuk sekolah, Cabang Dinas dan Provinsi.</td>
                </tr>
                <tr>
                    <td>2. Pengawas ruang menyilang Nama Peserta yang tidak hadir.</td>
                </tr>
            </table> -->
            <br>
            <table width='100%'>
                <tr>
                    <td>
                        <table style='border:1px solid black'>
                            <tr>
                                <td>Jumlah Peserta yang Seharusnya Hadir</td>
                                <td>:</td>
                                <td> <?= $jlhhdr ?> orang</td>
                            </tr>
                            <tr>
                                <td>Jumlah Peserta yang Tidak Hadir</td>
                                <td>:</td>
                                <td>_____ orang</td>
                            </tr>
                            <tr style='border-top:1px solid black'>
                                <td>Jumlah Peserta Hadir</td>
                                <td>:</td>
                                <td>_____ orang</td>
                            </tr>
                        </table>
                    </td>
                    <td style="text-align:center; width:200">
                        Proktor<BR><BR><BR><BR><BR>(<?= $getproktor ?>)
                    </td>
                    <td style="text-align:center; width:175">
                        Pengawas<BR><BR><BR><BR><BR>(<nip></nip>)
                    </td>
                </tr>
            </table>
            <div class='footer'>
                <table width='100%' height='30'>
                    <tr>
                        <td width='25px' style='border:1px solid black'></td>
                        <td width='5px'>&nbsp;</td>
                        <td style='border:1px solid black;font-weight:bold;font-size:14px;text-align:center;'><?= strtoupper($jenis['nama']) ?> <?= $setting['sekolah'] ?></td>
                        <td width='5px'>&nbsp;</td>
                        <td width='25px' style='border:1px solid black'></td>
                    </tr>
                </table>
            </div>
        </div>
        <?php break; ?>
    <?php endif; ?>
    <div class='page'>
        <table width='100%'>
            <tr>
                <!-- <td width='100'><img src='../../foto/logo_tut.svg' width='80'></td> -->
                <td width='150' style="text-align:center;"><img src="<?= $homeurl . '/' . $setting['logo'] ?>" height='75'></td>
                <td style="text-align:center">
                    <strong class='f12'>
                        BERITA ACARA <BR>
                        <?= strtoupper($jenis['nama']) ?><BR>
                        TAHUN PELAJARAN <?= $ajaran ?><BR>
                        <?= $setting['sekolah'] ?>
                    </strong>
                </td>
                <!-- <td width='100'><img src="<?= $homeurl . '/' . $setting['logo'] ?>" height='75'></td> -->
                <td width='150'>&nbsp;</td>
            </tr>
        </table>
        <table class='detail'>
            <tr>
            <td>
                <p style="line-height: 2em; font-size: 13">Pada hari ini &nbsp;<span style='width:90px;'>&nbsp;</span>&nbsp;
                tanggal &nbsp;<span style='width:150px;'>&nbsp;</span>&nbsp; bulan &nbsp;<span style='width:90px;'>&nbsp;</span>&nbsp;
                tahun <?= ucwords(terbilang(date("Y"))) ?> telah diselenggarakan <?= ucwords($jenis['nama']) ?> untuk mata pelajaran &nbsp;<span
                    style='width:240px;'>&nbsp;</span>&nbsp; dari pukul &nbsp;<span style='width:90px;'>&nbsp;</span>&nbsp;
                sampai dengan pukul &nbsp;<span style='width:90px;'>&nbsp;</span>&nbsp; di Ruang <?= $ruangan ?> Sesi
                <?= $sesi ?>.</p>
            </td>
            </tr>
            <tr>
            <td style="text-align:center">
                <strong class='f12'>DAFTAR HADIR SISWA <?= $kelas ?></strong>
            </td>
            </tr>
        </table>

        <table class='it-grid it-cetak' width='100%'>
            <tr height=40px>
                <th>No.</th>
                <!-- <th>Username</th> -->
                <th>Nomor Peserta</th>
                <th>Nama Peserta<BR> </th>
                <th>Kelas</th>
                <th>Tanda Tangan</th>
                <th>Ket</th>
            </tr>
            <?php
            $s = $i - 1;

            $ckck = mysqli_query($koneksi, "SELECT * FROM siswa WHERE sesi='$sesi' and ruang='$ruang' and id_kelas='$kelas' limit $batas,$jumlahn");
            ?>
            <?php while ($f = mysqli_fetch_array($ckck)) : ?>
                <?php if ($nomer % 2 == 0) : ?>
                    <tr>
                        <td style="text-align:center;width:15">&nbsp;<?= $nomer ?>.</td>
                        <!-- <td width='<?= $lebarusername ?>' style="text-align:center">&nbsp;<?= $f['username'] ?></td> -->
                        <td width='<?= $lebarnopes ?>' style="text-align:center">&nbsp;<?= $f['no_peserta'] ?></td>
                        <td width='*'>&nbsp;<?= $f['nama'] ?></td>
                        <td width='100' style="text-align:center">&nbsp;<?= $f['id_kelas'] ?></td>
                        <td width='150'><span style='float:right;width:80px;'>&nbsp;<?= $nomer ?>.</span></td>
                        <td width='6%'>&nbsp;</td>
                    </tr>
                <?php else : ?>
                    <tr>
                        <td style="text-align:center;width:15">&nbsp;<?= $nomer ?>.</td>
                        <!-- <td width='<?= $lebarusername ?>' style="text-align:center">&nbsp;<?= $f['username'] ?></td> -->
                        <td width='<?= $lebarnopes ?>' style="text-align:center">&nbsp;<?= $f['no_peserta'] ?></td>
                        <td width='*'>&nbsp;<?= $f['nama'] ?></td>
                        <td width='100' style="text-align:center">&nbsp;<?= $f['id_kelas'] ?></td>
                        <td width='150'><span style='float:left;width:80px;'>&nbsp;<?= $nomer ?>.</span></td>
                        <td width='6%'>&nbsp;</td>
                    </tr>
                <?php endif; ?>
                <?php
                $nomer++;
                $jlhhdr = ($nomer - 1);
                ?>
            <?php endwhile; ?>
        </table>

        <div class='footer'>
            <table width='100%' height='30'>
                <tr>
                    <td width='25px' style='border:1px solid black'></td>
                    <td width='5px'>&nbsp;</td>
                    <td style='border:1px solid black;font-weight:bold;font-size:14px;text-align:center;'> <?= strtoupper($jenis['nama']) ?> <?= $setting['sekolah'] ?></td>
                    <td width='5px'>&nbsp;</td>
                    <td width='25px' style='border:1px solid black'></td>
                </tr>
            </table>
        </div>
    </div>
<?php endfor; ?>
        <?php
    endwhile;
endwhile;
?>
