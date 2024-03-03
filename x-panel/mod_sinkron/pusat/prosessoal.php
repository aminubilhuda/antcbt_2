<?php
require "../../../config/config.default.php";

$domain = 'https://nilai.abdinegara.com';

if ($koneksi) {
    $kode = $_POST['kode'];
    $query = mysqli_query($koneksi, "SELECT * FROM mapel WHERE id_mapel in (" . $kode . ")");
    $cek = mysqli_num_rows($query);
    if ($cek <> 0) {
        $array_mapel = array();
        while ($mapel = mysqli_fetch_assoc($query)) {
            $array_mapel[$mapel['id_mapel']] = $mapel;
            $cari_soal = mysqli_query($koneksi, "SELECT * FROM soal WHERE id_mapel = $mapel[id_mapel]");
            if (mysqli_num_rows($cari_soal) <> 0) {
                while ($soal = mysqli_fetch_assoc($cari_soal)) {
                    $array_mapel[$mapel['id_mapel']]['soal'][] = $soal;
                }
            }
        }
        $payload = json_encode($array_mapel);

        $url = $domain.'/syncsoal.php?token=' . $setting['token_api'];


        //Initiate cURL.
        $ch = curl_init($url);

        //attach encoded JSON string to the POST fields
        curl_setopt($ch, CURLOPT_POSTFIELDS, $payload);

        //set the content type to application/json
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type:application/json'));

        //return response instead of outputting
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

        //execute the POST request
        $result = curl_exec($ch);

        //close cURL resource
        curl_close($ch);

        if ($result == 'berhasil') {
            echo 'OK';
        } else {
            echo "Gagal";
        }
    }
}
?>