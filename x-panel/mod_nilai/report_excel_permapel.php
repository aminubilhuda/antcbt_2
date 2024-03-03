<?php
require("../../config/config.default.php");
require("../../config/config.function.php");
require("../../config/functions.crud.php");
require("../../config/dis.php");
echo "<style> .str{ mso-number-format:\@; } </style>";
$id_ujian = $_GET['m'];
$id_kelas = $_GET['k'];
$mapel = fetch($koneksi, 'mapel', array('id_mapel' => $id_ujian));
$mata_pelajaran = fetch($koneksi, 'mata_pelajaran', array('kode_mapel'=>$mapel['kode']));
$id_mapel = $mapel['id_mapel'];
if (date('m') >= 7 and date('m') <= 12) {
	$ajaran = date('Y') . "/" . (date('Y') + 1);
} elseif (date('m') >= 1 and date('m') <= 6) {
	$ajaran = (date('Y') - 1) . "/" . date('Y');
}
$file = "NILAI_" . $id_kelas . "_" . $mapel['nama'];
$file = str_replace(" ", "-", $file);
$file = str_replace(":", "", $file);
header("Content-type: application/octet-stream");
header("Pragma: no-cache");
header("Expires: 0");
header("Content-Disposition: attachment; filename=" . $file . ".xls"); ?>

<table style="font-weight:bold;">
	<tr>
		<td colspan="27" style="text-align:center;">DAFTAR NILAI</td>
	</tr>
	<tr>
		<td colspan="27" style="text-align:center;">UJIAN SATUAN PENDIDIKAN</td>
	</tr>
	<tr>
		<td colspan="27" style="text-align:center;">SMK ABDI NEGARA TUBAN</td>
	</tr>
	<tr>
		<td colspan="27" style="text-align:center;">TAHUN PELAJARAN 2022/2023</td>
	</tr>
</table>

Mata Pelajaran : <?= $mata_pelajaran['nama_mapel'] ?><br />
Jumlah Soal : <?= $mapel['jml_soal'] ?> PG<br />

<table border='1'>
	<tr>
		<td rowspan='2' style="vertical-align:middle; text-align:center;">No.</td>
		<td rowspan='2' style="vertical-align:middle; text-align:center;">NIS</td>
		<td rowspan='2' style="vertical-align:middle; text-align:center;">Nama</td>
		<td rowspan='2' style="vertical-align:middle; text-align:center;">Kelas</td>
		<td rowspan='2' style="vertical-align:middle; text-align:center;">Benar</td>
		<td rowspan='2' style="vertical-align:middle; text-align:center;">Salah</td>
		<td rowspan='2' style="vertical-align:middle; text-align:center;">Nilai</td>
		<td colspan='<?= $mapel['jml_soal'] ?>' style="vertical-align:middle; text-align:center;">Jawaban</td>

	</tr>
	<tr><?php
		for ($num = 1; $num <= $mapel['jml_soal']; $num++) {
			$soal = fetch($koneksi, 'soal', array('id_mapel' => $id_mapel, 'nomor' => $num));
		?>
			<td><?= $num ?></td>
		<?php } ?>
		<?php
		for ($num = 1; $num <= $mapel['jml_esai']; $num++) {
			$soal = fetch($koneksi, 'soal', array('id_mapel' => $id_mapel, 'nomor' => $num));
		?>
			<td><?= $num ?></td>
		<?php } ?>

	</tr>

	<?php

	$siswaQ = mysqli_query($koneksi, "SELECT * FROM siswa WHERE id_kelas = '$id_kelas' ORDER BY nama ASC");
	$betul = array();
	$salah = array();
	while ($siswa = mysqli_fetch_array($siswaQ)) {
		$no++;
		$benar = $salah = 0;
		$skor = $lama = '-';
		$query_nilai = mysqli_query($koneksi, "SELECT * FROM nilai WHERE id_mapel = '".$id_mapel."' AND id_siswa = '".$siswa['id_siswa']."'");
		$nilai = mysqli_fetch_array($query_nilai);
		// $nilai = fetch($koneksi, 'nilai', array('id_mapel' => $id_mapel, 'id_siswa' => $siswa['id_siswa']));
	?>
		<tr>
			<td><?= $no ?></td>
			<td><?= $siswa['nis'] ?></td>
			<td><?= $siswa['nama'] ?></td>
			<td><?= $siswa['id_kelas'] ?></td>
			<td><?= $nilai['jml_benar'] ?></td>
			<td><?= $nilai['jml_salah'] ?></td>
			<td class='str'><?= round($nilai['skor'], 2) ?></td>
			<?php

			if (mysqli_num_rows($query_nilai) != 0) {
				$jawaban = unserialize($nilai['jawaban']);
				foreach ($jawaban as $key => $value) {

					$soal = mysqli_fetch_array(mysqli_query($koneksi, "select * from soal where id_soal='$key' order by nomor ASC"));
					$nomor = $soal['nomor'];
					if ($soal) {
						if ($value == $soal['jawaban']) { ?>

							<td style='background:#00FF00;'><?= $value ?></td>
						<?php } else { ?>
							<?php if ($value == 'X') { ?>
								<td style='background:#bbd1de;'><?= $value ?></td>
							<?php } else { ?>
								<td style='background:#FF0000;'><?= $value ?></td>
							<?php } ?>
						<?php }
					} else { ?>
						<td>-</td>
				<?php }
				}
			} else {
				echo "<td colspan='".$mapel['jml_soal']."'>Tidak mengikuti ujian</td>";
			}
			?>
		</tr>

	<?php } ?>

</table>

<!-- <br>
<table border='1'>
	<tr>
		<th>No.</th>
		<th>Soal</th>
		<th>Menjawab Benar</th>
		<th>Menjawab Salah</th>
		<th>Kategori</th>
	</tr>
	<?php

	$soalq = mysqli_query($koneksi, "SELECT * FROM soal a join mapel b ON a.id_mapel=b.id_mapel  ORDER BY nomor ASC");

	while ($soal = mysqli_fetch_array($soalq)) {
		$no++;
		$nomor = $soal['nomor'];
	?>
		<tr>
			<td><?= $soal['nomor'] ?></td>
			<td><?= $soal['soal'] ?></td>
			
		</tr>

	<?php } ?>

</table> -->
